#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\PCDSG_1.3\ICONS\DataUpdate.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;#include<IE.au3>
#include <File.au3>
#include <Array.au3>
#include <string.au3>
#include <GuiStatusBar.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Global $Config_INI = @ScriptDir & "\config.ini"
Global $VIVE_HOME_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME", "")

If $VIVE_HOME_Folder = "" Then
	MsgBox(0, "Vive Home Desktop APP settings folder", "Choose VIVE Home Desktop APP settings folder before continue." & @CRLF & _
					"It can normally be found in the following directory." & @CRLF & @CRLF & _
					'C:\ProgramData\HTC\Vive\', 15)

	$FileSelectFolder_VIVE_HOME = FileSelectFolder("Choose VIVE Home folder", $VIVE_HOME_Folder)
	IniWrite($Config_INI, "Folders", "VIVE_HOME", $FileSelectFolder_VIVE_HOME & "\")
EndIf

$Install_DIR_StringReplace = StringReplace(@ScriptDir & "\", "System\", "")
IniWrite($Config_INI, "Folders", "Install_Folder", $Install_DIR_StringReplace)

Global $Install_DIR = IniRead($Config_INI, "Folders", "Install_Folder", "")
Global $System_DIR = $Install_DIR & "System\"
Global $Icons_DIR = $Install_DIR & "Icons\"
Global $Temp_DIR = $Install_DIR & "temp\"
Global $Shortcuts_INI = $System_DIR & "Shortcuts.ini"
Global $ApplicationList_INI = $System_DIR & "ApplicationList.ini"
Global $VIVE_HOME_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME", "")
Global $VIVE_HOME_VRAPP_Folder = IniRead($config_ini, "Folders", "VIVE_HOME_VRAPP", "")
Global $VIVE_HOME_ApplicationList_Folder = $VIVE_HOME_Folder & "ApplicationList\"

Global $Check_HTTP, $File_Path, $File, $NR, $Application_NR, $FileList_NR, $SourceFile
Global $New_Icon_URL, $New_Icon_Path, $Steam_app_Value, $Steam_app_ID

Local Const $PG_WS_POPUP = 0x80000000 ; same as the $WS_POPUP constant in WindowsConstants.au3
Local Const $PG_WS_DLGFRAME = 0x00400000 ; same as the $WS_DLGFRAME constant in WindowsConstants.au3

$GUI = GUICreate("Download and Fix Missing Icons", 185, 43, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))  ; $WS_EX_TOPMOST
GUISetIcon(@AutoItExe, -2, $GUI)
GUISetBkColor("0x00BFFF")

$font = "arial"
GUICtrlCreateLabel("Working, please wait...", 10, 22, 160, 20)
GUICtrlSetFont(-1, 12, 500, 1, $font)

$Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, 0, 184, 20)
GUISetState(@SW_SHOW, $GUI)

GUICtrlSetData($Anzeige_Fortschrittbalken, 1)

Sleep(100)

_Search_Files()
Sleep(100)
_Download_Icons()

GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

Sleep(500)

MsgBox(0, "Finished", "Missing Icons have been downloaded and the Icons paths in" & @CRLF & "Vive Home (VR APP and DESKTOP APP) settings File was fixed or added." & @CRLF & @CRLF & _
						"Icons Folder: " & @CRLF & $Icons_DIR & @CRLF & @CRLF, 5)


Func _Search_Files()
	Local $s_LocalFolder = $VIVE_HOME_ApplicationList_Folder
	Local $FileList = _FileListToArray($s_LocalFolder , "*.appinfo" , 1)

	If $FileList <> "" Then
		For $NR = 1 To $FileList[0]
			$Application_NR = $NR
			$FileList_NR = $FileList[0]
		Global $File_Name = $FileList[$NR]
		Global $File_Path = $VIVE_HOME_ApplicationList_Folder & $File_Name
		$ProcessBar_Status = $NR * 40 / $FileList[0]
		GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
		_ApplicationList_Update()
		$File_Path =  ""
		Next
	EndIf
EndFunc

Func _ApplicationList_Update()
	$File = $File_Path
	$Wert_Zeile = ""

	If $File <> "" Then

		$Wert_Zeile_Check_HTTP_File = FileReadLine($File, 24)
		$Check_HTTP = StringInStr($Wert_Zeile_Check_HTTP_File, "cdn.akamai.steamstatic.com")
		If $Check_HTTP <> 0 Then $Check_HTTP = "true"

		$Wert_Zeile_Check_steam_File = FileReadLine($File, 24)
		$Check_steam = StringInStr($Wert_Zeile_Check_steam_File, "steam")
		If $Check_steam <> 0 Then $Check_steam = "true"

		If $Check_HTTP = "true" and $Check_steam = "true" Then

			$Anzahl_Zeilen = 50

				For $iCount_1 = 1 To $Anzahl_Zeilen

						$Wert_Zeile_komplett = FileReadLine($File, $iCount_1)
						$Wert_Zeile = StringSplit(StringTrimLeft($Wert_Zeile_komplett, 1), ':')
						$Check_Name = StringTrimLeft($Wert_Zeile[1], 1)

						If $Check_Name = '"Name"' Then
							$APP_Name = StringReplace($Wert_Zeile_komplett, ' "Name"', '')
							$APP_Name = StringReplace($APP_Name, '"', '')
							$APP_Name = StringReplace($APP_Name, ',', '')
							$APP_Name = StringTrimLeft($APP_Name, 3)
						EndIf

						$Name = ""
						$Wert = ""

					If UBound($Wert_Zeile - 1) > 2 Then
						$Name = $Wert_Zeile[1]
						$Name = StringReplace($Name, " ", "")
						$Name = StringReplace($Name, " ", "")
						$Name = StringReplace($Name, " ", "")
						$Name = StringTrimLeft($Name, 1)
						$Name = StringTrimRight($Name, 1)

						$Wert = StringReplace($Wert_Zeile[2], '"', '')
						$Wert = StringReplace($Wert, '"', '')
						$Wert = StringReplace($Wert, ' ', '')
						$Wert = StringReplace($Wert, ',', '')

						If $Name = "DeserializedClassVersion" Then

							$Wert_AppId = FileReadLine($File, $iCount_1 + 4)
							$Wert_AppId_Zeile = StringSplit(StringTrimLeft($Wert_AppId, 1), ':')
							$AppId_Name = $Wert_AppId_Zeile[1]
							$AppId_Name = StringReplace($AppId_Name, " ", "")
							$AppId_Name = StringReplace($AppId_Name, " ", "")
							$AppId_Name = StringReplace($AppId_Name, " ", "")
							$AppId_Name = StringTrimLeft($AppId_Name, 1)
							$AppId_Name = StringTrimRight($AppId_Name, 1)

							$AppId_Wert = StringReplace($Wert_AppId_Zeile[2], '"', '')
							$AppId_Wert = StringReplace($AppId_Wert, '"', '')
							$AppId_Wert = StringReplace($AppId_Wert, ' ', '')
							$AppId_Wert = StringReplace($AppId_Wert, ',', '')

							$Write_AppId = $AppId_Wert

						EndIf

						If $Name = "ContentInfo" Then
							$Wert_Zeile_ContentInfo = FileReadLine($File, $iCount_1)
							$Check_HTTP = StringInStr($Wert_Zeile_ContentInfo, "cdn.akamai.steamstatic.com")
							If $Check_HTTP <> 0 Then $Check_HTTP = "true"

							$Wert_Zeile_ContentInfo = StringReplace($Wert_Zeile_ContentInfo, '":', '-')
							$Wert_Zeile_ContentInfo = StringReplace($Wert_Zeile_ContentInfo, '"', '')
							$Wert_Zeile_ContentInfo = StringReplace($Wert_Zeile_ContentInfo, ',', '*')
							$Value_Zeile_ContentInfo = StringSplit(StringTrimLeft($Wert_Zeile_ContentInfo, 1), "-*")

							If $Check_HTTP = "true" Then
								If $Value_Zeile_ContentInfo[0] = 26 Then

									$Label_1 = $Value_Zeile_ContentInfo[2]
									$Label_1 = StringReplace($Label_1, ' ', '')
									$Label_1 = StringReplace($Label_1, '\', '')
									$Label_1 = StringReplace($Label_1, '{', '')

									$Value_1 = $Value_Zeile_ContentInfo[3]
									$Value_1 = StringReplace($Value_1, '\', '')

									$Label_2 = $Value_Zeile_ContentInfo[4]
									$Label_2 = StringReplace($Label_2, '\', '')

									$Value_2 = $Value_Zeile_ContentInfo[5]
									$Value_2 = StringReplace($Value_2, '\', '')

									$Label_3 = $Value_Zeile_ContentInfo[6]
									$Label_3 = StringReplace($Label_3, '\', '')

									$Value_3 = $Value_Zeile_ContentInfo[7]
									$Value_3 = StringReplace($Value_3, '\', '')

									$Label_4 = $Value_Zeile_ContentInfo[8]
									$Label_4 = StringReplace($Label_4, '\', '')

									$Value_4 = $Value_Zeile_ContentInfo[9]

									$Label_5 = $Value_Zeile_ContentInfo[10]
									$Label_5 = StringReplace($Label_5, '\', '')

									$Value_5 = $Value_Zeile_ContentInfo[11]

									$Label_6 = $Value_Zeile_ContentInfo[12]
									$Label_6 = StringReplace($Label_6, '\', '')

									$Value_6 = $Value_Zeile_ContentInfo[13]

									$Value_6_1 = $Value_Zeile_ContentInfo[14]
									$Value_6_1 = StringReplace($Value_6_1, '\', '')

									$Value_6_2 = $Value_Zeile_ContentInfo[15]
									$Value_6_2 = StringReplace($Value_6_2, '\', '')

									$Label_7 = $Value_Zeile_ContentInfo[16]
									$Label_7 = StringReplace($Label_7, '\', '')

									$Value_7 = $Value_Zeile_ContentInfo[17]
									$Value_7 = StringReplace($Value_7, '\', '')

									$Label_8 = $Value_Zeile_ContentInfo[18]
									$Label_8 = StringReplace($Label_8, '\', '')

									$Value_8 = $Value_Zeile_ContentInfo[19]
									$Value_8 = StringReplace($Value_8, '\', '')

									$Label_9 = $Value_Zeile_ContentInfo[20]
									$Label_9 = StringReplace($Label_9, '\', '')

									$Value_9 = $Value_Zeile_ContentInfo[21]
									$Value_9_Source = $Value_9
									$Value_9_Source = StringReplace($Value_9_Source, '\', '')
									$Check_HTTP_9 = StringInStr($Value_9, "cdn.akamai.steamstatic.com")
									$Value_9 = StringTrimLeft($Value_9, $Check_HTTP_9 - 1)
									$Value_9 = StringReplace($Value_9, '.jpg\', '.jpg')
									$Value_9 = StringReplace($Value_9, '\\\\', '/')
									$Value_9 = "http://" & $Value_9

									$Label_10 = $Value_Zeile_ContentInfo[22]
									$Label_10 = StringReplace($Label_10, '\', '')

									$Value_10 = $Value_Zeile_ContentInfo[23]
									$Value_10 = StringReplace($Value_10, '\', '')

									$Label_11 = $Value_Zeile_ContentInfo[24]
									$Label_11 = StringReplace($Label_11, '\', '')

									$Value_11 = $Value_Zeile_ContentInfo[25]
									$Value_11 = StringReplace($Value_11, '}', '')

										$ContentInfo_Key_1 = $Label_1
										$ContentInfo_Value_1 = $Value_1
										$ContentInfo_Key_2 = $Label_2
										$ContentInfo_Value_2 = $Value_2
										$ContentInfo_Key_3 = $Label_3
										$ContentInfo_Value_3 = $Value_3
										$ContentInfo_Key_4 = $Label_4
										$ContentInfo_Value_4 = $Value_4
										$ContentInfo_Key_5 = $Label_5
										$ContentInfo_Value_5 = $Value_5
										$ContentInfo_Key_6 = $Label_6
										$ContentInfo_Value_6 = $Value_6
										$ContentInfo_Key_6_1 = $Value_6_1
										$ContentInfo_Value_6_1 = $Value_6_2
										$ContentInfo_Key_7 = $Label_7
										$ContentInfo_Value_7 = $Value_7
										$ContentInfo_Key_8 = $Label_8
										$ContentInfo_Value_8 = $Value_8
										$ContentInfo_Key_9 = $Label_9
										$ContentInfo_Value_9 = $Value_9
										$ContentInfo_Key_10 = $Label_10
										$ContentInfo_Value_10 = $Value_10
										$ContentInfo_Key_11 = $Label_11
										$ContentInfo_Value_11 = $Value_11

									$ContentInfo_ImagePath_source = $Value_9_Source
									$ContentInfo_ImagePath_1 = $ContentInfo_Value_9
									$ContentInfo_ImagePath_2 = $Icons_DIR & $ContentInfo_Value_1 & ".jpg"
									$ContentInfo_ImagePath_3 = $Icons_DIR & $ContentInfo_Value_1 & ".png"

									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_1, $ContentInfo_Value_1)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_2, $ContentInfo_Value_2)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_3, $ContentInfo_Value_3)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_4, $ContentInfo_Value_4)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_5, $ContentInfo_Value_5)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_6, $ContentInfo_Value_6)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_6_1, $ContentInfo_Value_6_1)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_7, $ContentInfo_Value_7)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_8, $ContentInfo_Value_8)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_9, $ContentInfo_ImagePath_source)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_9 & "_1", $ContentInfo_ImagePath_1)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_9 & "_2", $ContentInfo_ImagePath_2)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_9 & "_3", $ContentInfo_ImagePath_3)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_10, $ContentInfo_Value_10)
									IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "ContentInfo_" & $ContentInfo_Key_11, $ContentInfo_Value_11)

									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_1, $ContentInfo_Value_1)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_2, $ContentInfo_Value_2)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_3, $ContentInfo_Value_3)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_4, $ContentInfo_Value_4)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_5, $ContentInfo_Value_5)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_6, $ContentInfo_Value_6)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_6_1, $ContentInfo_Value_6_1)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_7, $ContentInfo_Value_7)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_8, $ContentInfo_Value_8)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_9, $ContentInfo_ImagePath_source)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_9 & "_1", $ContentInfo_ImagePath_1)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_9 & "_2", $ContentInfo_ImagePath_2)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_9 & "_3", $ContentInfo_ImagePath_3)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_10, $ContentInfo_Value_10)
									IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "ContentInfo_" & $ContentInfo_Key_11, $ContentInfo_Value_11)
								EndIf
							EndIf
						EndIf
					EndIf

					If $Name <> "ContentInfo" Then
						If $Name <> "" Then
							If $Check_Name = '"Name"' Then
								$APP_Name = StringReplace($Wert_Zeile_komplett, ' "Name"', '')
								$APP_Name = StringReplace($APP_Name, '"', '')
								$APP_Name = StringReplace($APP_Name, ',', '')
								$APP_Name = StringTrimLeft($APP_Name, 3)
								$Name = "Name"
								$Wert = $APP_Name
							EndIf
							IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
							IniWrite($ApplicationList_INI, "Application_" & $Application_NR, $Name, $Wert)
						EndIf
					EndIf
				Next
		EndIf
	EndIf
