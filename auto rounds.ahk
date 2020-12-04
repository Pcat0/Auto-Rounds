#NoEnv 
#SingleInstance, Force
#Include, Lib/IniFile.ahk
#Include, Lib/PlayerList.ahk
SendMode Input
SetWorkingDir, %A_ScriptDir%


configFile := new IniFile("config.ini") ; """open""" the config file

MC_CONSOLE_KEY_BIND := configFile.readKey("Settings", "mc_console_key_bind", "/") 
COMMAND_DELAY := configFile.readKey("Settings", "command_delay", "100")

AUTO_CPS_COMMAND := configFile.readKey("Settings", "auto_cps_command", "1") = 1
RUN_CPS_ON_RE_TP := configFile.readKey("Settings", "run_cps_on_re-tp", "1") = 1

GUI_SYTLE := configFile.readKey("Settings", "GUI_SYTLE", "MINIMAL")



InputBox rawPlayerList, Enter player List, Enter list of online players, , ,150  ; TODO: add option to start from bottom of the list
if ErrorLevel
  ExitApp, 1
playerList := new PlayerList(rawPlayerList) ; Im not convinced that using a class here was the best idea, I might remove it.


playerIndex := 0

Hotkey, % configFile.readKey("Hotkeys", "tp_to_next_player", "XButton2"), nextPlayer
Hotkey, % configFile.readKey("Hotkeys", "tp_to_prev_player", "XButton1"), prevPlayer
Hotkey, % configFile.readKey("Hotkeys", "tp_to_same_player", "MButton"),  samePlayer
Hotkey, % configFile.readKey("Hotkeys", "quit_script", "End"),  Quit




OutputDebug, % playerList.playersStr

if (GUI_SYTLE = "MINIMAL") {
  SetTimer, updateToolTip, 10
}




SendCommand(command) {
  global
  send, %MC_CONSOLE_KEY_BIND%
  sleep, %COMMAND_DELAY%
  send, % command
  send {Enter}

}

samePlayer() {
  global
  if (AUTO_CPS_COMMAND && RUN_CPS_ON_RE_TP) {
    SendCommand("cps .")
    SendCommand("cps " . playerList.currentPlayer)
  }
  SendCommand("tpo " . playerList.currentPlayer)
}
nextPlayer() {
  global
  playerList.nextPlayer()
  if (AUTO_CPS_COMMAND) {
    SendCommand("cps .")
    SendCommand("cps " . playerList.currentPlayer)
  }
  SendCommand("tpo " . playerList.currentPlayer)
}

prevPlayer() {
  global
  playerList.previousPlayer()
  if (AUTO_CPS_COMMAND) {
    SendCommand("cps .")
    SendCommand("cps " . playerList.currentPlayer)
  }
  SendCommand("tpo " . playerList.currentPlayer)
} 
updateToolTip:
  ToolTip % playerList.offset(-1) . " - " . playerList.offset(0) . " - " . playerList.offset(1), 0, 0
  return 

Quit:
  ExitApp


; §f§f§f§fplayer1, player2,player3       