#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\PCDSG_1.31\ICONS\AutoDataUpdate.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>

Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck

Global $config_ini = @ScriptDir & "\config.ini"
Global $Install_DIR = IniRead($config_ini, "Folders", "Install_Folder", "")
Global $System_DIR = $Install_DIR & "System\"
Global $Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
Global $VIVE_HOME_EXE = $Install_Folder_VIVE_HOME & "ViveHome.exe"
Global $Status_Checkbox_Minimize_OVRS = IniRead($config_ini,"Settings", "Minimize_OVRS", "")

$font_arial = "arial"

$SteamVR_Status = "true"


Do
	$Status_Checkbox_Minimize_OVRS = IniRead($config_ini,"Settings", "Minimize_OVRS", "")
	If $Status_Checkbox_Minimize_OVRS = "true" Then
		If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
	EndIf

	If WinExists("SteamVR-Status") Then
		_Check_Open_Windows_1()

		$VIVEHOMECheck = "false"
		For $LOOP_VIVEHOMECheck = 0 To $NR_Handle_1
			If $Title_Array_1[$LOOP_VIVEHOMECheck] = "Vive Home" Then
				$VIVEHOMECheck = "true"
			EndIf
		Next

		If $VIVEHOMECheck = "true" Then
			Do
				$GameStarted = ""
				_Check_Open_Windows_1()
				Sleep(5000)
				If $Status_Checkbox_Minimize_OVRS = "true" Then
					If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
				EndIf
			Until Not WinExists("Vive Home")
			Sleep(1000)
		Else
			Sleep(5000)
		EndIf

		_Check_Open_Windows_2()

		If $NR_Handle_1 <> $NR_Handle_2 Then
			_Check_Windows_Title()
		EndIf

		If $GameStarted <> "" and $GameStarted <> "Oculus" and $GameStarted <> "Vive Home" and $GameStarted <> "SteamVR-Status" and $GameStarted <> "SteamVR-Running..." Then
			Do
				If $Status_Checkbox_Minimize_OVRS = "true" Then
					If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
				EndIf
				Sleep(5000)
				If Not WinExists("SteamVR-Status") Then Exit
			Until Not WinExists($GameStarted)

			If Not WinExists($GameStarted) Then
				If FileExists($System_DIR & "1_ViveHome.exe") Then
					ShellExecute($System_DIR & "1_ViveHome.exe", "", $System_DIR)
				Else
					ShellExecute($System_DIR & "1_ViveHome.au3", "", $System_DIR)
				EndIf
				Sleep(500)
				If FileExists(@ScriptDir & "\FBCheck.exe") Then
					ShellExecute(@ScriptDir & "\FBCheck.exe", "", $System_DIR)
				Else
					ShellExecute(@ScriptDir & "\FBCheck.au3", "", $System_DIR)
				EndIf
				Exit
			EndIf
		EndIf

	Else
		$SteamVR_Status = "false"
	EndIf

	$Title_1 = ""
	$Handle_1 = ""
	$Title_2 = ""
	$Handle_2 = ""
	$NR_Handle_1 = 0
	$NR_Handle_2 = 0
	$Title_Array_1 = 0
	$Title_Array_2 = 0

Until $SteamVR_Status = "false"


Func _Check_Open_Windows_1()
    ; Retrieve a list of window handles.
	Global $Title_1
	Global $Handle_1
    Local $aList = WinList()

    ; Loop through the array displaying only visable windows with a title.
    For $i = 1 To $aList[0][0]
        If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
			$Title_1 = $Title_1 & "," & $aList[$i][0]
			$Handle_1 = $Handle_1 & "," & $aList[$i][1]
        EndIf
    Next

	$Title_1 = StringTrimLeft($Title_1, "1")
	$Handle_1 = StringTrimLeft($Handle_1, "1")
	$Title_Array_1 = StringSplit($Title_1, ',')
	$Handle_Array_1 = StringSplit($Handle_1, ',')

	$NR_Handle_1 = $Handle_Array_1[0]
EndFunc

Func _Check_Open_Windows_2()
    ; Retrieve a list of window handles.
	Global $Title_2
	Global $Handle_2
    Local $aList = WinList()

    ; Loop through the array displaying only visable windows with a title.
    For $i = 1 To $aList[0][0]
        If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
			$Title_2 = $Title_2 & "," & $aList[$i][0]
			$Handle_2 = $Handle_2 & "," & $aList[$i][1]
        EndIf
    Next

	$Title_2 = StringTrimLeft($Title_2, "1")
	$Handle_2 = StringTrimLeft($Handle_2, "1")
	$Title_Array_2 = StringSplit($Title_2, ',')
	$Handle_Array_2 = StringSplit($Handle_2, ',')

	$NR_Handle_2 = $Handle_Array_2[0]
EndFunc

Func _Check_Windows_Title()
	Opt("WinTitleMatchMode",4)
	$WinTitle = WinGetTitle("[ACTIVE]")
	WinActivate($WinTitle)
	$GameStarted = $WinTitle
EndFunc

