# Auto-Rounds
Auto Rounds is simple AutoHotkey script to make doing server rounds slightly easier, by adding hotkeys to teleport you to the next/previous player on the list. This is super work in progress so it maybe a bit buggy. If you have any comments/questions/problems feel free to send them my way. 

## How to set up
### Downloading
[Click here](https://github.com/Pcat0/Auto-Rounds/archive/main.zip) to download the zip. To run simply exact it and run the auto rounds.exe. _important note: you can move the script to anywhere on you want on your hard drive, however make sure to keep the auto rounds.exe and the config.ini file in the same folder_.

### Minecraft Config
 While it is not required, I would recommend that you enable the "Open output logs when Minecraft: Java Edition starts" in your Minecraft launcher settings. 
![image](https://i.imgur.com/sLmatkE.png)

### Script Config
You can change the script settings and rebind the script hotkeys by editing the config.ini file. By default the script's hotkeys are set to:
| Hot key                   | Default key         | Setting Name         | Setting default value  |
|---------------------------|---------------------|----------------------|------------------------|
| Tp to the next player     | Mouse Button 5      | tp\_to\_next\_player | XButton2               |
| Tp to the previous player | Mouse Button 4      | tp\_to\_prev\_player | XButton1               |
| Re\-TP to the same player | Middle Mouse Button | tp\_to\_same\_player | MButton                |
| Quit the script           | End                 | quit\_script         | End                    |
To change a hotkey open the config.ini file in a text editor and change the Hotkey value to any valid [autoHotkey key/button](https://www.autohotkey.com/docs/KeyList.htm)

If you have no longer have "Open Command" bound to "/" in minecart, you must change the value of of the "mc_console_key_bind" setting to whatever you have "Open Command" bound to in Minecraft. 

### How to Use
Double click on the auto rounds.exe to launch it. It should ask you for a list of the online players. The best way I have found to get a list of online players is to run the /online command and then copy the result from the "Minecraft game output window"
![Image](https://i.imgur.com/EfWcA3z.png)
You do not need to worry about the "§f" the script will filter them out. It may also be helpful to "clear all logs first"
Once you you enter the the list of online players, press the "next player" Hotkey to teleport to the first player. Once you have teleported to every player the program will automatically close its self. You can also look in the upper left hand corner and see the previous, current, and next players. 
![Items](https://i.imgur.com/4yEcrkH.png)
