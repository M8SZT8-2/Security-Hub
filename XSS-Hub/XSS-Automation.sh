#!/bin/bash
echo -e "\033[31m"
cat <<EOF
=========================================================================================================
==== your target is $1"
=========================================================================================================
EOF

#remove past hack 
echo " ! Remove the past hack "

rm arjun.txt 
rm kxss-output.txt 
rm reports/endpoints.txt
rm output/urls.txt

echo "Now Lets Goooooo"
echo -e "\033[31m"

echo " xss first ===> "
# Run paramspider on the target and save the output to a file
python3 ParamSpider/paramspider.py --domain $1 --output urls.txt 
 
# run kxss scanner with dalfox on th param spider output
cat output/urls.txt | kxss | dalfox pipe > kxss-output.txt

# Read the list of URLs from a file
while read url; do
  # Scan the URL with XSStrike
  python XSStrike/xsstrike.py -u "$url"

  # Add a delay between scans to avoid overwhelming the server
  sleep 5
done < output/urls.txt

# run xsstrike alone with crawling and fuzzing 
python3 XSStrike/xsstrike.py -u $1 --crawl -l 50 

echo "OK lets try SQLI"

#run sqlmap on the parameters to search for sqli
python3 sqlmap-dev/sqlmap.py -m output/urls.txt --banner

# Pass the output of paramspider to dirsearch to find endpoints
python dirsearch/dirsearch.py -l output/urls.txt -e * --exclude-status 404,403  --format=plain --output=reports/endpoints.txt

#run arjun on endpoints 
arjun -i reports/endpoints.txt -w param-wordlist.txt > arjun.txt

echo -e "\033[31m"

echo <<EOF
========================================================================================================
! Mission done  by //////////////////==> h0tak88r <==== //////////////////////////////////
=========================================================================================================
EOF
echo -e "\033[31m"
