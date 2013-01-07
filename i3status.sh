#!/bin/sh
# shell script to prepend i3status with more stuff

i3status --config ~/.i3/status-primary.conf | while :
do
	read line
	MPCSTAT=`mpc | grep -v '^volume:'`
	if [ -z "${MPCSTAT}" ]; then
		echo "$line" || exit 1
	else
		MPCSTAT=`echo "${MPCSTAT}" | sed 's,  *, ,g; 1h;1d;2G' | paste -d' ' -s -`
		echo "${MPCSTAT} $line" || exit 1
	fi
done
