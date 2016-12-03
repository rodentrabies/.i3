#! /bin/sh

data=$(curl -sL https://coinbase.com/api/v1/prices/historical)
if [[ ! -z $data ]]; then
	printf "%s" "$data" | head -n 1 | sed "s|^.*,|$|" | sed "s|\(\.[0-9]$\)|\10|"
else
	echo "  N/A "
fi
