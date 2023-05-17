#!/bin/bash

coproc NCATRX {
  exec ncat --sctp -l 65432
}
PID_TO_KILL=$NCATRX_PID
sleep 0.5
echo "Activate sctp" | ncat --sctp localhost 65432
kill $PID_TO_KILL || true
