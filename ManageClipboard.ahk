#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
global History := []
OnClipboardChange("ClipChanged")
return

ClipChanged(Type) {
    global History 
    if (Type = "1") {
        ClipWait
        History.Push(Clipboard)
    }
}

#v::
    Gui, Destroy
    historyList := 
    for idx, elem in History {
        historyList .= History[History.Length()-idx+1] "|"
    }
    Gui, Add, ListBox, r20 w700 vClipboardListBox gClipboardListBox, %historyList%

    Gui, Show
    return
    
    ClipboardListBox:
        if A_GuiControlEvent <> DoubleClick
            return

        ; Otherwise, the user double-clicked a list item.

        GuiControlGet, ClipboardListBox  ; Retrieve the ListBox's current selection.
            Gui, Destroy
            SendInput, %ClipboardListBox%
        return
return