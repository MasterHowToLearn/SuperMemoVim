; Utilities
#Include %A_LineFile%\..\util\vim_ahk_setting.ahk
#Include %A_LineFile%\..\util\vim_ime.ahk


; Classes, Functions
#Include %A_LineFile%\..\vim_about.ahk
#Include %A_LineFile%\..\vim_check.ahk
#Include %A_LineFile%\..\vim_gui.ahk
#Include %A_LineFile%\..\vim_icon.ahk
#Include %A_LineFile%\..\vim_ini.ahk
#Include %A_LineFile%\..\vim_menu.ahk
#Include %A_LineFile%\..\vim_move.ahk
#Include %A_LineFile%\..\vim_setting.ahk
#Include %A_LineFile%\..\vim_state.ahk
#Include %A_LineFile%\..\vim_tooltip.ahk



; Key Bindings
#Include %A_LineFile%\..\vim_bind.ahk

class VimAhk{
  __About(){
    this.About.Version := "v0.0.1"
    this.About.Date := "28/Nov/2020"
    this.About.Author := "Modified by: MasterHowToLearn. Made by: rcmdnk. Thank you!"
    this.About.Description := "Vim emulation with AutoHotkey for SuperMemo, the best learning software in the world."
    this.About.Homepage := "https://github.com/MasterHowToLearn/SuperMemoVim"
    this.Info["VimHomepage"] := this.About.Homepage
  }

  __New(setup=true){
    ; Classes
    this.About := new VimAbout(this)
    this.Check := new VimCheck(this)
    this.Icon := new VimIcon(this)
    this.Ini := new VimIni(this)
    this.VimMenu := new VimMenu(this)
    this.Move := new VimMove(this)
    this.Setting := new VimSetting(this)
    this.State := new VimState(this)
    this.VimToolTip := new VimToolTip(this)

    ; Group Settings
    this.GroupDel := ","
    this.GroupN := 0
    this.GroupName := "VimGroup" . GroupN

    ; Enable vim mode for following applications
    this.Group :=  "ahk_exe sm18.exe", "ahk_exe sm17.exe", "ahk_exe sm16.exe", "ahk_exe sm15.exe"


    ; Configuration values for Read/Write ini
    this.Conf := {VimRestoreIME: {default: 0, val: 0
        , description: "Restore IME status at entering Insert mode:"
        , info: "Restore IME status at entering Insert mode."}
      , VimJJ: {default: 0, val: 0
        , description: "JJ enters Normal mode:"
        , info: "Assign JJ enters Normal mode."}
      , VimJK: {default: 0, val: 1
        , description: "JK enters Normal mode:"
        , info: "Assign JK enters Normal mode."}
      , VimSD: {default: 0, val: 0
        , description: "SD enters Normal mode:"
        , info: "Assign SD enters Normal mode."}
      , VimDisableUnused: {default: 1, val: 1
        , description: "Disable unused keys in Normal mode:"
        , info: "1: Do not disable unused keys`n2: Disable alphabets (+shift) and symbols`n3: Disable all including keys with modifiers (e.g. Ctrl+Z)"}
      , VimSetTitleMatchMode: {default: "2", val: "2"
        , description: "SetTitleMatchMode:"
        , info: "[Mode] 1: Start with, 2: Contain, 3: Exact match.`n[Fast/Slow] Fast: Text is not detected for such edit control, Slow: Works for all windows, but slow."}
      , VimSetTitleMatchModeFS: {default: "Fast", val: "Fast"
        , description: "SetTitleMatchMode"
        , info: "[Mode]1: Start with, 2: Contain, 3: Exact match.`n[Fast/Slow]: Fast: Text is not detected for such edit control, Slow: Works for all windows, but slow."}
      , VimIconCheckInterval: {default: 200, val: 200
        , description: "Icon check interval (ms):"
        , info: "Interval to check vim_ahk status (ms) and change tray icon. If it is set to 0, the original AHK icon is set."}
      , VimVerbose: {default: 1, val: 1
        , description: "Verbose level:"
        , info: "1: Nothing `n2: Minimum tooltip of status`n3: More info in tooltip`n4: Debug mode with a message box, which doesn't disappear automatically"}
      , VimGroup: {default: this.Group, val: this.Group
        , description: "Application:"
        , info: "Set one application per line.`n`nIt can be any of Window Title, Class or Process.`nYou can check these values by Window Spy (in the right click menu of tray icon)."}}
    this.CheckBoxes := ["VimRestoreIME", "VimJJ", "VimJK", "VimSD"]

    ; Other ToolTip Information
    this.Info := {}
    for k, v in this.Conf {
      this.Info[k] := v["info"]
    }
    this.Info["VimGroupText"] := this.Conf["VimGroup"]["info"]
    this.Info["VimGroupList"] := this.Conf["VimGroup"]["info"]

    this.Info["VimDisableUnusedText"] := this.Conf["VimDisableUnused"]["info"]
    this.Info["VimDisableUnusedValue"] := this.Conf["VimDisableUnused"]["info"]

    this.Info["VimSetTitleMatchModeText"] := this.Conf["VimSetTitleMatchMode"]["info"]
    this.Info["VimSetTitleMatchModeValue"] := this.Conf["VimSetTitleMatchMode"]["info"]

    this.Info["VimIconCheckIntervalText"] := this.Conf["VimIconCheckInterval"]["info"]
    this.Info["VimIconCheckIntervalEdit"] := this.Conf["VimIconCheckInterval"]["info"]

    this.Info["VimVerboseText"] := this.Conf["VimVerbose"]["info"]
    this.Info["VimVerboseValue"] := this.Conf["VimVerbose"]["info"]

    this.Info["VimSettingOK"] := "Reflect changes and exit"
    this.Info["VimSettingReset"] := "Reset to the default values"
    this.Info["VimSettingCancel"] := "Don't change and exit"

    ; Initialize
    this.Initialize()
  }

  SetExistValue(){
    for k, v in this.Conf {
      if(%k% != ""){
        conf[k]["val"] := %k%
      }
    }
  }

  SetGroup(){
    this.GroupN++
    this.GroupName := "VimGroup" . this.GroupN
    Loop, Parse, % this.Conf["VimGroup"]["val"], % this.GroupDel
    {
      if(A_LoopField != ""){
        GroupAdd, % this.GroupName, %A_LoopField%
      }
    }
  }

  Setup(){
    SetTitleMatchMode, % this.Conf["VimSetTitleMatchMode"]["val"]
    SetTitleMatchMode, % this.Conf["VimSetTitleMatchModeFS"]["val"]
    this.State.SetStatusCheck()
    this.SetGroup()
  }

  Initialize(){
    this.__About()
    this.SetExistValue()
    this.Ini.ReadIni()
    this.VimMenu.SetMenu()
    this.Setup()
  }
}
