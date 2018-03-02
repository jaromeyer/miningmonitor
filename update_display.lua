function init_i2c_display()
     sda = 3 -- NodeMCU D3
     scl = 4 -- NodeMCU D4
     sla = 0x3c
     i2c.setup(0, sda, scl, i2c.SLOW)
     disp = u8g.ssd1306_128x64_i2c(sla)
end

-- Change the display every 25 updates to reduce burn-in
if (counter == 25) then
    offset = -3
elseif (counter == 26) then
    offset = 3
elseif (counter == 27) then
    counter = 0
    offset = 0
end

-- Bitmaps stored as strings for ethereum logo.
ethlogo = string.char(0x80, 0x00, 0xc0, 0x01, 0xc0, 0x01, 0xe0, 0x03, 0xf0, 0x07, 0xf0, 0x07, 0xf8, 0x0f, 0xf8, 0x0f, 0xe0, 0x03, 0xc8, 0x09, 0x98, 0x0c, 0x30, 0x06, 0xf0, 0x07, 0xe0, 0x03, 0xc0, 0x01, 0x80, 0x00);

function drawscreen()
     disp:setFont(u8g.font_fub14)
     disp:drawStr( 17+offset, 16, "/CHF:")
     disp:drawStr( 74+offset, 16, ethrate)
     disp:drawStr( 3+offset, 48, currhashrate)
     disp:setFont(u8g.font_6x10)

     if (ethrateoffline) then
        disp:drawStr( 3+offset, 28, "OFFLINE!")
     else
        disp:drawStr( 3+offset, 28, ethchange)
     end

     if (pooloffline) then
        disp:drawStr( 3+offset, 60, "OFFLINE!")
     else
        disp:drawStr( 3+offset, 60, avghashrate)
     end

     disp:drawXBM( 3+offset, 1, 16, 16, ethlogo)
end

if (firstrun) then
    init_i2c_display()
    firstrun=false
end

function update_screen(delay)
      disp:firstPage()
      repeat
           drawscreen()
      until disp:nextPage() == false
      tmr.wdclr()
end

update_screen()
counter= counter + 1;
