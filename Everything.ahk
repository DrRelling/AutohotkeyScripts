#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Hotstrings
:O:gr ::var gr = new GlideRecord("");



; Other scripts
#Include PolishLetters.ahk
#Include FrenchLetters.ahk
#Include OpenTerminal.ahk
#Include EnableMousepad.ahk
#Include FindRefNumber.ahk
#Include NotepadPlusPlusIndent.ahk