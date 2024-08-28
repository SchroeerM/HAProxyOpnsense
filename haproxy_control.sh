#!/bin/sh

# Definiere die CARP-Interface-Variable (ändere sie entsprechend deiner Umgebung)
CARP_INTERFACE="vhid10"

# Status des CARP-Interfaces abfragen
CARP_STATUS=$(ifconfig $CARP_INTERFACE | grep 'carp: MASTER' | wc -l)

# HAProxy steuern
if [ "$CARP_STATUS" -eq 1 ]; then
    # Wenn CARP Master, starte HAProxy
    if ! pgrep -x "haproxy" > /dev/null
    then
        echo "Starting HAProxy as this is the CARP Master."
        service haproxy start
    else
        echo "HAProxy is already running."
    fi
else
    # Wenn nicht CARP Master, stoppe HAProxy
    if pgrep -x "haproxy" > /dev/null
    then
        echo "Stopping HAProxy as this is not the CARP Master."
        service haproxy stop
    else
        echo "HAProxy is already stopped."
    fi
fi
