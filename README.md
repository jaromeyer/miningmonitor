# miningmonitor

Simple ESP8266 program to show Ethereum price and stats from your mining rig on an OLED display

## Getting Started

You will need an ESP8266 board and a SD1306 OLED display to build this project.

### Wiring

Connect 3.3v to 3.3v, GND to GND, SDA to D3 and SCL to D4. You can use other GPIO pins if you like, but make sure to update the pin numbers at the top of update_display.lua.

### Flashing the firmware

You can either use the included NodeMCU build or make your own at https://nodemcu-build.com/. Just make sure that the modules cjson, file, gpio, http, i2c, net, node, tmr, u8g, uart, wifi and the fonts fub14 and 6x10 are included. You also need to tick 'TLS/SSL support' towards the bottom of the page. Flash the firmware with your preferred tool. I used this one: https://github.com/marcelstoer/nodemcu-pyflasher.

### Uploading the code

Again you can use your preferred tool but I recommend [ESPlorer](https://esp8266.ru/esplorer). In ESPlorer, open the 3 LUA files in the left part, connect to your ESP8266 (sometimes you have to reset the ESP8266 for the tool to recognise it) and click "Save to ESP" for each of the 3 files. Also don't forget to set your SSID and password before you upload init.lua!

## Authors

* **kieranc** - *Initial work* - [kieranc](https://hackaday.io/KieranC001)
* **Jaro Meyer** - *Adding support for Ethereum, mining stats and various other things* - [o0pwnd0o](https://github.com/o0pwnd0o)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
