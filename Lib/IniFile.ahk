class IniFile { ; Wrapper for the IniRead command. Because the AHK command syntax is god-awful
    path := ""
    __new(path) {
        this.path := path
    }
    readKey(iniSection, iniKey, defaultValue:="ERROR") { 
        IniRead, temp, % this.path, % iniSection, % iniKey, % defaultValue
        return temp
    }
    readSection(iniSection) { 
        IniRead, temp, % this.path, % iniSection
        return temp
    }
    readSectionNames() { 
        IniRead, temp, % this.path
        return temp
    }
}
