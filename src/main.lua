--config
execver = "00.00.03 +B/GENERAL PURPOSE" --version number
frameno = 0
debugdelta = 0
debugfps = 0
framelimiterval = 59.94
closeoninput = false
shouldcloseoninput = false
optionsmode = false
debugmode = true
widescreensupport = true

--Implimentation of table.find() from LUAU because it's usefull n' shit
function tablefind(table,needle)
for i,v in pairs(table) do
if v == needle then
return v --If found return the value called
end
end
return nil --If nothing, return nil
end

function tablefindwildcard(table,needle) --Same as above but with wildcards because of Control Panel
for i,v in pairs(table) do
if string.match(v,needle) then
return v
end
end
return nil
end


--IPL
function love.load(args)
love.window.setTitle("OVKL ToolSys: " .. execver)
love.window.setVSync(0)
love.window.setDisplaySleepEnabled(false)
--if love.system.getOS() ~= "Windows" then
--success = love.window.showMessageBox("Unsuported operating system,", "This program is designed only for windows", "info", false )
--love.event.quit()
--end
--love.mouse.setVisible(false)

for i,v in pairs(args) do
print(v)
end

--Load config data used for the screensaver
--Save data patched out since this is meant to run on an android tablet as an experiment
--savedata = love.filesystem.read("targettime.txt")

if not savedata then
print("Save data missing, generating")
--love.filesystem.write("targettime.txt","120")

savedata = 120
end

--savedata2 = love.filesystem.read("screenmode.txt")

if not savedata2 then
print("Save data missing, generating")
--love.filesystem.write("screenmode.txt","1")

--savedata2 = love.filesystem.read("screenmode.txt")
end

--My tablet is widescreen only, this is patched out for this reason
--if savedata2 == "2" then
--widescreensupport = true
--end

--Control panel thingies that isn't needed
--[[
if tablefind(args,"/c") or tablefindwildcard(args,"/c:*") then --Configuration mode, called when you press the "configure" button from either the context menu or the control panel
love.window.setMode(800,600,{borderless=true})
optionsmode = true
end

if tablefind(args,"/p") then --Love2D doesn't properly support the shit needed for a functioning preview screen within the control panel so, you'll get this instead
if debugmode == false then
love.event.quit()
end


if widescreensupport == true then
love.window.setMode(1280,720,{borderless=true})
else
love.window.setMode(800,600,{borderless=true})
end

end

if tablefind(args,"/s") or tablefind(args,"/S") then --The regular fullscreen
if widescreensupport == true then
love.window.setMode(1280,720)
else
love.window.setMode(800,600)
end

love.window.setFullscreen(true, "exclusive")
shouldcloseoninput = true
end]]

--Attempt to fix a rendering bug on android
if love.system.getOS() ~= "Android" then
love.window.setFullscreen(true, "exclusive")
end

if widescreensupport == true then
love.window.setMode(1280,720)
else
love.window.setMode(800,600)
end

targettime = tonumber(savedata)
starttime = os.time()

--Render systemini
sysfont = love.graphics.newFont("fonts/kochi-gothic-subst.ttf",16)
layer0 = {}
layer1 = {}
layer2 = {}
--framerate limiter
   min_dt = 1/framelimiterval --fps
   next_time = love.timer.getTime()

if optionsmode == false then

--Progs asset


--Very weird widescreen support implementation
if widescreensupport == true then
--Fonts
renderfont = love.graphics.newFont("fonts/DINEngschrift-Regular.ttf",25)
renderfontlarge = love.graphics.newFont("fonts/DINEngschrift-Regular.ttf",64)

--Layer0 assets
table.insert(layer0,{0,0,1280,720,57,99,141}) --Blue BG
table.insert(layer0,{0,0,1280,32,182,182,182}) --White bar
table.insert(layer0,{25,330,1230,64,43,82,121}) --progressbar back
table.insert(layer0,{30,335,1225,54,198,177,35}) --progressbar
barmaxsize = 1230

