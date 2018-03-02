wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="YOUR_SSID"
station_cfg.pwd="PASSWORD"
station_cfg.save=true
wifi.sta.config(station_cfg)
-- Initialize variables
firstrun=true
ethrate=0
ethchange=0
offset=0
counter=0
ethrateoffline=false
pooloffline=false
-- Run getrates.lua every 60 seconds
tmr.alarm(0, 60000, 1, function() dofile('getrates.lua') end )
-- Run getrates.lua once, 8 seconds after boot.
tmr.alarm(1, 8000, tmr.ALARM_SINGLE, function() dofile('getrates.lua') end )
