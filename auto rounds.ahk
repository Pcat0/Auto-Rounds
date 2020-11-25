#NoEnv 
#SingleInstance, Force
#Include, Lib/IniFile.ahk
#Include, Lib/PlayerList.ahk
SendMode Input
SetWorkingDir, %A_ScriptDir%


configFile := new IniFile("config.ini") ; """open""" the config file


InputBox rawPlayerList, Enter player List, Enter list of online players, , ,150
playerList := new PlayerList(rawPlayerList)


playerIndex := 0

Hotkey, % configFile.readKey("Hotkeys", "tp_to_next_player", "XButton2"), nextPlayer
Hotkey, % configFile.readKey("Hotkeys", "tp_to_previous_player", "XButton2"), previousPlayer

OutputDebug, % playerList.playersStr

tpToPlayer(player){
  send, /
  Sleep, 100
  send, % "tpo " . player
  send {Enter}
}

nextPlayer() {
  global
  playerList.nextPlayer()
  tpToPlayer(playerList.currentPlayer)
}

previousPlayer() {
  global
  playerList.previousPlayer()
  tpToPlayer(playerList.currentPlayer)
} 




; §f§f§f§fplayer1, player2,player3