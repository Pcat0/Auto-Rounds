#NoEnv 
#SingleInstance, Force
#Include, Lib/IniFile.ahk
SendMode Input
SetWorkingDir, %A_ScriptDir%


configFile := new IniFile("config.ini") ; """open""" the config file


InputBox rawPlayerList, Enter player List, Enter list of online players, , ,150
rawPlayerList := RegExReplace(rawPlayerList, "\xA7.|\s|\[HIDDEN\]") ; Sanitize Input (remove "§" formatting codes and white space) 
players := StrSplit(rawPlayerList, ",")
playerIndex := 0

Hotkey, % configFile.readKey("Hotkeys", "tp_to_next_player", "XButton2"), nextPlayer
Hotkey, % configFile.readKey("Hotkeys", "tp_to_previous_player", "XButton2"), previousPlayer

OutputDebug, % rawPlayerList

tpToPlayer(player){
  send, /
  Sleep, 100
  send, % "tpo " . player
  send {Enter}
}

nextPlayer() {
  global
  playerIndex += 1
  ; OutputDebug, % players.MaxIndex()
  if (playerIndex > players.MaxIndex()){
    MsgBox, 0x40, Rounds finished, All online players have been teleported to, 1
    ExitApp 
  } else {
    tpToPlayer(players[playerIndex])
  }
}

previousPlayer() {
  global
  playerIndex -= 1
  if (playerIndex < 1){
    playerIndex := 1
  }
  tpToPlayer(players[playerIndex])
} 




; §f§f§f§fplayer1, player2,player3