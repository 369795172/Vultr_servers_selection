#!/bin/bash
#
# Use Bash to test Vultr ping speeds
# it has 15 looking glass https://www.vultr.com/faq/

declare -A VULTR_PING_SERVERS=(
    [Tokyo]=hnd-jp-ping.vultr.com.
    [Singapore]=sgp-ping.vultr.com.
    [Amsterdam]=ams-nl-ping.vultr.com.
    [Paris]=par-fr-ping.vultr.com.
    [Frankfurt]=fra-de-ping.vultr.com.
    [London]=lon-gb-ping.vultr.com.
    [New_Jersey]=nj-us-ping.vultr.com.
    [Chicago]=il-us-ping.vultr.com.
    [Dallas]=tx-us-ping.vultr.com.
    [Atlanta]=ga-us-ping.vultr.com.
    [Los_Angeles]=lax-ca-us-ping.vultr.com.
    [Miami]=fl-us-ping.vultr.com.
    [Seattle]=wa-us-ping.vultr.com.
    [Silicon_Valley]=sjo-ca-us-ping.vultr.com.
    [Sydney]=syd-au-ping.vultr.com.
    [Toronto]=tor-ca-ping.vultr.com.
    [Seoul]=sel-kor-ping.vultr.com.
)
declare CITY_COUNTER="0"

for CITY in "${!VULTR_PING_SERVERS[@]}"; do
    printf '%02d %s\n' "$((++CITY_COUNTER))" "${CITY//_/ }"
    echo ping -q -c 10 "${VULTR_PING_SERVERS[${CITY}]}"
    echo '============================='
done >vultr-ping.txt
