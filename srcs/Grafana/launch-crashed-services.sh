pgrep grafana-server
status=$?
if [ $status != 0 ]
then
    exit 1;
fi

pgrep telegraf
status=$?
if [ $status != 0 ]
then
    exit 1;
fi

ps > crash
grep '\[*\]' crash
status=$?
if [ $status != 1 ]
then
    exit 1;
fi
exit 0;
