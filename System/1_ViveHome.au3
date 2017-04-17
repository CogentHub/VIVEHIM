
#include <MsgBoxConstants.au3>
#include <Array.au3>

Global $config_ini = @ScriptDir & "\config.ini"
Global $Install_DIR = IniRead($config_ini, "Folders", "Install_Folder", "")
Global $System_DIR = $Install_DIR & "System\"
Global $Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
Global $VIVE_HOME_EXE = $Install_Folder_VIVE_HOME & "ViveHome.exe"
Global $Check_ShowPlayerOnline = IniRead($Config_INI, "Settings", "ShowPlayerOnline", "")
Global $Status_IDRadio = IniRead($config_ini,"Settings", "IDRadio", "")

If ProcessExists("vrmonitor.exe") Then
	IniWrite($Config_INI, "TEMP", "Use_VIVEHOME_lnk", "true")
	_Start()
	IniWrite($Config_INI, "TEMP", "Use_VIVEHOME_lnk", "false")
	Exit
Else
	IniWrite($Config_INI, "TEMP", "Use_VIVEHOME_lnk", "true")
	Do
		Sleep(1000)
	Until ProcessExists("vrmonitor.exe")
	_Start()
	IniWrite($Config_INI, "TEMP", "Use_VIVEHOME_lnk", "false")
	Exit
EndIf

Func _Start()
	If $Check_ShowPlayerOnline = "false" and $Status_IDRadio <> "4" Then
		If FileExists($System_DIR & "AddPO2Icons.exe") Then
			ShellExecute($System_DIR & "AddPO2Icons.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "AddPO2Icons.au3", "", $System_DIR)
		EndIf
	EndIf
	Sleep(100)
	If Not WinExists("Vive Home") Then
		ShellExecute($VIVE_HOME_EXE, "", $Install_Folder_VIVE_HOME)
	Else
		WinClose("Vive Home")
		Sleep(500)
		ShellExecute($VIVE_HOME_EXE, "", $Install_Folder_VIVE_HOME)
	EndIf
	Sleep(1000)
EndFunc

Exit

