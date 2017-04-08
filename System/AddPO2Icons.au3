#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\GUI_ICONS\AutoDataUpdate.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Inet.au3>
#include "_GDIPlus_WTOB.au3"
#include <GDIPlus.au3>

Opt("GUIOnEventMode", 1)

Global $config_ini = @ScriptDir & "\" & "config.ini"
Global $Install_DIR_StringReplace = StringReplace(@ScriptDir & "\", "System\", "")
Global $Install_Folder_VIVE_Software = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_Software", "")
Global $ApplicationList_INI = @ScriptDir & "\" & "ApplicationList.ini"
Global $gfx = @ScriptDir & "\" & "gfx\"
Global $Icons = $Install_DIR_StringReplace & "Icons\"
Global $Icons_DIR_1 = $Install_Folder_VIVE_Software & "Updater\App\Dashboard\win32\header_image\"
Global $Icons_DIR_2 = $Icons
Global $Icons_DIR_3 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_1", "")
Global $Icons_DIR_4 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_2", "")
Global $Check_IconPath = IniRead($Config_INI, "Settings", "IconPath", "")
If $Check_IconPath = "1" Then $Icons = $Icons_DIR_1
If $Check_IconPath = "2" Then $Icons = $Icons_DIR_2
If $Check_IconPath = "3" Then $Icons = $Icons_DIR_3
If $Check_IconPath = "4" Then $Icons = $Icons_DIR_4
Global $Check_Load_ShowPlayerOnline_on_StartUp = IniRead($config_ini,"Settings", "Load_ShowPlayerOnline_on_StartUp", "")
Global $Check_Checkbox_FB_Check = IniRead($config_ini,"Settings", "FB_Check", "")
Global $Check_Use_VIVEHOME_lnk = IniRead($config_ini,"TEMP", "Use_VIVEHOME_lnk", "")
Global $Check_ShowPlayerOnline = IniRead($config_ini,"Settings", "ShowPlayerOnline", "")

Global $NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

Global $SteamVR_Status, $hImage1, $hImage2, $hImage1_Path, $hImage2_Path, $Check_StringSplit_NR, $Check_Filename_1, $Check_Filename_2
Global $Check_Filename_3, $Check_Filename, $hBMPBuff, $hGraphic, $hPen, $GUI_RUNDEFMSG

Global $Value_Sleep_1 = IniRead($config_ini, "Settings", "Value_ShowPlayerOnline", "")

$SteamVR_Status = "false"

Do
	_Get_ADD_DATA()

	If $Check_ShowPlayerOnline = "true" Then
		$Value_Sleep_1 = IniRead($config_ini, "Settings", "Value_ShowPlayerOnline", "")
		$Value_Sleep_1 = Int($Value_Sleep_1) * 60000

		Sleep($Value_Sleep_1)
	EndIf

	If ProcessExists("vrmonitor.exe") Then
		$SteamVR_Status = "true"
	Else
		$SteamVR_Status = "false"
	EndIf

	If $Check_Load_ShowPlayerOnline_on_StartUp = "true" Then Exit
	If $Check_Checkbox_FB_Check = "true" Then Exit
	If $Check_Use_VIVEHOME_lnk = "true" Then Exit

	If $Check_ShowPlayerOnline = "false" Then Exit

Until $SteamVR_Status = "false"


Func _Get_ADD_DATA()
	For $LOOP_1 = 1 To $NR_Applications
		Global $Check_AppId = IniRead($ApplicationList_INI, "Application_" & $LOOP_1, "AppId", "")
		Global $Check_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $Check_AppId, "IsFavorite", "")

		If $Check_IsFavorite = "true" Then
			Global $Steam_AppId = IniRead($ApplicationList_INI, "Application_" & $LOOP_1, "AppId", "")
			Global $AppId = StringReplace($Steam_AppId, 'steam.app.', '')

			Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $AppId & '/graphs/')

			Local $iPosition_1 = StringInStr($sHTML, '<li><strong>')
			Local $iPosition_2 = StringInStr($sHTML, '</strong><em>all-time peak')
			Local $iPosition_3 = $iPosition_2 - $iPosition_1

			Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)
			Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)

			Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
			$PlayersOnline_right_now = $PlayersOnline_right_now[1]
			Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
			$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
			Global $PlayersOnline_all_time_peak = $aArray[4]

			_Write_PO_TEXT_2_Image()
			_Write_PO_Image_2_Image()
		EndIf
	Next
EndFunc

Func _Write_PO_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "PlayersOnline.jpg", $PlayersOnline_right_now, "Arial", 45, -1, 3, 0, 0,  0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\PlayersOnline" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc

Func _Write_PO_Image_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 60, $FAVImageSizeY = 60

	$Check_IconPath = IniRead($Config_INI, "Settings", "IconPath", "")
	If $Check_IconPath = "1" Then $Icons = $Icons_DIR_1
	If $Check_IconPath = "2" Then $Icons = $Icons_DIR_2
	If $Check_IconPath = "3" Then $Icons = $Icons_DIR_3
	If $Check_IconPath = "4" Then $Icons = $Icons_DIR_4

	$hImage1_Path = $Icons & "steam.app." & $AppId & ".jpg"
	If $Check_IconPath = "1" Then $hImage1_Path = $Icons & $AppId & "_header" & ".jpg"
	$hImage2_Path = @ScriptDir & "\" & "PlayersOnline.jpg"

	$Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	$Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	$Check_Filename_2 = StringRight($Check_Filename_1, 11)
	$Check_Filename = $Check_Filename_1

	If $Check_Filename_2 = "_header.jpg" Then
		$Check_Filename_3 = StringReplace($Check_Filename_1, '_header.jpg', '')
		$Check_Filename = "steam.app." & $Check_Filename_3 & ".jpg"
	EndIf

	GUISetState()

	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hImage2 = _GDIPlus_ImageLoadFromFile($hImage2_Path)

	$hBMPBuff = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)

	;Graphics here
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 3, 3, $FAVImageSizeX, $FAVImageSizeY)

	_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 60 + 3, 60 + 3, $hPen); $hPen 3 pixels thick

	GUIRegisterMsg(0xF, "MY_PAINT"); Register PAINT-Event 0x000F = $WM_PAINT (WindowsConstants.au3)
	GUIRegisterMsg(0x85, "MY_PAINT") ; $WM_NCPAINT = 0x0085 (WindowsConstants.au3)Restore after Minimize.

	;Save composite image
	Local $sNewName = $Icons & "Favorites\" & $Check_Filename
	Global $NewIcon_Path = $sNewName

	_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path) ; $hBMPBuff the bitmap

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_PO_Image_2_Image()
EndFunc

Func MY_PAINT($hWnd, $msg, $wParam, $lParam)
    Return $GUI_RUNDEFMSG
EndFunc

Func _Quit_PO_Image_2_Image()
    _GDIPlus_PenDispose($hPen)
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _GDIPlus_GraphicsDispose($hGraphic)
    _WinAPI_DeleteObject($hBMPBuff)
    _GDIPlus_Shutdown()
EndFunc

Exit
