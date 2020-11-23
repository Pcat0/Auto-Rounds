#NoEnv 
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

InputBox rawPlayerList, Enter player List, Enter list of online players, , ,150
rawPlayerList := RegExReplace(rawPlayerList, "\xA7.|\s") ; Sanitize Input (remove "§" formatting codes and white space) 

players := StrSplit(rawPlayerList, ",")
playerIndex = 0

nextPlayer(){
  global
  playerIndex += 1
  ; OutputDebug, % players.MaxIndex()
  if (playerIndex > players.MaxIndex()){
    MsgBox, 0x40, Rounds finished, test, 1
    ExitApp 
  } else {
    send, t
    send, % "/tpo " . players[playerIndex]
    send {Enter}
  }
}

previousPlayer() {
  global
  playerIndex -= 1
  if (playerIndex < 1){
    playerIndex := 1
  }
  send, t
  send, % "/tpo " . players[playerIndex]
  send {Enter}
} 

XButton2::
  nextPlayer()
  return
XButton1::
  previousPlayer()
  return 


; §f§f§f§fplayer1, player2,player3