--Layer1 assets
table.insert(layer1,{"OVKL ToolSys 2.0",3,3,1,0,0,0,renderfont,255})
table.insert(layer1,{"HACKING IN PROGRESS",430,230,1,198,177,35,renderfontlarge,255})
table.insert(layer1,{"ESTIMATED TIME REMAINING",380,440,1,198,177,35,renderfontlarge,255})
table.insert(layer1,{"999 SECONDS",525,500,1,198,177,35,renderfontlarge,255})
else
--Fonts
renderfont = love.graphics.newFont("fonts/DINEngschrift-Regular.ttf",25)
renderfontlarge = love.graphics.newFont("fonts/DINEngschrift-Regular.ttf",64)

--Layer0 assets
table.insert(layer0,{0,0,800,600,57,99,141}) --Blue BG
table.insert(layer0,{0,0,800,32,182,182,182}) --White bar
table.insert(layer0,{40,300,720,64,43,82,121}) --progressbar back
table.insert(layer0,{45,305,710,54,198,177,35}) --progressbar
barmaxsize = 710

--Layer1 assets
table.insert(layer1,{"OVKL ToolSys 2.0",3,3,1,0,0,0,renderfont,255})
table.insert(layer1,{"HACKING IN PROGRESS",180,200,1,198,177,35,renderfontlarge,255})
table.insert(layer1,{"ESTIMATED TIME REMAINING",130,380,1,198,177,35,renderfontlarge,255})
table.insert(layer1,{"999 SECONDS",275,440,1,198,177,35,renderfontlarge,255})
end


textfade = true
bgfade = true

else
print("LOADING OPTIONS")

textinput = ""
selection = 1
selectionmax = 1
screenid = 0

function clearscreen() --clears screen entry
for i,v in pairs(layer1) do
layer1[i] = nil
end
end

function mainscreen() --main options screen
print("loading mainscreen")
table.insert(layer1,{"TARGET TIME",3,64,1,255,255,255,sysfont,255})
table.insert(layer1,{"IN PROGRESS TEXT",3,80,1,255,255,255,sysfont,255})
table.insert(layer1,{"SOUND",3,96,1,255,255,255,sysfont,255})
table.insert(layer1,{"DISPLAY",3,112,1,255,255,255,sysfont,255})
table.insert(layer1,{"EXIT",3,144,1,255,255,255,sysfont,255})

table.insert(layer1,{"UP & DOWN ARROW: MOVE CURSOR    ENTER SW: ENTER",3,176,1,255,255,255,sysfont,255})
table.insert(layer1,{"OVKLTOOLSYSSCR " .. execver .. " CREATED BY @ORILEYTAN (YT) POWERED BY LOVE2D RECOMMENDED VERSION 11.5",3,192,1,255,255,255,sysfont,255})
table.insert(layer1,{"HTTPS://GITHUB.COM/ORILEYTAN/OVKLTOOLSYSSCR",3,208,1,255,255,255,sysfont,255})
selectionmax = 5
screenid = 1
end

function ttscreen() --Target time screen
print("loading Target screen")
textinput = ""
table.insert(layer1,{"EXIT",3,144,1,255,0,0,sysfont,255})
table.insert(layer1,{"TIME: 000",3,64,1,255,255,255,sysfont,255})


table.insert(layer1,{"NUMBER KEY: INPUT NUMBER    ENTER SW: EXIT",3,176,1,255,255,255,sysfont,255})
selectionmax = 1
screenid = 2
end

mainscreen()

end

end

function love.textinput(v)
if optionsmode == true then 
textinput = textinput .. v
print(textinput)
end
end


--Very important to close the exec when input is detected (or screen is tabbed out) because (if the option is enabled) windows only locks the device when the exec has been exited
function love.keypressed(v)
if closeoninput == true then
love.event.quit()
end

if optionsmode == true then
if v == "up" then --Moves menu cursor up
if selection ~= 1 then
selection = selection - 1
else
selection = selectionmax
end
print("Cursor moved up to " .. selection)
end

if v == "down" then --ViceVersa
if selection < selectionmax then
selection = selection + 1
else
selection = 1
end
print("Cursor moved down to " .. selection)
end

if v == "return" then --Menu progression logic

if screenid == 1 then
if selection == 2 or selection == 3 then --Placeholder
love.window.showMessageBox("UNIMPLEMENTED", "This setting has not been implemented", "info", false )
end