EndFunc

Func _Download_Icons()
	$NR_of_Files = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	For $LOOP_Files_1 = 1 To $NR_of_Files
		$ContentInfo_AppKey = IniRead($ApplicationList_INI, "Application_" & $LOOP_Files_1, "AppId", "")
		$Application_ID = StringReplace($ContentInfo_AppKey, "steam.app.", "")
		$Download_Icon_path_jpg = $Icons_DIR & $ContentInfo_AppKey & '.jpg'
		$Download_Icon_path_png = $Icons_DIR & $ContentInfo_AppKey & '.png'
		$ImagePath_Value = IniRead($Config_INI, "Settings", "ImagePath", "")
		If $ImagePath_Value = "" Then $ImagePath_Value = 2

		If $ContentInfo_AppKey <> "" Then
			$URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_ID & '/header.jpg'
			InetGet($URL, $Download_Icon_path_jpg, 16, 0)
			If $ImagePath_Value = 3 Then $download = InetGet($URL, $Download_Icon_path_png, 16, 0)
		EndIf

		$ProcessBar_Status = ($LOOP_Files_1 + 60) * 55 / $FileList_NR
		GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
	Next
EndFunc

Func _Download_Icon_for_SteamID()
	$ApplicationName = $Steam_app_Value
	$Application_ID = $Steam_app_ID
	$Download_Icon_path_jpg = $Icons_DIR & "steam.app." & $Application_ID & '.jpg'
	$Download_Icon_path_png = $Icons_DIR & "steam.app." & $Application_ID & '.png'
	$ImagePath_Value = IniRead($Config_INI, "Settings", "ImagePath", "")
	If $ImagePath_Value = "" Then $ImagePath_Value = 2
	$Steam_Check = StringLeft($ApplicationName, 5)

	If $Steam_Check = "steam" Then
		$URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_ID & '/header.jpg'
		;MsgBox(0, $Steam_Check, $URL)
		InetGet($URL, $Download_Icon_path_jpg, 16, 0)
		If $ImagePath_Value = 3 Then $download = InetGet($URL, $Download_Icon_path_png, 16, 0)
	EndIf
EndFunc

Exit
