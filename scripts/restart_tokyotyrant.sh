#!/bin/sh

PORT="${1}"

if [ "x${PORT}" = "x" ]; then
	/usr/bin/logger "${0} - port number not given."
	exit
fi

function restart_proc () {
	/bin/sh /etc/init.d/ttserver.${PORT} restart
	/usr/bin/logger "${0} - ttserver.${PORT} restarted."
}

STATUS=`/bin/sh /etc/init.d/ttserver.${1} status | awk '{print $5}'`
PROC=`ps xa | grep ttserver | grep -v grep | grep ${PORT} -c`

if [ "x${STATUS}" = "xrunning..." ]; then
	if [ ${PROC} -e 0 ]; then
		restart_proc
	fi
	/usr/bin/logger "${0} - ttserver.${PORT} still running."
	exit
else
	restart_proc
fi

# end of script
