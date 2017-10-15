#! /usr/bin/bash

#-------------------------------------------------------------------------------
# Get current dwarfpool mining ballance
#-------------------------------------------------------------------------------
DETP='[0-9]+.[0-9]+ XMR</span>\nCurrent balance<br>'
CUTP='[0-9]\+.[0-9]\+'

DP_XMR_ADDRESS=$(cat $HOME/.crypto/wallets/monero/mining/mining.address.txt)

if [ ! -z ${DP_XMR_ADDRESS+x} ]; then
	MINING_ADDR=https://dwarfpool.com/xmr/address?wallet=$DP_XMR_ADDRESS
	curl -s -X GET $MINING_ADDR | pcregrep -M "$DETP" | grep -o "$CUTP"
else
	echo "N/A"
fi
