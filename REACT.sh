#!/bin/bash
cd ~/Desktop
while :
do
clear
echo -ne 'REACT - Coded by Dave Florek\n\n:::Main Menu:::\nPlease select a number option.\n1. Sanitize a URL link\n2. De-sanitize a URL link\n3. Extract IP and URL addresses\n4. IPLigence Massive IP Checking\n5. Exit\n'
read opt
case $opt in
1)
echo 'URL Sanitizer'
read -p 'CTRL+C the URL link(s) and press [ENTER] to begin' r
xclip -o | echo $(sed 's/:/[:]/g;s/\./[\.]/g;s/http/hxxp/g') | xclip -selection clipboard
echo 'URL Link Obfuscated! Go ahead and paste the output.'
exit 1;;
2)
echo 'URL De-sanitizer'
read -p 'CTRL+C the URL link(s) and press [ENTER] to begin' r
xclip -o | echo $(sed 's/[:]/:/g;s/[\.]/\./g;s/hxxp/http/g') | xclip -selection clipboard
echo 'URL Link Deobfuscated! Go ahead and paste the output.'
exit 1;;
3)
echo 'URL and IP extraction'
read -p 'CTRL+C the list into clipboard or the master.txt file and press [Enter] to start VM machine extraction.' v
xclip -o >> master.txt
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' master.txt | sort | uniq >> ip_extracted.txt
grep -Eo '[a-zA-Z0-9\.\-]*\.[a-z]{2,4}\b' master.txt | sort | uniq >> url_extracted.txt
#read -p 'Output finished. Would you like to to perform a batch NSLOOKUP on the extracted IP addresses? [y/n]' v1
#if ('$v1'='y')
# then
#  totLines=$(grep -c '.*' ip_extracted.txt)
#   echo $totLines
#    for ((a=0;a!=$totLines;a++)); do
#      cat ip_extracted.txt | sed '$a!d' | nslookup >> NSLOOKUP.txt
#fi
mousepad ip_extracted.txt; url_extracted.txt
read -p 'Press [Enter] to delete all source files when ready.' v2
rm ip_extracted.txt master.txt url_extracted.txt
echo '***Completed.***'
exit 1;;
4)
#!/bin/bash
#The purpose of this script is to replace IPligence.com with a script for
#unlimited IPv4 and eventual IPv6 lookups to determine country of origin.
#This script is highly useful for performing immediate lookup results to
#determine if you need to block something at your firewall.
echo "IPLigence Offline Lookup Script"
read -p "Copy your input list into the clipboard (CTRL+C) and press [Enter] to begin." v
mkdir ipligence_output
cd ipligence_output
xclip -o >> lookup_list.txt
#Pull the IPv4 addresses out of all available lines to another file.
#Count number of available lines
totLines=$(grep -c ".*" lookup_list.txt)
 for ((c=1;c<=$totLines;c++)); do
   whois -H -h whois.arin.net -p 43 $(tail -n+$c lookup_list.txt | head -n1) >> preproc.txt
 done
#Post-processing
grep -w "NetRange:\|Country:\|StateProv:\|City:\|Address\|OrgName:" preproc.txt >> output.csv
mousepad output.csv
read -p "Press [Enter] to delete all source files when ready." v2
cd ~/
rm -R ipligence_output/
echo "***Output Completed.***"
exit 1;;
5)
exit;;
*)
echo 'Invalid entry. Please try again'
esac
done
