  --[[ name = "AutoTouch Tooltips ",
    description = "Keywords for syntax highlighting",
    author = "Xamanthas",
    version = 0.1 ]]

-- Place this in your \ZeroBraneStudio\api\lua\ folder

return {
touchDown = {type = "function", description = "Presses down on a screen coordinate", args = "(Finger-ID, x, y)", returns = "(Returns: None)"},
touchUp = {type = "function", description = "Lifts the finger up on a screen coordinate", args = "(Finger-ID, x, y)", returns = "(Returns: None)"},
touchMove = {type = "function", description = "Simulates moving the finger between screen coordinates", args = "(Finger-ID, x, y)", returns = "(Returns: None)"},
keyDown = {type = "function", description = "Simulates pressing down a physical key on your device e.g. Volume, Home button, Sleep button", args = "(KEY_TYPE)", returns = "(Returns: None)"},
keyUp = {type = "function", description = "Simulates the lift of a physical key on your device e.g. Volume, Home button, Sleep button", args = "(KEY_TYPE)", returns = "(Returns: None)"},
getColor = {type = "function", description = "Get the color value of the pixel point of the specified coordinate on current screen.", args = "(x, y)", returns = "(Returns: Table)"},
getColors = {type = "function", description = "Get the color values of mutiple pixel points of the specified coordinate on current screen.", args = "({{x, y}, {x2, y2}}) etc", returns = "(Returns: Table)"},
findColor = {type = "function", description = "Search a region to find the matching specified color on current screen.", args = "(color, count, {x, y, width, height})", returns = "(Returns: Table - Coords of matching points)"},
findColors = {type = "function", description = "Search a region to find the matching specified color on current screen.", args = "(colors, count, {{x, y, w, h}, {x1, y2, w2, h2} etc..})", returns = "(Returns: Table - The coordinate of the first color/s matched in the region)"},
findImage = {type = "function", description = "Searches a region for a match to a specified picture and returns the coordinate of the top left corner of all areas as a table format.", args = "(imagePath, count, fuzzy, ignoreColors, region)", returns = "(Returns: Table - Topleft coord of the matched area )"},
screenshot = {type = "function", description = "Take a screenshot for the whole screen or specified area and save as BMP format at specified file path. The region may be specified as nil", args = "(filepath, region (optional))", returns = "(Returns: Table - Topleft coord of the matched area )"},
appRun = {type = "function", description = "Runs specified application. e.g com.apple.mobilesafari", args = "(appIdentifier)", returns = "(Returns: None)"},
appKill = {type = "function", description = "Terminates the specified application. e.g com.apple.mobilesafari", args = "(appIdentifier)", returns = "(Returns: None)"},
appState = {type = "function", description = "Returns the state of the specified application as string. e.g NOT RUNNING", args = "(appIdentifier)", returns = "(Returns: String - App state)"},
rootDir = {type = "function", description = "Returns the default root address of AutoTouch as string. e.g /var/mobile/Library/AutoTouch/Scripts/", args = "()", returns = "(Returns: String - Root dir)"},
usleep = {type = "function", description = "Sleep specified amount of microseconds (1/1000000) ", args = "()", returns = "(Returns: String - Root dir)"},
log = {type = "function", description = "Record string to log, can be seen in the log interface.", args = "(string)", returns = "(Returns: None)"},
alert = {type = "function", description = "Pops up the dialog box to show specified content. Must be dismissed via clicking 'Ok' ", args = "(string)", returns = "(Returns: None)"},
vibrate = {type = "function", description = "Vibrates the device once", args = "()", returns = "(Returns: None)"},
playAudio = {type = "function", description = "Play audio file from a  specified location. 0 plays is infinite", args = "(audioFile, timesToPlay)", returns = "(Returns: None)"},
stopAudio = {type = "function", description = "Stops playing the audio file", args = "()", returns = "(Returns: None)"},
getOrientation = {type = "function", description = "Get orientation of the screen. Returns an integer value.", args = "()", returns = "(Returns: Interger)"},
getScreenResolution = {type = "function", description = "Returns the resolution of the device", args = "()", returns = "(Returns: Interger - Width, Height)"},
getSN = {type = "function", description = "Returns the serial number of the device", args = "()", returns = "(Returns: String)"},
getVersion = {type = "function", description = "Returns the AutoTouch version installed on the device", args = "()", returns = "(Returns: String)"},
intToRgb = {type = "function", description = "Transit integer color to independent values of R,G,B.", args = "(intColor)", returns = "(Returns: Integer - R, G, B)"},
copyText = {type = "function", description = "Copies inputted text to devices clipboard", args = "(text)", returns = "(Returns: None)"},
clipText = {type = "function", description = "Returns the text from devices clipboard", args = "(text)", returns = "(Returns: String)"},
inputText = {type = "function", description = "Input text as you would with a keyboard. You can delete a character backspace by inputText(\b).", args = "(text)", returns = "(Returns: None)"},
dialog = {type = "function", description = "Pop up self-defined dialog box to accept the user input. Please refer to the example for specific usage", args = "(controls, enableRemember)", returns = "(Returns: None)"},
clearDialogValues = {type = "function", description = "Clear the remembered values of the dialog created by the function dialog.", args = "(script)", returns = "(Returns: None)"},
setTarget = {type = "function", description = "Sets the target of the app to be run in (beta/bugged)", args = "(appidentifier)", returns = "(Returns: None)"},
toast = {type = "function", description = "Displays an alert that automatically fades away \nAT >=ver.4.2.3", args = "(string)", returns = "(Returns: None)"},
 KEY_TYPE = {
    type = "value",
    description = "Physical key constant parent",

    -- children in the class hierarchy
    childs = { -- recursive
      HOME_BUTTON = {
        type = "value",
        description = "Represents physical home button"},
      VOLUME_DOWN_BUTTON = {
        type = "value",
        description = "Represents physical volume down button"},
      VOLUME_UP_BUTTON = {
        type = "value",
        description = "Represents physical volume up button"},
      POWER_BUTTON = {
        type = "value",
        description = "Represents physical power button"}
      }
    },
  ORIENTATION_TYPE = {
    type = "value",
    description = "Screen orientation parent constant",

    -- children in the class hierarchy
    childs = { -- recursive
      UNKNOWN = {
        type = "value",
        description = "Represents unknown orientation. Practical value is 0"},
      PORTRAIT = {
        type = "value",
        description = "Represents portrait screen. Home button is at the bottom. Practical value is 1"},
      PORTRAIT_UPSIDE_DOWN = {
        type = "value",
        description = "Represents upside-down portrait screen. Home button on the top. Practical value is 2"},
      LANDSCAPE_LEFT = {
        type = "value",
        description = "Represents landscape left screen. Home Key is in the left. Practical value is 3"},
      LANDSCAPE_RIGHT = {
        type = "value",
        description = "Represents landscape right screen. Home key is in the right. Practical value is 4"}
      }
    },
  CONTROLLER_TYPE = {
    type = "value",
    description = "Screen orientation parent constant",

    -- children in the class hierarchy
    childs = { -- recursive
      LABEL = {
        type = "value",
        description = "Represents unknown orientation. Practical value is 0"},
      INPUT = {
        type = "value",
        description = "Represents portrait screen. Home button is at the bottom. Practical value is 1"},
      PICKER = {
        type = "value",
        description = "Represents upside-down portrait screen. Home button on the top. Practical value is 2"},
      PICKER = {
        type = "value",
        description = "Represents landscape left screen. Home Key is in the left. Practical value is 3"},
      }
    },
cat = {type = "function", description = "Display or concatenate files through MobileTerminal eg ", args = "(cat [option] [file])", returns = "(Returns: None)"},
cd = {type = "function", description = "Navigate directories through MobileTerminal eg ", args = "(cd [-L|-P] [dir])", returns = "(Returns: None)"},
launchctl = {type = "function", description = "Load or unload daemons/agents through MobileTerminal/NewTerm \ne.g launchctl stop com.apple.mobilesafari", args = "([subcommand [arguments ...])", returns = "(Returns: None)"},
curl = {type = "function", description = "Transfer data  from or to a server, be careful its powerful", args = "([options] [URL...])", returns = "(Returns: None)"},
cycript = {type = "function", description = "Objective-C <-> JavaScript bridge; Interactive shell for that; Injects itself into processes for debugging", args = "(cycript [-p <pid>] <script file>)", returns = "(...)"},
echo = {type = "function", description = "COL_BLUE=\"\x1b[34;01m\nCOL_RESET=\"\x1b[39;49;00m\"\necho -e $COL_BLUE\"Important Message: \"$COL_RESET\"This is a message\"", args = "(cycript [-p <pid>] <script file>)", returns = "(Returns: None)"},
mv = {type = "function", description = "Move or rename files or directories", args = "([options] source target)", returns = "(Returns: None)"},
plutil = {type = "function", description = "Reads and modifies plists \ne.g Print an application's bundle ID: plutil -key softwareVersionBundleId iTunesMetadata.plist", args = "(-key <keyname>)", returns = "(Returns: None)"},
sbreload = {type = "function", description = "Simplest way of respringing the device", args = "(-key <keyname>)", returns = "(Returns: None)"},
scp = {type = "function", description = "Secure Copy - use SSH for file transfer.<infile> and <outfile> can be local files such as /etc/apt/sources.list or remote files in the format <user>@<host>:<filename> ", args = "([options] <infile> <outfile>)", returns = "(Returns: None)"},
wget = {type = "function", description = "Tool for downloading files from the internet", args = "([options] <url>)", returns = "(Returns: None)"},
id = {type = "function", description = "Returns the currently logged in user", args = "([options] <url>)", returns = "(Returns: None)"},
}
