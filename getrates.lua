function getethrate()
http.get("https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=CHF", nil, function(code, dataeth)
    if (code < 0) then
      ethrateoffline=true
    else
      -- Decode JSON data
      m = cjson.decode(dataeth)
      -- Extract and round ETH/CHF price from decoded JSON
      ethrate = string.format("%d", m[1]["price_chf"]+0.5);
      -- Extract 24d and 7d change from decoded JSON
      ethchange = "24h " .. m[1]["percent_change_24h"] .. "% 7d " .. m[1]["percent_change_7d"] .. "%"
      ethrateoffline=false
      end
      getpoolstats()
  end)
end

function getpoolstats()
http.get("https://api.nanopool.org/v1/eth/user/0x4784d0b8fdbb3df590c606aca3356522ced4070a", nil, function(code, datapoolstats)
    if (code < 0) then
      pooloffline=true
    else
      -- Decode JSON data
      n = cjson.decode(datapoolstats)
      -- Extract stats from decoded JSON
      currhashrate = string.format("%3.1f MH/s", n["data"]["hashrate"]);
      avghashrate = "1h " .. n["data"]["avgHashrate"]["h1"] .. " 24h " .. n["data"]["avgHashrate"]["h24"]
      pooloffline=false
      end
      dofile('update_display.lua')
  end)
end

node.task.post(getethrate);
