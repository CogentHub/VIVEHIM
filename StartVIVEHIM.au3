#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=GUI_ICONS\InfoWindow.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;#RequireAdmin

$config_ini = @ScriptDir & "\System\" & "config.ini"

$Install_DIR = @ScriptDir & "\"
IniWrite($config_ini, "Folders", "Install_Folder", $Install_DIR)
IniWrite($Config_INI, "TEMP", "StartedAsAdmin", "false")

Global $VIVE_HOME_VRAPP_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME_VRAPP", "")

$TEMP_1 = IniRead($config_ini, "TEMP", "TEMP_1", "")

If $TEMP_1 = "_Button_VIVE_HOME_VRAPP_delete" Then
	_Button_VIVE_HOME_VRAPP_delete()
	Sleep(500)
EndIf

If FileExists($Install_DIR & "System\VIVEHIM.exe") Then
	ShellExecute($Install_DIR & "System\VIVEHIM.exe", $Install_DIR & "System\")
Else
	ShellExecute($Install_DIR & "System\VIVEHIM.au3", $Install_DIR & "System\")
EndIf

Func _Button_VIVE_HOME_VRAPP_delete()
	$TEMP_1 = IniRead($config_ini, "TEMP", "TEMP_1", "")
	$TEMP_2 = IniRead($config_ini, "TEMP", "TEMP_2", "")
	$TEMP_3 = IniRead($config_ini, "TEMP", "TEMP_3", "")

	FileDelete($TEMP_2)
	FileDelete($TEMP_3)
	;ShellExecute($VIVE_HOME_VRAPP_Folder)

	IniWrite($config_ini, "TEMP", "TEMP_1", "")
	IniWrite($config_ini, "TEMP", "TEMP_2", "")
	IniWrite($config_ini, "TEMP", "TEMP_3", "")
EndFunc


Exit