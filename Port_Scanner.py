#!bin/python                                                                            
import sys
import socket 
from datetime import datetime 
#Define our target 
if len(sys.argv) == 2:                  
           target = socket.gethostbyname(sys.argv[1]) #translate hostname to IPv4
else :
      print ("Invalid amount of arguments .")
      print("Syntax: python3 scanner.py <ip>")
#add a pretty banner 
print ("_" *50)
print ("M8SZT8 Script")
print ("scanning target " + target )
print ("time started : " +str(datetime.now()))
print ("_"*50)

try:
	 print ("Inter the port scanning range :")
	 print ("the small port first please :)")
	 x = int(input())
	 y = int(input())
	 for port in range(x , y):
         	s = socket. socket(socket.AF_INET, socket.SOCK_STREAM)
         	socket.setdefaulttimeout(1)
         	result = s.connect_ex((target,port))
         	print ("Chicking port{}".format(port))
         	if result == 0:
         		print ("port {} is open".format(port))
         	s.close()
except KeyboardInterrupt:
	print ("\nExiting program.")
	sys.exit()

except socket.gaierror:
             print ("Hostname Could not be resolved .")
             sys.exit()
except socket.error:
             print ("Couldn't connect to server.")
             sys.exit()
