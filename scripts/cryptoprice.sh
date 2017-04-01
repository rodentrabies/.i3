#! /bin/sh

#------------------------------------------------------------------------------
# Retrieve <currency>-USD price where <currency> is passed by $1 parameter and
# must be a official cryptocurrency symbol (BTC, XMR, ETC, etc)
#------------------------------------------------------------------------------

data=$(curl -sL https://api.cryptonator.com/api/ticker/$1-usd)

if [[ ! -z $data ]]; then
    echo '$'$(echo $data | jq .ticker.price | tr -d '"' | xargs printf "%.*f" 2) 
else
    echo "N/A"
fi