if selection == 1 then
clearscreen()
ttscreen()
end

if selection == 4 then
if savedata2 == "1" then
--love.filesystem.write("screenmode.txt","2")
else
--love.filesystem.write("screenmode.txt","1")
end
end

if selection == 5 then --Exit out of options menu
love.event.quit()
end
selection = 1 --Resets cursor
return
end


if screenid == 2 then
print(tonumber(textinput))
--love.filesystem.write("targettime.txt",tonumber(textinput) or 120) --Defaults to 120 if text is inputed instead of numbers

clearscreen()
mainscreen()
end

end




end


end

function love.mousemoved()
if closeoninput == true then
love.event.quit()
end
end

--Game exec
function love.update(dt)
   next_time = next_time + min_dt

debugdelta = dt
frameno = frameno + 1
debugfps = 1/dt

if optionsmode == false then

if frameno == 5 and shouldcloseoninput == true then --To fix a bug that affects Yok.SCR
closeoninput = true
end

if shouldcloseoninput == true then
if love.window.hasFocus() == false then
love.event.quit()
end
end

timeremain = targettime - (os.time() - starttime)
if timeremain < 0 then
layer1[2][1] = "COMPLETED"
layer1[2][2] = 285
timeremain = 0
end

layer0[4][3] = barmaxsize - (timeremain / targettime) * barmaxsize

layer1[4][1] = timeremain .. " SECONDS"

--Patch since this build runs at 60fps
if textfade == true then
layer1[2][9] = layer1[2][9] - 10

if layer1[2][9] < 100 then
textfade = false
end
else
layer1[2][9] = layer1[2][9] + 10
if layer1[2][9] > 254 then
textfade = true
end
end

--Not needed
--[[if bgfade == true then
layer0[1][5] = layer0[1][5] - 0.1
layer0[1][6] = layer0[1][6] - 0.1
layer0[1][7] = layer0[1][7] - 0.1
if layer0[1][5] < 25 then
bgfade = false
end
else
layer0[1][5] = layer0[1][5] + 0.1
layer0[1][6] = layer0[1][6] + 0.1
layer0[1][7] = layer0[1][7] + 0.1
if layer0[1][5] > 50 then
bgfade = true
end
end]]
else
--Options mode logic

--Menu logic
if screenid == 1 then
for i,v in pairs(layer1) do
if i == selection then
v[5] = 255
v[6] = 0
v[7] = 0
else
v[5] = 255
v[6] = 255
v[7] = 255
end
end
end

if screenid == 2 then
layer1[2][1] = "TIME: " .. textinput
end

end
end

--Rendersystem
function love.draw()

--[[
Layer0 (BG Layer)
Draws reqtangles only
dataformat
posx,posy,sizex,sizey,r,g,b

]]
for i,v in pairs(layer0) do
--[[for i,v in pairs(v) do --Debug
print(v)
end]]

love.graphics.setColor(love.math.colorFromBytes(v[5],v[6],v[7]))
love.graphics.rectangle("fill",v[1],v[2],v[3],v[4])
end
--[[
Layer1 (text layer)
Draws text only
dataformat
text,x,y,scale,r,g,b,font,transparency
]]

for i,v in pairs(layer1) do
love.graphics.setFont(v[8])
love.graphics.setColor(love.math.colorFromBytes(v[5],v[6],v[7],v[9]))
love.graphics.print(v[1],v[2],v[3],0,v[4],v[4])
end


--Hardcoded into rendering pipeline
if debugmode == true or optionsmode == true then
love.graphics.setFont(sysfont)
love.graphics.setColor(1,0,0)
love.graphics.print("VER: " .. execver) --Version no
love.graphics.print("FPS: " .. math.floor(debugfps) .. "/" .. framelimiterval .. " FRAME: " .. frameno .. " DELTA: " .. debugdelta,0,16) --FPS counter n shit
end
--framerate limiter
   local cur_time = love.timer.getTime()
   if next_time <= cur_time then
      next_time = cur_time
      return
   end
   love.timer.sleep(next_time - cur_time)
end