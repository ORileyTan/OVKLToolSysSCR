MIT License

Copyright (c) 2026 ORileyTan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

This screensaver aims to recreate the "OVKLToolSys" screen seen in PAYDAY 2 as a windows screensaver.

This program is a fan program and not affiliated with Starbreeze AB or OVERKILL Software.

-- Instalation

To register this screensaver to the control panel. Right click on "OVKLToolSysSCR.scr" to bring up the context menu and select "Install".

Dragging the executable (and it's DLLs) into System32 is not recommended due to the DLL files being needed for the screensaver to run and putting all of that into System32 will make it a chore in the event that you want to uninstall this screensaver.

-- Options

To access the options menu, select the screensaver in the control panel screensaver settings and press the "Settings..." button. It will cause the settings screen to open in the center of the screen.

Currently the only options that works are TARGET TIME and DISPLAY.

To select an option to change, you must move the cursor within the options menu with the UP or DOWN arrow keys on the keyboard, the currently selected entry will be highlited red. To change the option press the ENTER key to enter the configuration menu for the selected option.

----------------------------------------------------------------------------------------------
VER: XX.XX.XX
FPS: X/23.976 FRAME: XX DELTA: X.XX


TARGET TIME <-- Cursor is shown as a highlited red text
IN PROGRESS TEXT
SOUND
DISPLAY


EXIT

UP & DOWN ARROW: MOVE CURSOR    ENTER SW:ENTER
OVKLTOOLSYSSCR XX.XX.XX CREATED BY @ORILEYTAN (YT) POWERED BY LOVE2D RECOMMENDED VERSION 11.5
HTTPS://GITHUB.COM/ORILEYTAN/OVKLTOOLSYSSCR
----------------------------------------------------------------------------------------------

-- TARGET TIME

This screen changes the countdown shown on the screensaver itself before it switches to a "completed" state (that doesn't really do anything, it just says completed).

The default option sets itself to 120 seconds.

-----------------------------------------
VER: XX.XX.XX
FPS: X/23.976 FRAME: XX DELTA: X.XX


TIME:



EXIT

NUMBER KEY: INPUT NUMBER   ENTER SW: EXIT
-----------------------------------------

To enter the desired time, enter the time in seconds using the number row or number keys on your keyboard. (Keep in mind that while the program lets you type letters or non number characters into the input box, it will be invalid and default to 120 seconds)

-----------------------------------------
VER: XX.XX.XX
FPS: X/23.976 FRAME: XX DELTA: X.XX


TIME: 120 <-- Entered number will be shown here



EXIT

NUMBER KEY: INPUT NUMBER   ENTER SW: EXIT
-----------------------------------------

-----------------------------------------
VER: XX.XX.XX
FPS: X/23.976 FRAME: XX DELTA: X.XX


TIME: 900cigarretes <-- This will be invalid and will be discarded



EXIT

NUMBER KEY: INPUT NUMBER   ENTER SW: EXIT
-----------------------------------------

If the time entered is erroneous, simply select EXIT and re-enter the configuration screen, selecting EXIT also saves the inputed time.

-- DISPLAY

Selecting DISPAY with the ENTER key toggles between 4:3 and 16:9 aspect ratio, There is no additional menu so pressing the ENTER key while selecting the DISPLAY option will immediately toggle the setting.

Currently resolution is HARDCODED

4:3 800x600
16:9 1280x720

You may respatch this program to use a different display resolution but the scaling and positioning of some of the display elements may break.

-- CLEARING OPTIONS

The program currently does not support clearing settings by itself so a file explorer must be used.
configuration settings are stored in "%appdata%/OVKLToolSysSCR"
delete the folder to clear the settings.

-- EXIT CONFIGURATION MENU

Simply move the cursor to the EXIT button and press the ENTER key.

----------------------------------------------------------------------------------------------
VER: XX.XX.XX
FPS: X/23.976 FRAME: XX DELTA: X.XX


TARGET TIME
IN PROGRESS TEXT
SOUND
DISPLAY


EXIT <-- Exit the configuration menu

UP & DOWN ARROW: MOVE CURSOR    ENTER SW:ENTER
OVKLTOOLSYSSCR XX.XX.XX CREATED BY @ORILEYTAN (YT) POWERED BY LOVE2D RECOMMENDED VERSION 11.5
HTTPS://GITHUB.COM/ORILEYTAN/OVKLTOOLSYSSCR
----------------------------------------------------------------------------------------------