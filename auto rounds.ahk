#NoEnv 
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


InputBox rawPlayerList, Enter player List, Enter list of online players, , ,150
rawPlayerList := RegExReplace(rawPlayerList, "\xA7.|\s|\[HIDDEN\]") ; Sanitize Input (remove "§" formatting codes and white space) 
OutputDebug, % rawPlayerList
players := StrSplit(rawPlayerList, ",")
playerIndex = 0
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

XButton2::
  nextPlayer()
  return
XButton1::
  previousPlayer()
  return 


; §f§f§f§fplayer1, player2,player3