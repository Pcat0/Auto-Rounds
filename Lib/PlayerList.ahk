class PlayerList {
    _index := 0
    players := []
    playersStr {
        get {
            str := this.players[1]
            loop, % this.players.MaxIndex() - 1
                str .= ", " . this.players[A_Index + 1]
            return str
        }
    }
    currentPlayer {
        get {
            return this.players[this.index]
        }
    }
    index {
        get {
            return this._index
        }
        set {
            temp := value
            if (temp < this.players.MinIndex()) {
                temp := this.onUnderflow(temp, this.players.MinIndex())
            }
            if (temp > this.players.MaxIndex()) {
                temp := this.onOverFlow(temp, this.players.MaxIndex())
            }
            return this._index := temp
        }
    }
    onOverFlow(newValue, maxValue) { ; TODO: make behavior more dynamic
        ExitApp, 1
        return maxValue
    }
    onUnderflow(newValue, minValue) { ; TODO: make behavior more dynamic
        return minValue
    }
    __new(rawPlayerList) {
        rawPlayerList := RegExReplace(rawPlayerList, "\xA7.|\s|\[HIDDEN\]") ; Sanitize Input (remove "§" formatting codes and white space) 
        this.players := StrSplit(rawPlayerList, ",")
    }
    nextPlayer() {
        OutputDebug, % "next"
        this.index += 1
    }
    previousPlayer() {
        OutputDebug, % "Previous"
        this.index -= 1
    }
    offset(i) {
        return this.players[this.index + i]
    }

}