# Use sh to test Vultr ping speeds
# it has 15 looking glass https://www.vultr.com/faq/


echo 01 Tokyo
ping -q hnd-jp-ping.vultr.com -c 10 > vultr_ping.txt
echo =============================
echo 02 Singapore
ping -q sgp-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 03 Amsterdam
ping -q ams-nl-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 04 Paris
ping -q par-fr-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 05 Frankfurt
ping -q fra-de-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 06 London
ping -q lon-gb-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 07 New York
ping -q nj-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 08 Chicago
ping -q il-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 09 Dallas
ping -q tx-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 10 Atlanta
ping -q ga-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 11 Los Angeles
ping -q lax-ca-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 12 Miami
ping -q fl-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 13 Seattle
ping -q wa-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 14 Silicon Valley
ping -q sjo-ca-us-ping.vultr.com -c 10 >> vultr_ping.txt
echo =============================
echo 15 Sydney
ping -q syd-au-ping.vultr.com -c 10 >> vultr_ping.txt
