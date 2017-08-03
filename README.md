# R.E.A.C.T
Purpose: The purpose of this script is to give Security Analysts enough "reaction time" (R.E.A.C.T) to effectively process an overflowing amount of data from multiple sources, searching for any potentially malicious indicators from any clipboard-copied source to get the information you need to help block intruders on a network as quickly as possible. It achieves this through URL sanitizing/de-sanitizing, pulling IP/URL information buried in any long-winded document, and an incomplete IP-to-Country-Code lookup request using ARIN Whois with unlimited lookup requests. 

The primary goal from this script is to provide security analysts with lightning-fast responses so that they can act much faster with greater volume. As a disclaimer, please test this code on your own to familiarize yourself with the shortcomings, limitations this program contains: https://github.com/espressobeanies/R.E.A.C.T/blob/master/REACT.sh

Please note, there is a similar script out there that provides ARIN Whois information written in Python and although it is similar to the IPtoCountry lookup process, it does not provide the same output. If I find it again, I'll be sure to post a link here for comparison.

Prerequesites: Ubuntu XFCE, mousepad, xclip
Note: mousepad can be substituted for your GUI-based text editor of choice and xclip is available in the CentOS 7 repos
