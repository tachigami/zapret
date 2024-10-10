#!/bin/sh

# Docs: https://github.com/ndmsystems/packages/wiki/Opkg-Component#ndmnetfilterd

[ "$table" != "mangle" ] && [ "$table" != "nat" ] && exit 0

SCRIPT=$(readlink /opt/etc/init.d/S99zapret)

if [ -n "$SCRIPT" ]; then
	EXEDIR=$(dirname "$SCRIPT")
	ZAPRET_BASE=$(readlink -f "$EXEDIR/../..")
else
	ZAPRET_BASE=/opt/zapret
fi

. "$EXEDIR/functions"

case $MODE in
	nfqws|twps|custom)
		zapret_apply_firewall
	;;
esac
