#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\coding\PCDSG_1.31\ICONS\InfoWindow.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GuiToolbar.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <EventLog.au3>
#include <GuiEdit.au3>
#include <buttonconstants.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>
#include <File.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GuiHeader.au3>
#include <GuiTreeView.au3>
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <ListViewConstants.au3>
#include <TabConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>
#include "GUIListViewEx.au3"
#include "_GDIPlus_WTOB.au3"
#include <GDIPlus.au3>
#include <Inet.au3>

Opt("GUIOnEventMode", 1)

#Region Set Global and Local
Global $config_ini, $font, $font_arial, $Install_DIR, $Install_DIR_StringReplace, $gfx, $Anzeige_Fortschrittbalken
Global $Linie_oben, $Linie_unten, $Linie_rechts, $Linie_links
Global $Erster_Start, $Abfrage, $Icon_Preview_Image, $Available_Icon_Preview_Image, $Available_Icon_Preview_Image_1, $Available_Icon_Preview_Image_2, $Available_Icon_Preview_Image_3
Global $ListView, $idTreeView, $Statusbar, $GUI, $iwParam, $Button_UpdateIcons, $Check_idRadio_ImagePath
Global $Application_NR, $Write_AppId, $ListView_Selected_Row_Value
Global $hWnd, $iMsg, $iwParam, $ilParam, $GetTableArray, $iStylesEx
Global $id_CreateTreeViewItem, $APP_Name
Global $LOOP_Files_1, $SourceFile
Global $TAB_NR, $TAB_NR_1, $TAB_NR_2, $TAB_NR_3, $TAB_NR_4, $TAB_NR_1_1, $Button_1_0, $Button_2_0
Global $Name_TAB_1, $Name_TAB_2, $Name_TAB_3, $Name_TAB_4
Global $VIVE_HOME_Search_Folder, $FileSelectFolder_VIVE_HOME, $VIVE_HOME_VRAPP_Search_Folder
Global $FileSelectFolder_VIVE_HOME_VRAPP, $Button_1_1, $NR_Applications
Global $AppId, $Name, $ContentInfo_AppKey, $ContentInfo_Name, $ContentInfo_LaunchType, $ContentInfo_WorkingDirectory
Global $ContentInfo_BinaryPath, $ContentInfo_Arguments, $ContentInfo_URL, $ContentInfo_Description, $ContentInfo_NewsURL
Global $ContentInfo_ImagePath_Source, $ContentInfo_ImagePath_1, $ContentInfo_ImagePath_2, $ContentInfo_ImagePath_3, $ContentInfo_Source
Global $ContentInfo_IsDashboardOverlay, $ContentInfo_AppKey
Global $Button_1_2, $Button_2_1, $id_ContentInfo_AppKey
Global $Current_Shortcuts_ListView, $Available_Games_ListView, $Current_Groups_ListView, $Available_Groups_ListView, $NR_Shorcuts
Global $WidgetName, $GroupName, $iLV_Current_Shortcuts_ListView, $iLV_Available_Shortcuts_ListView, $iLV_Current_Groups_ListView, $iLV_Available_Groups_ListView
Global $nMsg, $Wert_Zeile_Shortcut_File, $Content_Shortcut_File, $Content_Shortcut_File_ADD_1
Global $Content_Shortcut_File_ADD_2, $Content_Shortcut_File_ADD_3, $Content_Shortcut_File_ADD_4, $Content_Shortcut_File_ADD_5
Global $Content_Shortcut_File_ADD_6, $Content_Shortcut_File_ADD_7, $Content_Shortcut_File_ADD_8, $Content_Shortcut_File_ADD_9, $Content_Shortcut_File_ADD_10
Global $Content_Shortcut_File_ADD_11, $Content_Shortcut_File_ADD_12, $Content_Shortcut_File_ADD_13, $Content_Shortcut_File_ADD_14
Global $Content_Shortcut_File_ADD_15, $Content_Shortcut_File_ADD_16, $Content_Shortcut_File_ADD_17, $Content_Shortcut_File_ADD_18
Global $Content_Shortcut_File_ADD_19, $Content_Shortcut_File_ADD_20, $Content_Shortcut_File_ADD_21, $Content_Shortcut_File_ADD_22
Global $Content_Shortcut_File_ADD_23, $Content_Shortcut_File_ADD_24, $Content_Shortcut_File_ADD_25, $Content_Shortcut_File_ADD_26
Global $TreeView_Steam_app_ID, $Content_Shortcut_File_ADD, $Content_Shortcut_File_NEW
Global $Shortcut_NR, $Wert_Zeile_Shortcut_Split, $Shortcut_Split_1, $Shortcut_Split_2, $Label, $Value
Global $Value_1, $Value_2, $Value_3, $Value_4, $Label_Stringlen, $TAB_Name, $iIndex, $Zeilen_Nr
Global $ListView_Selected_Row_Index, $ListView_Selected_Row_Nr, $ListView_Item_Array
Global $ListView_Item_Name_ID, $New_Icon_steam_app_ID, $New_Icon_steam_app_ID_Path
Global $VIVE_Home_DB_Path, $VIVE_Home_DB_TABLE_Name, $ImagePath_Value, $Check_steam_StringInStr, $FileOpen_New_Icon_Path
Global $Input, $TreeView_Steam_app_ID_Selected, $TreeView_Steam_ID_Selected, $TreeView_Name_Selected, $Filename_SerializationGuid, $Application_App_Name
Global $Ebene_temp, $Produkt_Nr_anzeige, $Anzeige_Spalte, $FileList_NR, $ProcessBar_Status, $File, $Wert_Zeile_Check_HTTP_File, $Check_HTTP
Global $Wert_Zeile_Check_steam_File, $Anzahl_Zeilen, $Wert_Zeile_komplett, $Check_Name, $Name, $Wert, $Wert_AppId, $Wert_AppId_Zeile
Global $AppId_Name, $AppId_Wert, $Wert_Zeile_ContentInfo, $Value_Zeile_ContentInfo, $Label_1, $Label_2, $Label_3, $Label_4, $Label_5, $Label_6
Global $Label_7, $Label_8, $Label_9, $Label_10, $Label_11, $Value_1, $Value_2, $Value_3, $Value_4, $Value_5, $Value_6, $Value_7, $Value_8
Global $Value_0, $Value_10, $Value_11, $ContentInfo_Key_1, $ContentInfo_Key_2, $ContentInfo_Key_3, $ContentInfo_Key_4, $ContentInfo_Key_5, $ContentInfo_Key_6
Global $ContentInfo_Key_7, $ContentInfo_Key_8, $ContentInfo_Key_9, $ContentInfo_Key_10, $ContentInfo_Key_11
Global $ContentInfo_Value_1, $ContentInfo_Value_2, $ContentInfo_Value_3, $ContentInfo_Value_4, $ContentInfo_Value_5, $ContentInfo_Value_6, $ContentInfo_Value_7
Global $ContentInfo_Value_8, $ContentInfo_Value_9, $ContentInfo_Value_10, $ContentInfo_Value_11, $Check_INI_Value_Name, $Check_INI_Wert
Global $Value_6_1, $Value_6_2, $Value_9, $Value_9_Source, $Check_HTTP_9, $ContentInfo_Key_6_1, $ContentInfo_Value_6_1
Global $TreeView_ImagePath_Selected, $Wert_Zeile, $Check_steam, $NR_of_Files, $Application_ID, $Download_Icon_path_jpg, $Download_Icon_path_png
Global $URL, $ImagePath_Value, $ApplicationName, $Application_ID, $Download_Icon_path_jpg, $Download_Icon_path_png, $Steam_Check
Global $ImagePath_Value, $Check_Steam_APP, $DeserializedClassVersion, $SerializationGuid, $ItemGuid, $ChangeCount, $VersionId, $LatestAvailableVersionId
Global $MandatoryUpdateWaiting, $PurchaseTime, $FilesUrl, $Subdirectory, $FullAppPath, $OpenVRStatus, $OpenVRInfoHash, $IsShareableApp, $CMSContentInfos
Global $ISOLangCountry, $ISOLang, $ISOCountry, $ContentInfo_ImagePath_NR, $LastUpdate, $HttpDownloadFilesExpirationDate, $HttpDownloadFiles, $ApplicationStatus
Global $UserSubscriptions, $TotalDownloadSize, $DownloadProgressSize, $DownloadCompletionDate, $LastLaunchAttemptDate, $ULastLaunchAttemptRetStatus
Global $InstallCommand, $UninstallCommand, $LaunchCommand, $InstallingDependency, $IsNotViveportContent, $File_Write
Global $download, $ImagePath_Value, $ContentInfo_ImagePath, $ContentInfo_ImagePath_new, $GameName, $Available_GameName, $NR_GameNames
Global $GroupWidgetName, $GroupWidgetUID, $Available_Appkey, $Appkey, $Value_Scale_X, $Value_Scale_Y, $Value_Scale_Z
Global $sRet, $aRet, $aContext, $aColArray, $aRet_1, $Content_Available_Shortcuts_ListView, $NEW_Content_Available_Shortcuts_ListView, $Content_Current_Shortcuts_ListView
Global $NEW_Content_Current_Shortcuts_ListView, $NR_ROWS_old, $NR_ROWS_NEW, $Content_old, $Content_new_Check, $DragandDrop_Name
Global $NR_Shorcut_new, $Read_SS_WidgetName, $Read_SS_WidgetUID, $Read_SS_WidgetType, $Read_SS_IsVisible, $Read_SS_IsPhysicsEnabled, $Read_SS_Position_X
Global $Read_SS_Position_Y, $Read_SS_Position_Z, $Read_SS_Rotation_X, $Read_SS_Rotation_Y, $Read_SS_Rotation_Z, $Read_SS_Scale_X, $Read_SS_Scale_Y, $Read_SS_Scale_Z
Global $Read_SS_WidgetInfoString_TargetScaleX, $Read_SS_WidgetInfoString_TargetScaleY, $Read_SS_WidgetInfoString_TargetScaleZ, $Read_SS_WidgetInfoString_appkey
Global $Read_SS_glass, $Read_SS_frame, $Read_SS_camera, $Read_SS_shuffle, $Read_SS_duration, $Read_SS_currentFilePath, $Read_SS_currentFolderPath
Global $Read_SS_currentState, $Read_SS_photoFrameTimingIndex
Global $GameName_DB, $NR_GameName_DB, $Get_DB_Name, $NEW_Content_Available_Groups_ListView, $NEW_Content_Current_Groups_ListView
Global $OnClick, $GetItemChecked, $Temp_Content, $LOOP_CheckContent_4, $LOOP_CheckContent_5
Global $Label_Shortcut_Settings_Group_Name, $Group_Name, $Input_Group_Name
Global $Status_Checkbox_Group_IsVisible, $Checkbox_Group_IsVisible, $Status_Checkbox_Group_IsPhysicsEnabled, $Checkbox_Group_IsPhysicsEnablede
Global $Value_UpDown_Group_Position_X, $Input_UpDown_Group_Position_X, $Updown_Group_Position_X
Global $Value_UpDown_Group_Position_Y, $Input_UpDown_Group_Position_Y, $Updown_Group_Position_Y
Global $Value_UpDown_Group_Position_Z, $Input_UpDown_Group_Position_Z, $Updown_Group_Position_Z
Global $Status_Checkbox_Group_glass, $Checkbox_Group_glass, $Status_Checkbox_Group_frame, $Checkbox_Group_frame
Global $Label_Shortcut_Settings_Name, $Input_Shortcut_Name, $Status_Checkbox_IsVisible, $Checkbox_IsVisible, $Status_Checkbox_IsPhysicsEnabled
Global $Checkbox_IsPhysicsEnablede, $Value_UpDown_Position_X, $Input_UpDown_Position_X, $Updown_Position_X
Global $Value_UpDown_Position_Y, $Input_UpDown_Position_Y, $Updown_Position_Y
Global $Value_UpDown_Position_Z, $Input_UpDown_Position_Z, $Updown_Position_Z
Global $Input_Shortcut_appkey, $Value_appkey, $DragandDrop_Name, $NR_TO, $Content_Shortcut_File_ADD_9_1
Global $Content_Group_currentFilePath, $VIVEHOME_Shortcut_File_source, $VIVEHOME_Shortcut_File_source_bak
Global $Value_Checkbox_Group_IsVisible, $Value_Checkbox_Group_IsPhysicsEnablede, $Value_Checkbox_Group_glass, $Value_Checkbox_Group_frame
Global $New_Icon_URL, $New_Icon_Path, $currentFilePath, $NR_Name_from_Path, $Name_from_Path, $Name_from_Path_1, $Name_from_Path_2, $Name_from_Path_3, $GroupName_Check
Global $aRow_2, $iRows_2, $iCols_2, $iRows_2, $Content_Shortcut_File_1, $Content_Shortcut_File_2
Global $FileList_IconsFolder_1, $FileList_IconsFolder_2, $FileList_IconsFolder_3, $NR_Icons, $CheckImagePath, $IconName
Global $Available_Games_ListViewItem, $Current_Shortcuts_ListViewItem, $CheckboxStatus, $Check_GameName, $Check_Application_Name, $Check_Application_AppId
Global $ApplicationList_AppId, $ApplicationList_IsFavorite, $hImage_Path, $hImage1_Path, $hImage2_Path, $hBMPBuff, $Check_ImagePath
Global $Check_StringSplit_NR, $Check_Filename, $NewIcon_Path, $Check_Application_IsFavorite, $Check_Filename_1, $Check_Filename_2, $Check_Filename_3, $Check_Filename_3
Global $ListView_Favorite_Image, $VIVE_Software_Search_Folder, $FileSelectFolder_VIVE_Software, $SteamGameID, $FileCopy_source, $FileCopy_target
Global $Available_Groups_ListViewItem, $Button_AddIcons, $Button_Save_GroupName, $GameName_ListView, $GameName_Input, $Selected_Group_NR
Global $Status_Checkbox_Group_Name_2_Image, $Checkbox_Group_Name_2_Image, $Label_Shortcut_Settings_Group_Image
Global $Check_idRadio_GroupImage, $idRadio_GroupImage_1, $idRadio_GroupImage_2, $idRadio_GroupImage_3
Global $IconsDrop2_ListView, $BK_Path_IconsDrop2_ListView, $Content_IconsDrop2_ListView, $iLV_IconsDrop2_ListView, $ListView_content, $Drop_IconName
Global $Drop_Icon_Path, $Icon_Folder, $ListView_Check_Name_Array, $Drop_IconAppKey, $ListView_IconsDrop2_Selected_Row_Index
Global $ListView_IconsDrop2_Selected_Row_Nr, $GameName_IconsDrop2, $Application_App_Name_search
Global $hQuery, $aRow, $iRows, $iCols, $aNames, $Steam_app_Value, $Steam_app_ID
Global $IconName, $ApplicationNR, $Status_Checkbox_ShowPlayerOnline, $Checkbox_ShowPlayerOnline, $Check_ShowPlayerOnline
Global $Value_ShowPlayerOnline, $Input_ShowPlayerOnline, $UpDown_ShowPlayerOnline, $Status_Checkbox, $Value_UpDown_PlayerOnline
Global $VIVE_HOME_Software_Search_Folder, $VIVE_HOME_Software_Folder, $CheckIf_SteamGame
Global $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp, $Checkbox_Load_ShowPlayerOnline_on_StartUp
Global $PO_right_now, $PO_24h_peak, $PO_all_time, $ListView_Item_Name, $ListView_Item_SteamID
Global $Input_Install_Folder, $Button_Install_Folder, $Input_Install_Folder_VIVE_Software, $Button_Install_Folder_VIVE_Software
Global $Input_Install_Folder_VIVE_HOME, $Button_Install_Folder_VIVE_HOME, $Input_VIVE_HOME, $Button_VIVE_HOME, $Input_VIVE_HOME_VRAPP, $Button_VIVE_HOME_VRAPP
Global $FileSelectFolder, $Value_Input, $Check_Value_Input, $Label_Settings_2, $Label_Settings_2, $VIVE_HOME_ApplicationList_Folder

Local $hQuery, $aRow, $iRows, $iCols, $aNames
#endregion

#Region Declare Variables/Const 1
Global $Version = "0.5"
Global $config_ini = (@ScriptDir & "\config.ini")
$Install_DIR_StringReplace = StringReplace($config_ini, 'System\config.ini', '')
$Install_DIR = $Install_DIR_StringReplace
IniWrite($config_ini, "Folders", "Install_Folder", $Install_DIR)
Global $Install_Folder_VIVE_Software = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_Software", "")
Global $Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
Global $VIVE_HOME_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME", "")
Global $VIVE_HOME_VRAPP_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME_VRAPP", "")
Global $VIVEHOME_Shortcut_File_source = "C:\Users\cogent\AppData\Roaming\HTC\Vive\WidgetPreferences.json"
Global $VIVEHOME_Shortcut_File_source_bak = "C:\Users\cogent\AppData\Roaming\HTC\Vive\WidgetPreferences.json.bak"

Global $gfx = @ScriptDir & "\" & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $Icons_DIR_1 = $Install_Folder_VIVE_Software & "Updater\App\Dashboard\win32\header_image\"
Global $Icons_DIR_2 = $Icons
Global $Icons_DIR_3 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_1", "")
Global $Icons_DIR_4 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_2", "")

$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")
If $Check_idRadio_ImagePath = "" Then IniWrite($config_ini, "Settings", "IconPath", "1")
If $Check_idRadio_ImagePath = "" Then $Check_idRadio_ImagePath = 1

If $Check_idRadio_ImagePath = "" Then $Icons = $Icons
If $Check_idRadio_ImagePath = "1" Then $Icons = $Icons_DIR_1
If $Check_idRadio_ImagePath = "2" Then $Icons = $Icons_DIR_2
If $Check_idRadio_ImagePath = "3" Then $Icons = $Icons_DIR_3
If $Check_idRadio_ImagePath = "4" Then $Icons = $Icons_DIR_4
#endregion

#region Erster Start Abfrage

$Erster_Start = IniRead($config_ini, "Settings", "First_Start", "true")

If $Erster_Start = "true" or $Erster_Start = "" Then

	$Abfrage = MsgBox (4, "First Start - VIVE Home Icon Manager - Version " & $Version, "VIVE HOME settings - folders:" & @CRLF & _
																	"VIVEHIM tries to detect the needed VIVE HOME settings folder on start." & @CRLF & _
																	"If settings folders are not found it will show a message box asking for the VIVE HOME settings folder." & @CRLF & @CRLF & _
																	"Do you want to show this Window again?" & @CRLF)

	If $Abfrage = 6 Then ;Ja - Auswahl = JA
		IniWrite($config_ini, "Settings", "First_Start", "true")
	Else
		IniWrite($config_ini, "Settings", "First_Start", "false")
	EndIf


EndIf

#endregion

#Region Check Variables if empty

If $Install_Folder_VIVE_Software = "" Then
	$VIVE_HOME_Software_Search_Folder = "C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe"
	$VIVE_HOME_Software_Folder = StringReplace($VIVE_HOME_Software_Search_Folder, 'ViveHome.exe', '')
	$VIVE_Software_Search_Folder = StringReplace($VIVE_HOME_Software_Search_Folder, 'Updater\App\Home\win32\ViveHome.exe', '')

	If FileExists($VIVE_HOME_Software_Search_Folder) Then
		IniWrite($Config_INI, "Folders", "Install_Folder_VIVE_Software", $VIVE_Software_Search_Folder)
		IniWrite($Config_INI, "Folders", "Install_Folder_VIVE_HOME", $VIVE_HOME_Software_Folder)
	Else
		MsgBox(0, "Vive Software folder", "VIVE Software folder was not found." & @CRLF & _
						"Choose the folder before continue." & @CRLF & @CRLF & _
						"It can normally be found in the following directory:" & @CRLF & _
						$VIVE_HOME_Software_Search_Folder & @CRLF & @CRLF & _
						'Folder contains the following Files (few examples):' & @CRLF & _
						'- PCClient [Folder]' & @CRLF & _
						'- Steam [Folder]' & @CRLF & _
						'- Updater [Folder]' & @CRLF)

		$FileSelectFolder_VIVE_Software = FileSelectFolder("Choose VIVE Home folder", $VIVE_Software_Search_Folder)
		IniWrite($Config_INI, "Folders", "Install_Folder_VIVE_Software", $FileSelectFolder_VIVE_Software & "\")
		IniWrite($Config_INI, "Folders", "Install_Folder_VIVE_HOME", $FileSelectFolder_VIVE_Software & "\Updater\App\Home\win32\")
	EndIf
EndIf


If $VIVE_HOME_Folder = "" Then
	$VIVE_HOME_Search_Folder = "C:\ProgramData\HTC\Vive\"
	$VIVE_HOME_ApplicationList_Folder = $VIVE_HOME_Search_Folder & "ApplicationList\"

	If FileExists($VIVE_HOME_Search_Folder & "Vive.settings") Then
		IniWrite($Config_INI, "Folders", "VIVE_HOME", $VIVE_HOME_Search_Folder)
	Else
		MsgBox(0, "Vive Home Desktop APP settings folder", "VIVE Home Desktop APP settings folder was not found." & @CRLF & _
						"Choose the folder before continue." & @CRLF & @CRLF & _
						"It can normally be found in the following directory:" & @CRLF & _
						$VIVE_HOME_Search_Folder & @CRLF & @CRLF & _
						'Folder contains the following Files (few examples):' & @CRLF & _
						'- ApplicationList [Folder]' & @CRLF & _
						'- Vive.settings' & @CRLF)

		$FileSelectFolder_VIVE_HOME = FileSelectFolder("Choose VIVE Home folder", $VIVE_HOME_Search_Folder)
		IniWrite($Config_INI, "Folders", "VIVE_HOME", $FileSelectFolder_VIVE_HOME & "\")
	EndIf

EndIf

If $VIVE_HOME_VRAPP_Folder = "" Then
	$VIVE_HOME_VRAPP_Search_Folder = "C:\Users\" & @UserName & "\AppData\Roaming\HTC\Vive\"

	If FileExists($VIVE_HOME_VRAPP_Search_Folder & "vive.sqlite") or FileExists($VIVE_HOME_VRAPP_Search_Folder & "WidgetPreferences.json") Then
		IniWrite($Config_INI, "Folders", "VIVE_HOME_VRAPP", $VIVE_HOME_VRAPP_Search_Folder)
	Else
		MsgBox(0, "Vive Home VR APP settings folder", "VIVE Home VR APP settings folder was not found." & @CRLF & _
						"Choose the folder before continue." & @CRLF & @CRLF & _
						"It can normally be found in the following directory." & @CRLF & _
						'C:\Users\' & @UserName & '\AppData\Roaming\HTC\Vive\' & @CRLF & @CRLF & _
						'Folder contains the following Files (few examples):' & @CRLF &  _
						'- vive.sqlite' & @CRLF & _
						'- WidgetPreferences.json' & @CRLF)

		$FileSelectFolder_VIVE_HOME_VRAPP = FileSelectFolder("Choose VIVE Home folder", $VIVE_HOME_VRAPP_Search_Folder)
		IniWrite($Config_INI, "Folders", "VIVE_HOME_VRAPP", $FileSelectFolder_VIVE_HOME_VRAPP & "\")
	EndIf

EndIf

#endregion

#Region Declare Variables/Const 2

Global $Install_DIR = IniRead($config_ini, "Folders", "Install_Folder", "")
Global $System_DIR = $Install_DIR & "System\"
Global $Icons_DIR = $Install_DIR & "Icons\"
Global $Install_Folder_VIVE_Software = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_Software", "")
Global $Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
Global $Shortcuts_INI = $System_DIR & "Shortcuts.ini"
Global $ApplicationList_INI = $System_DIR & "ApplicationList.ini"
Global $VIVE_HOME_Folder = IniRead($config_ini, "Folders", "VIVE_HOME", "")
Global $VIVE_HOME_VRAPP_Folder = IniRead($config_ini, "Folders", "VIVE_HOME_VRAPP", "")
Global $VIVE_HOME_ApplicationList_Folder = $VIVE_HOME_Folder & "ApplicationList\"
Global $Steam_Shortcut_File = "C:\Program Files (x86)\Steam\userdata\193523507\config\shortcuts.vdf"
Global $Steam_Shortcut_File = "C:\Program Files (x86)\Steam\userdata\193523507\config\shortcuts_temp.vdf"

FileDelete($ApplicationList_INI)
#endregion


#region Declare Names
$Name_TAB_1 = "VIVE HOME (VR APP)"
$Name_TAB_2 = "VIVE HOME (DESKTOP APP)"
$Name_TAB_3 = "SHORTCUS + WIDGETS"
$Name_TAB_4 = "SETTINGS"
#endregion

#region GUI Erstellen
Local $hGUI, $hGraphic, $hPen
Local $GUI, $aSize, $aStrings[5]
Local $btn, $chk, $rdo, $Msg
Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
Local $Wow64 = ""
If @AutoItX64 Then $Wow64 = "\Wow6432Node"
Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"


; Erstellen der GUI
$GUI = GUICreate("VIVE HOME Icon Manager", 643, 545, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW)) ;535

; PROGRESS
$Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, 520, 644, 5)

;Status Bar $Anzeige_Fortschrittbalken
$Statusbar = _GUICtrlStatusBar_Create($GUI)
_GUICtrlStatusBar_SetSimple($Statusbar, True)

GUISetState()

; Darstellung Icon Preview Rahmen
$Linie_oben = GUICtrlCreatePic($gfx & "Frame.jpg", 515, 4, 117, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
$Linie_unten = GUICtrlCreatePic($gfx & "Frame.jpg", 515, 62, 117, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
$Linie_rechts = GUICtrlCreatePic($gfx & "Frame.jpg", 512, 4, 3, 61, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
$Linie_links = GUICtrlCreatePic($gfx & "Frame.jpg", 632, 4, 3, 61, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))

; Darstellung Icon Preview
$Icon_Preview_Image = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 515, 7, 117, 55)


; Toolbar oben
$Button_UpdateIcons = GUICtrlCreateButton("Download Icons", 5, 5, 151, 39, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_UpdateIcons, $gfx & "Download_Icons.bmp")
GuiCtrlSetTip(-1, "Download Icons for all Steam games." & @CRLF & @CRLF & "Icons will be save in:"  & @CRLF & $Icons_DIR_2)

GUICtrlCreateGroup("Icon Path", 173, 0, 322, 45)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 8, 400, 6, $font_arial)

$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

If $Check_idRadio_ImagePath = "" Then IniWrite($config_ini, "Settings", "IconPath", "1")
If $Check_idRadio_ImagePath = "" Then $Check_idRadio_ImagePath = 1

Global $idRadio_ImagePath_1 = GUICtrlCreateRadio("Use VIVE Dashboard folder", 182, 13, 145, 15)
If $Check_idRadio_ImagePath = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)

Global $idRadio_ImagePath_2 = GUICtrlCreateRadio("Use VIVEHIM folder", 182, 27, 145, 15)
If $Check_idRadio_ImagePath = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)

Global $idRadio_ImagePath_3 = GUICtrlCreateRadio("Use custom folder 1", 338, 13, 115, 13)
If $Check_idRadio_ImagePath = "3" Then GUICtrlSetState(-1, $GUI_CHECKED)

Global $idRadio_ImagePath_4 = GUICtrlCreateRadio("Use custom folder 2", 338, 27, 115, 13)
If $Check_idRadio_ImagePath = "4" Then GUICtrlSetState(-1, $GUI_CHECKED)


$Button_AddIcons = GUICtrlCreateButton("Add Icons", 456, 10, 30, 30, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_AddIcons, $gfx & "AddIcons.bmp")
GuiCtrlSetTip(-1, "Adds selected Icon Path to all Steam games in VIVE HOME VR APP.")



; Toolbar unten
Global $Button_Start_VIVEHOME = GUICtrlCreateButton("Start VIVE HOME", 261, 480, 120, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_Start_VIVEHOME, $gfx & "VIVEHOME.bmp")
GuiCtrlSetTip(-1, "Starts VIVE HOME VR APP." & @CRLF & @CRLF & "If 'Load Players Online DATA on StartUp' is enabled in settings TAB then it also starts adding Players Online Infos to the Icons." & @CRLF & _
					"It stops automatically one 'pause loop' after SteamVR was closed." & @CRLF & _
					"Time for the 'pause loop' can be set in TAB '" & $Name_TAB_3 & "'.")

Global $Button_INFO = GUICtrlCreateButton("INFO", 525, 480, 35, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_INFO, "shell32.dll", 23, True)
GuiCtrlSetTip(-1, "Shows some Informations and if selected opens the Forum URLs in standard Internet Browser.")

Global $Button_Restart = GUICtrlCreateButton("Restart", 565, 480, 35, 35, $BS_BITMAP) ;
_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
GuiCtrlSetTip(-1, "Restarts VIVEHIM.")

Global $Button_Exit = GUICtrlCreateButton("Exit", 602, 480, 35, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
GuiCtrlSetTip(-1, "Closes VIVEHIM.")

_GUICtrlStatusBar_SetText($Statusbar, "LOADING, please wait..." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")

_Search_Files()

; TABS ERSTELLEN
$TAB_NR = GUICtrlCreateTab(2, 50, 1095, 575, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
GUICtrlSetOnEvent($TAB_NR, "_Tab")

$TAB_NR_1 = GUICtrlCreateTab(70, 105, 420, 380)
$TAB_NR_1_1 = GUICtrlCreateTabItem($Name_TAB_1)
;Global $listview = GUICtrlCreateListView("", 0, 70, 644, 404, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT), $TAB_NR_1)
Global $listview = GUICtrlCreateListView("", 0, 70, 644, 404, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT), $TAB_NR_1)
_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx)) ; $LVS_EX_CHECKBOXES


; Load images
$ListView_Favorite_Image = _GUIImageList_Create(16,16)
_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")
_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_2.bmp")
_GUICtrlListView_SetImageList($listview, $ListView_Favorite_Image, 1)

; Add columns
_GUICtrlListView_AddColumn($listview, "NR.", 40)
_GUICtrlListView_AddColumn($listview, "Name", 140)
_GUICtrlListView_AddColumn($listview, "App Key", 165)
_GUICtrlListView_AddColumn($listview, "Icon File Path", 282)
_GUICtrlListView_AddColumn($listview, "Launch Count", 88)
_GUICtrlListView_AddColumn($listview, "Last Launched", 88)
_GUICtrlListView_AddColumn($listview, "Total Played", 88)
_GUICtrlListView_AddColumn($listview, "Is Favorite", 88)
_GUICtrlListView_AddColumn($listview, "Installed Time", 88)
_GUICtrlListView_AddColumn($listview, "Icon Url", 88)
_GUICtrlListView_AddColumn($listview, "Icon Timestamp", 98)
_GUICtrlListView_AddColumn($listview, "Icon Fetch Time", 97)


_Read_from_VIVEHOME_DB()
$ProcessBar_Status = 90
GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

GUICtrlCreateTabItem("")


$TAB_NR_2 = GUICtrlCreateTabItem($Name_TAB_2)

Local $Kopfzeile_Explorerbaum = GUICtrlCreateListView("", 0, 70, 650, 28, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT), $TAB_NR_2)
_GUICtrlListView_SetExtendedListViewStyle($Kopfzeile_Explorerbaum, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))

_GUICtrlListView_AddColumn($Kopfzeile_Explorerbaum, "VIVE HOME - Application Overview", 645)
Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

Local $idTreeView = GUICtrlCreateTreeView(0, 97, 645, 377, $iStyle, $WS_EX_CLIENTEDGE)

$NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")
If $NR_Applications = "" Then $NR_Applications = 1

For $I = 0 To $NR_Applications

	$AppId = IniRead($ApplicationList_INI, "Application_" & $I, "AppId", "")
	$Name = IniRead($ApplicationList_INI, "Application_" & $I, "Name", "")
	$ContentInfo_AppKey = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_AppKey", "")
	$ContentInfo_Name = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_Name", "")
	$ContentInfo_LaunchType = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_LaunchType", "")
	$ContentInfo_WorkingDirectory = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_WorkingDirectory", "")
	$ContentInfo_BinaryPath = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_BinaryPath", "")
	$ContentInfo_Arguments = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_Arguments", "")
	$ContentInfo_URL = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_URL", "")
	$ContentInfo_Description = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_Description", "")
	$ContentInfo_NewsURL = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_NewsURL", "")
	$ContentInfo_ImagePath_Source = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_ImagePath", "")
	$ContentInfo_ImagePath_1 = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_ImagePath_1", "")
	$ContentInfo_ImagePath_2 = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_ImagePath_2", "")
	$ContentInfo_ImagePath_3 = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_ImagePath_3", "")
	$ContentInfo_Source = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_Source", "")
	$ContentInfo_IsDashboardOverlay = IniRead($ApplicationList_INI, "Application_" & $I, "ContentInfo_IsDashboardOverlay", "")

	If $Name <> "" Then Global $id_CreateTreeViewItem = GUICtrlCreateTreeViewItem($Name, $idTreeView)
	GUICtrlSetOnEvent($id_CreateTreeViewItem, "_Change_Preview_Icon_Desktop_APP")

		If $ContentInfo_AppKey <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("AppKey:  " & $ContentInfo_AppKey, $id_CreateTreeViewItem)
		If $ContentInfo_Name <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("Name:  " & $ContentInfo_Name, $id_CreateTreeViewItem)
		If $ContentInfo_LaunchType <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("LaunchType:  " & $ContentInfo_LaunchType, $id_CreateTreeViewItem)
		If $ContentInfo_WorkingDirectory <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("WorkingDirectory:  " & $ContentInfo_WorkingDirectory, $id_CreateTreeViewItem)
		If $ContentInfo_BinaryPath <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("BinaryPath:  " & $ContentInfo_BinaryPath, $id_CreateTreeViewItem)
		If $ContentInfo_Arguments <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("Arguments:  " & $ContentInfo_Arguments, $id_CreateTreeViewItem)
		If $ContentInfo_URL <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("URL:  " & $ContentInfo_URL, $id_CreateTreeViewItem)
		If $ContentInfo_Description <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("Description:  " & $ContentInfo_Description, $id_CreateTreeViewItem)
		If $ContentInfo_NewsURL <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("NewsURL:  " & $ContentInfo_NewsURL, $id_CreateTreeViewItem)
		If $ContentInfo_ImagePath_Source <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("ImagePath_Source:  " & $ContentInfo_ImagePath_Source, $id_CreateTreeViewItem)
		If $ContentInfo_ImagePath_1 <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("ImagePath_1:  " & $ContentInfo_ImagePath_1, $id_CreateTreeViewItem)
		If $ContentInfo_ImagePath_2 <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("ImagePath_2:  " & $ContentInfo_ImagePath_2, $id_CreateTreeViewItem)
		If $ContentInfo_ImagePath_3 <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("ImagePath_3:  " & $ContentInfo_ImagePath_3, $id_CreateTreeViewItem)
		If $ContentInfo_Source <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("Source:  " & $ContentInfo_Source, $id_CreateTreeViewItem)
		If $ContentInfo_IsDashboardOverlay <> "" Then $id_ContentInfo_AppKey = GUICtrlCreateTreeViewItem("IsDashboardOverlay:  " & $ContentInfo_IsDashboardOverlay, $id_CreateTreeViewItem)

Next


GUICtrlCreateTabItem("")

$ProcessBar_Status = 93
GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

$TAB_NR_3 = GUICtrlCreateTabItem($Name_TAB_3)

_Read_Steam_Shortcuts()
$ProcessBar_Status = 96
GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

$font = "arial"
$font_arial = "arial"

; Create ListViews
$Available_Games_ListView  = GUICtrlCreateListView("VIVE HOME Games / Favorites", 10, 85, 200, 160)
_GUICtrlListView_SetColumnWidth($Available_Games_ListView, 0, 178)
_GUICtrlListView_SetExtendedListViewStyle($Available_Games_ListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))

$Current_Shortcuts_ListView = GUICtrlCreateListView("Available Icons", 430, 85, 200, 160)
_GUICtrlListView_SetColumnWidth($Current_Shortcuts_ListView, 0, 178)

$Current_Groups_ListView = GUICtrlCreateListView("Current Groups", 10, 300, 200, 160)
_GUICtrlListView_SetColumnWidth($Current_Groups_ListView, 0, 178)

$Available_Groups_ListView  = GUICtrlCreateListView("Available Groups", 220, 300, 200, 160)
_GUICtrlListView_SetColumnWidth($Available_Groups_ListView, 0, 178)

$IconsDrop2_ListView  = GUICtrlCreateListView("Drop here",  350, 97, 70, 60)
_GUICtrlListView_SetExtendedListViewStyle($IconsDrop2_ListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))
_GUICtrlListView_SetColumnWidth($IconsDrop2_ListView, 0, 65)


; Create arrays and fill ListViews
$NR_Shorcuts = IniRead($Shortcuts_INI, "NR_Shorcuts", "NR", "")
$GameName = _GUICtrlListView_GetItemTextArray($listview)
$NR_GameNames = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

$FileList_IconsFolder_1 = _FileListToArray($Icons, "*.jpg")

If $FileList_IconsFolder_1 <> 0 Then
	$NR_Icons = $FileList_IconsFolder_1[0]
Else
	$NR_Icons = 0
EndIf


Global $Content_Current_Shorcuts_ListView[$NR_Icons], $Content_Available_Games_ListView[$NR_GameNames]
Global $Content_Current_Groups_ListView[$NR_Shorcuts], $Content_Available_Groups_ListView[10], $Content_IconsDrop2_ListView[1]

For $LOOP_Content_1 = 1 To $NR_GameNames ; - 1
	$GameName = IniRead($ApplicationList_INI, "Application_" & $LOOP_Content_1, "Name", "")
	$Available_GameName = $GameName

	If $Available_GameName <> "" Then
		$Content_Available_Games_ListView[$LOOP_Content_1 - 1] = $Available_GameName
		$Available_Games_ListViewItem = GUICtrlCreateListViewItem($Available_GameName, $Available_Games_ListView)
		GUICtrlSetOnEvent($Available_Games_ListViewItem, "_ClickOn_Current_Available_Games_ListView")

		$ApplicationList_AppId = IniRead($ApplicationList_INI, "Application_" & $LOOP_Content_1, "AppId", "")
		$ApplicationList_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $ApplicationList_AppId, "IsFavorite", "")
		;MsgBox(0, "1", $ApplicationList_AppId & @CRLF & $ApplicationList_IsFavorite)
		If $ApplicationList_IsFavorite = "true" Then _GUICtrlListView_SetItemChecked($Available_Games_ListView, $LOOP_Content_1 - 1)
	EndIf
Next



For $LOOP_Content_2 = 1 To $NR_Icons
	$WidgetName = $FileList_IconsFolder_1[$LOOP_Content_2]

	If $WidgetName <> "" Then
		$Content_Current_Shorcuts_ListView[$LOOP_Content_2 - 1] = $WidgetName
		$Current_Shortcuts_ListViewItem = GUICtrlCreateListViewItem($WidgetName, $Current_Shortcuts_ListView)
		GUICtrlSetOnEvent($Current_Shortcuts_ListViewItem, "_ClickOn_Current_Shortcuts_ListView")
	EndIf
Next



For $LOOP_Content_3 = 1 To $NR_Shorcuts ;- 1
	$GroupWidgetName = IniRead($Shortcuts_INI, "Shortcut_" & $LOOP_Content_3, "WidgetName", "")
	$GroupWidgetUID = IniRead($Shortcuts_INI, "Shortcut_" & $LOOP_Content_3, "WidgetUID", "")
	$currentFilePath = IniRead($Shortcuts_INI, "Shortcut_" & $LOOP_Content_3, "currentFilePath", "")

	If $GroupWidgetUID = "htc_widget_photo_frame" Then
		If $GroupWidgetName = "" Then
			$GroupWidgetName = $currentFilePath

			$NR_Name_from_Path = StringInStr($GroupWidgetName, "\\", 0, -1)
			$Name_from_Path_1 = StringTrimLeft($GroupWidgetName, $NR_Name_from_Path + 1)

			$GroupName_Check = StringInStr($GroupWidgetName, "Group_", 0, -1)

			If $GroupName_Check <> 0 Then
				$Name_from_Path_2 = StringReplace($Name_from_Path_1, "Group_", "")
				$Name_from_Path_3 = StringReplace($Name_from_Path_2, ".jpg", "")
				$Name_from_Path = $Name_from_Path_3
				$GroupWidgetName = $Name_from_Path
			EndIf

		EndIf

		$Content_Current_Groups_ListView[$LOOP_Content_3 - 1] = $GroupName
		GUICtrlCreateListViewItem($GroupWidgetName, $Current_Groups_ListView)
	EndIf

Next

For $LOOP_Content_4 = 1 To 10
	$GroupName = IniRead($Config_INI, "Groups", "Group_" & $LOOP_Content_4, "")
	$Content_Available_Groups_ListView[$LOOP_Content_4 - 1] = $GroupName
    $Available_Groups_ListViewItem = GUICtrlCreateListViewItem($GroupName, $Available_Groups_ListView)
	GUICtrlSetOnEvent($Available_Groups_ListViewItem, "_ClickOn_Available_Groups_ListView")
Next

For $LOOP_Content_5 = 1 To 1
	$GroupName = ""
	$Content_IconsDrop2_ListView[0] = $GroupName
    GUICtrlCreateListViewItem($GroupName, $IconsDrop2_ListView)
Next

GUICtrlCreateLabel("Current Icon", 210, 82, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)
$Available_Icon_Preview_Image_1 = GUICtrlCreatePic($gfx & "Icon_Preview_4.jpg", 210, 97, 130, 60)

GUICtrlCreateLabel("NEW Icon", 350, 82, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)

GUICtrlCreateLabel("Selected Icon", 300, 170, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)
$Available_Icon_Preview_Image_2 = GUICtrlCreatePic($gfx & "Icon_Preview_2.jpg", 300, 185, 130, 60)



$ProcessBar_Status = 100
GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

; Initiate ListViews and set differing external drag/drop states
$iLV_Current_Shortcuts_ListView = _GUIListViewEx_Init($Current_Shortcuts_ListView, $Content_Current_Shorcuts_ListView, 1, 0, True, 128 + 256)
$iLV_Current_Groups_ListView = _GUIListViewEx_Init($Current_Groups_ListView, $Content_Current_Groups_ListView, 0, 0, True)
$iLV_Available_Groups_ListView = _GUIListViewEx_Init($Available_Groups_ListView, $Content_Available_Groups_ListView, 0, 0, True, 128 + 256)
$iLV_IconsDrop2_ListView = _GUIListViewEx_Init($IconsDrop2_ListView, $Content_IconsDrop2_ListView, 0, 0, True)



GUICtrlCreateGroup("Group Settings", 430, 296, 205, 165)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


$Label_Shortcut_Settings_Group_Name = GUICtrlCreateLabel("Group Name:", 440, 320, 200, 20) ;
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Group_Name = GUICtrlCreateInput("", 440, 340, 160, 20)
$Button_Save_GroupName = GUICtrlCreateButton("SAVE", 605, 340, 20, 20, $BS_BITMAP) ;Fragezeichen ; Y=3
_GUICtrlButton_SetImage($Button_Save_GroupName, $gfx & "Save.bmp")

$Status_Checkbox_Group_IsVisible = IniRead($config_ini,"Group_Settings", "IsVisible", "")
$Checkbox_Group_IsVisible = GUICtrlCreateCheckbox("Visible", 440, 365, 55, 20) ; 320
If $Status_Checkbox_Group_IsVisible = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)

$Status_Checkbox_Group_IsPhysicsEnabled = IniRead($config_ini,"Group_Settings", "IsPhysicsEnabled", "")
$Checkbox_Group_IsPhysicsEnablede = GUICtrlCreateCheckbox("IsPhysicsEnabled", 495, 365, 110, 20)
If $Status_Checkbox_Group_IsPhysicsEnabled = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)



$Status_Checkbox_Group_glass = IniRead($config_ini,"Group_Settings", "glass", "")
$Checkbox_Group_glass = GUICtrlCreateCheckbox("Glass", 440, 390, 50, 20)
If $Status_Checkbox_Group_glass = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)

$Status_Checkbox_Group_frame = IniRead($config_ini,"Group_Settings", "frame", "")
$Checkbox_Group_frame = GUICtrlCreateCheckbox("Frame", 495, 390, 50, 20)
If $Status_Checkbox_Group_frame = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)

$Status_Checkbox_Group_Name_2_Image = IniRead($config_ini,"Group_Settings", "frame", "")
$Checkbox_Group_Name_2_Image = GUICtrlCreateCheckbox("Write Name", 550, 390, 75, 20)
If $Status_Checkbox_Group_Name_2_Image = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)

$Label_Shortcut_Settings_Group_Image = GUICtrlCreateLabel("Group Image:", 440, 415, 200, 20) ;
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)


$Check_idRadio_GroupImage = IniRead($config_ini, "Group_Settings", "GroupImage", "")

Global $idRadio_GroupImage_1 = GUICtrlCreateRadio("Default", 440, 435, 50, 15)
If $Check_idRadio_GroupImage = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)

Global $idRadio_GroupImage_2 = GUICtrlCreateRadio("Oculus", 505, 435, 50, 15)
If $Check_idRadio_GroupImage = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)

Global $idRadio_GroupImage_3 = GUICtrlCreateRadio("VIVE", 570, 435, 50, 13)
If $Check_idRadio_GroupImage = "3" Then GUICtrlSetState(-1, $GUI_CHECKED)

; Checkbox
$Status_Checkbox_ShowPlayerOnline = IniRead($config_ini,"Settings", "ShowPlayerOnline", "")
$Checkbox_ShowPlayerOnline = GUICtrlCreateCheckbox("Show Players Online on Icon", 11, 250, 155, 20)
If $Status_Checkbox_ShowPlayerOnline = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Shows Players Online count on Icons instead of the yellow Favorite 'Star'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons on Start if VIVE HOME was started using the 'START VIVE HOME' Button." & @CRLF & _
					"Player Online counts are automatically Updated using the 'pause Loop' Time Interval until SteamVR is closed.")

; UPDOWN
Global $Value_ShowPlayerOnline = IniRead($config_ini, "Settings", "Value_ShowPlayerOnline", "")
Global $Input_ShowPlayerOnline = GUICtrlCreateInput($Value_ShowPlayerOnline, 170, 250, 40, 19)
GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font)
GuiCtrlSetTip(-1, "Time in Minutes. " & "Sets Time for the 'pause Loop'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons using this Time Interval.")
Global $UpDown_ShowPlayerOnline = GUICtrlCreateUpdown($Input_ShowPlayerOnline)
GuiCtrlSetTip(-1, "Time in Minutes. " & "Sets Time for the 'pause Loop'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons using this Time Interval.")

GUICtrlCreateTabItem("")


$TAB_NR_4 = GUICtrlCreateTabItem($Name_TAB_4)

Global $Button_Install_Folder_save, $Button_Install_Folder_VIVE_Software_save, $Button_Install_Folder_VIVE_HOME_save, $Button_VIVE_HOME_save, $Button_VIVE_HOME_VRAPP_save
Global $Button_VIVE_HOME_delete, $Button_VIVE_HOME_VRAPP_delete, $Button_Install_Folder_open, $Button_Install_Folder_VIVE_Software_open
Global $Button_Install_Folder_VIVE_HOME_open, $Button_VIVE_HOME_open, $Button_VIVE_HOME_VRAPP_open

GUICtrlCreateLabel("VIVEHIM Install path:", 10, 82, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder = GUICtrlCreateInput($install_dir, 10, 99, 315, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder = GUICtrlCreateButton("...", 330, 98, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_open = GUICtrlCreateButton("Open", 358, 98, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_save = GUICtrlCreateButton("Save", 388, 98, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE Software Install path:", 10, 122, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder_VIVE_Software = GUICtrlCreateInput($Install_Folder_VIVE_Software, 10, 139, 315, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder_VIVE_Software = GUICtrlCreateButton("...", 330, 138, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_VIVE_Software_open = GUICtrlCreateButton("Open", 358, 138, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_VIVE_Software_save = GUICtrlCreateButton("Save", 388, 138, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_Software_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_Software_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE_HOME Install path:", 10, 162, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder_VIVE_HOME = GUICtrlCreateInput($Install_Folder_VIVE_HOME, 10, 179, 315, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder_VIVE_HOME = GUICtrlCreateButton("...", 330, 178, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_VIVE_HOME_open = GUICtrlCreateButton("Open", 358, 178, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_VIVE_HOME_save = GUICtrlCreateButton("Save", 388, 178, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_HOME_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_HOME_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE_HOME Desktop APP path", 10, 212, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
GUICtrlCreateLabel("[Settings]:", 210, 212, 80, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_VIVE_HOME = GUICtrlCreateInput($VIVE_HOME_Folder, 10, 229, 315, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_VIVE_HOME = GUICtrlCreateButton("...", 330, 228, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_VIVE_HOME_open = GUICtrlCreateButton("Open", 358, 228, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_VIVE_HOME_save = GUICtrlCreateButton("Save", 388, 228, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
$Button_VIVE_HOME_delete = GUICtrlCreateButton("Delete", 412, 228, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Deletes '.appinfo' Files in ApplicationList Folder." & @CRLF & _
					"These Files are automatically created on next Start of VIVE_HOME Desktop APP.")
_GUICtrlButton_SetImage($Button_VIVE_HOME_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_save, $gfx & "Save.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_delete, $gfx & "Delete_small.bmp")

GUICtrlCreateLabel("VIVE_HOME VR APP path", 10, 252, 180, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
GUICtrlCreateLabel("[Settings]:", 176, 252, 80, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_VIVE_HOME_VRAPP = GUICtrlCreateInput($VIVE_HOME_VRAPP_Folder, 10, 269, 315, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_VIVE_HOME_VRAPP = GUICtrlCreateButton("...", 330, 268, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_VIVE_HOME_VRAPP_open = GUICtrlCreateButton("Open", 358, 268, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_VIVE_HOME_VRAPP_save = GUICtrlCreateButton("Save", 388, 268, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
$Button_VIVE_HOME_VRAPP_delete = GUICtrlCreateButton("Delete", 412, 268, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Deletes 'vive.sqlite' and 'WidgetPreferences_empty.json' in VIVE_HOME settings Folder." & @CRLF & _
					"These Files are automatically created on next Start of VIVE_HOME VR APP or SteamVR.")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_save, $gfx & "Save.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_delete, $gfx & "Delete_small.bmp")

; Checkbox
$Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = IniRead($config_ini,"Settings", "Load_ShowPlayerOnline_on_StartUp", "")
$Checkbox_Load_ShowPlayerOnline_on_StartUp = GUICtrlCreateCheckbox(" Load Players Online DATA on StartUp", 11, 300, 200, 20)
If $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Loads Players Online count Data on_StartUp for use in the GUI. " & @CRLF & @CRLF & _
					"It loads the Player Count for all SteamVR Games on StartUP. " & "Choose a Game in TAB '" & $Name_TAB_1 & "' to see the Number of Players that are currently online." & @CRLF & _
					"This function will slow down the StartUp Time for VIHEHIM on Start." & @CRLF & @CRLF)

GUICtrlCreateTabItem("")


$ProcessBar_Status = 100
GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

;GUISetState()

#endregion

#Region Funktionen Verknüpfen

GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
GUICtrlSetOnEvent($Button_Exit, "_Beenden")
GUICtrlSetOnEvent($Button_INFO, "_Button_INFO")
GUICtrlSetOnEvent($Button_Restart, "_Restart")

GUICtrlSetOnEvent($Checkbox_ShowPlayerOnline, "_Checkbox_ADD_PlayerOnline")
GUICtrlSetOnEvent($UpDown_ShowPlayerOnline, "_UpDown_PlayerOnline")

GUICtrlSetOnEvent($Button_Install_Folder, "_Button_Install_Folder")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_Software, "_Button_Install_Folder_VIVE_Software")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_HOME, "_Button_Install_Folder_VIVE_HOME")
GUICtrlSetOnEvent($Button_VIVE_HOME, "_Button_VIVE_HOME")
GUICtrlSetOnEvent($Button_VIVE_HOME_VRAPP, "_Button_VIVE_HOME_VRAPP")

GUICtrlSetOnEvent($Button_Install_Folder_open, "_Button_Install_Folder_open")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_Software_open, "_Button_Install_Folder_VIVE_Software_open")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_HOME_open, "_Button_Install_Folder_VIVE_HOME_open")
GUICtrlSetOnEvent($Button_VIVE_HOME_open, "_Button_VIVE_HOME_open")
GUICtrlSetOnEvent($Button_VIVE_HOME_VRAPP_open, "_Button_VIVE_HOME_VRAPP_open")

GUICtrlSetOnEvent($Button_Install_Folder_save, "_Button_Install_Folder_save")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_Software_save, "_Button_Install_Folder_VIVE_Software_save")
GUICtrlSetOnEvent($Button_Install_Folder_VIVE_HOME_save, "_Button_Install_Folder_VIVE_HOME_save")
GUICtrlSetOnEvent($Button_VIVE_HOME_save, "_Button_VIVE_HOME_save")
GUICtrlSetOnEvent($Button_VIVE_HOME_VRAPP_save, "_Button_VIVE_HOME_VRAPP_save")

GUICtrlSetOnEvent($Button_VIVE_HOME_delete, "_Button_VIVE_HOME_delete")
GUICtrlSetOnEvent($Button_VIVE_HOME_VRAPP_delete, "_Button_VIVE_HOME_VRAPP_delete")

GUICtrlSetOnEvent($Checkbox_Load_ShowPlayerOnline_on_StartUp, "_Checkbox_Load_ShowPlayerOnline_on_StartUp")

GUICtrlSetOnEvent($Button_Start_VIVEHOME, "_Button_Start_VIVEHOME")
GUICtrlSetOnEvent($Button_UpdateIcons, "_Button_UpdateIcons")
GUICtrlSetOnEvent($idRadio_ImagePath_1, "_idRadio_ImagePath_1")
GUICtrlSetOnEvent($idRadio_ImagePath_2, "_idRadio_ImagePath_2")
GUICtrlSetOnEvent($idRadio_ImagePath_3, "_idRadio_ImagePath_3")
GUICtrlSetOnEvent($idRadio_ImagePath_4, "_idRadio_ImagePath_4")

GUICtrlSetOnEvent($Button_AddIcons, "_Button_AddIcons")

GUICtrlSetOnEvent($Button_Save_GroupName, "_Button_Save_GroupName")
GUICtrlSetOnEvent($Checkbox_Group_IsVisible, "_Group_Settings_IsVisible")
GUICtrlSetOnEvent($Checkbox_Group_IsPhysicsEnablede, "_Group_Settings_IsPhysicsEnablede")
GUICtrlSetOnEvent($Updown_Group_Position_X, "_Group_Settings_Scale")
GUICtrlSetOnEvent($Updown_Group_Position_Y, "_Group_Settings_Scale")
GUICtrlSetOnEvent($Updown_Group_Position_Z, "_Group_Settings_Scale")
GUICtrlSetOnEvent($Checkbox_Group_glass, "_Group_Settings_glass")
GUICtrlSetOnEvent($Checkbox_Group_frame, "_Group_Settings_frame")
GUICtrlSetOnEvent($idRadio_GroupImage_1, "_idRadio_GroupImage_1")
GUICtrlSetOnEvent($idRadio_GroupImage_2, "_idRadio_GroupImage_2")
GUICtrlSetOnEvent($idRadio_GroupImage_3, "_idRadio_GroupImage_3")

Sleep(500)
GUICtrlSetData($Anzeige_Fortschrittbalken, 0)

_GUICtrlStatusBar_SetText($Statusbar, "Program was loaded and can now be used." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")

#endregion

_Tab()

GUISetState(@SW_SHOW)

_GUIListViewEx_MsgRegister()


#Region While 1

While 1
	Sleep(100)
    $nMsg = GUIGetMsg()

    Switch $nMsg

        Case $GUI_EVENT_CLOSE
            Exit

	EndSwitch

	$sRet = _GUIListViewEx_DragEvent()
	If $sRet <> "" Then



		If  $sRet = "1:1" Then

			$NR_ROWS_old = UBound($Content_Current_Shortcuts_ListView, $UBOUND_ROWS)
			$NEW_Content_Available_Shortcuts_ListView = _GUIListViewEx_ReturnArray($iLV_Current_Shortcuts_ListView)

			_Update_ListView_Available_Icons()
		EndIf

		If  $sRet = "1:2" Then
			MsgBox(0, "Don't do that!!!", "Don't do that!!!", "Don't Drag and Drop Items from the Icons ListView to the Group ListView.", 5)
			_Restart()
		EndIf

		If  $sRet = "1:4" Then

			_Droped_Icon()

			_GUICtrlListView_DeleteAllItems($IconsDrop2_ListView)

			For $LOOP_Content_10 = 1 To 1
				$GroupName = "" ; Drop here
				$Content_IconsDrop2_ListView[0] = $GroupName
				GUICtrlCreateListViewItem($GroupName, $IconsDrop2_ListView)
			Next

			_GUICtrlListView_DeleteAllItems($Current_Shortcuts_ListView)

			For $LOOP_Content_11 = 1 To $NR_Icons
				$WidgetName = $FileList_IconsFolder_1[$LOOP_Content_11]

				If $WidgetName <> "" Then
					$Content_Current_Shorcuts_ListView[$LOOP_Content_11 - 1] = $WidgetName
					;MsgBox(0, "", $Content_Current_Shorcuts_ListView[$LOOP_Content_2])
					$Current_Shortcuts_ListViewItem = GUICtrlCreateListViewItem($WidgetName, $Current_Shortcuts_ListView)
					GUICtrlSetOnEvent($Current_Shortcuts_ListViewItem, "_ClickOn_Current_Shortcuts_ListView")
				EndIf
			Next

		EndIf

		If  $sRet = "2:1" Then

			$NEW_Content_Available_Shortcuts_ListView = _GUIListViewEx_ReturnArray($iLV_Available_Shortcuts_ListView)
			$NEW_Content_Current_Shortcuts_ListView = _GUIListViewEx_ReturnArray($iLV_Current_Shortcuts_ListView)

			$NR_ROWS_old = UBound($Content_Current_Shortcuts_ListView, $UBOUND_ROWS)
			$NR_ROWS_NEW = UBound($NEW_Content_Current_Shortcuts_ListView, $UBOUND_ROWS)

			If $NR_ROWS_old = 0 Then
				$DragandDrop_Name = $NEW_Content_Current_Shortcuts_ListView[0]
			EndIf

			If $NR_ROWS_old > 0 Then
				If $NR_ROWS_NEW > $NR_ROWS_old Then
					For $LOOP_CheckContent_1 = 0 To $NR_ROWS_old
						If $LOOP_CheckContent_1 <> $NR_ROWS_old Then $Content_old = $Content_Current_Shortcuts_ListView[$LOOP_CheckContent_1]
						$Content_new_Check = $NEW_Content_Current_Shortcuts_ListView[$LOOP_CheckContent_1]
						If $LOOP_CheckContent_1 = $NR_ROWS_old Then $DragandDrop_Name = $NEW_Content_Current_Shortcuts_ListView[$NR_ROWS_NEW - 1]

						If $Content_new_Check <> $Content_old Then
							$DragandDrop_Name = $Content_new_Check
							ExitLoop
						EndIf
					Next
				EndIf
			EndIf

			_ListView_AvailableGames_Click()
			_Create_Shortcut_INI()
			_Write_Steam_Shortcuts()
			_Tab()

		EndIf

		If  $sRet = "3:2" Then

			$NEW_Content_Available_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Available_Groups_ListView)
			$NEW_Content_Current_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Current_Groups_ListView)

			$NR_ROWS_old = UBound($Content_Current_Groups_ListView, $UBOUND_ROWS)
			$NR_ROWS_NEW = UBound($NEW_Content_Current_Groups_ListView, $UBOUND_ROWS)


			If $NR_ROWS_old = 0 Then
				$DragandDrop_Name = $NEW_Content_Current_Groups_ListView[0]
			EndIf

			If $NR_ROWS_old > 0 Then
				If $NR_ROWS_NEW > $NR_ROWS_old Then
					For $LOOP_CheckContent_5 = 1 To $NR_ROWS_NEW - 1
						If $LOOP_CheckContent_5 = $NR_ROWS_NEW - 1 Then
							$Content_old = $Content_Current_Groups_ListView[$NR_ROWS_old - 1]
							$Content_new_Check = $NEW_Content_Current_Groups_ListView[$LOOP_CheckContent_5]
						Else
							$Content_old = $Content_Current_Groups_ListView[$LOOP_CheckContent_5 - 1]
							$Content_new_Check = $NEW_Content_Current_Groups_ListView[$LOOP_CheckContent_5 - 1]
						EndIf

						If $Content_new_Check <> $Content_old Then
							$DragandDrop_Name = $Content_new_Check
							ExitLoop
						EndIf

					Next

				EndIf
			EndIf

			_ListView_AvailableGroups_Click()
			_Create_Groups_INI()
			_Write_Steam_Groups()
			_Tab()

		EndIf

		If  $sRet = "3:3" Then

			$NR_ROWS_old = UBound($Content_Available_Groups_ListView, $UBOUND_ROWS)
			$NEW_Content_Available_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Available_Groups_ListView)

			_GUICtrlListView_DeleteAllItems($Available_Groups_ListView)

			For $LOOP_CheckContent_7 = 1 To $NR_ROWS_old
				$GroupName = IniRead($Config_INI, "Groups", "Group_" & $LOOP_CheckContent_7, "")
				$Content_Available_Groups_ListView[$LOOP_CheckContent_7 - 1] = $GroupName
				$Available_Groups_ListViewItem = GUICtrlCreateListViewItem($GroupName, $Available_Groups_ListView)
				GUICtrlSetOnEvent($Available_Groups_ListViewItem, "_ClickOn_Available_Groups_ListView")
			Next

			_Tab()
		EndIf

		If  $sRet = "3:4" Then

			_GUICtrlListView_DeleteAllItems($IconsDrop2_ListView)

			For $LOOP_Content_5 = 1 To 1
				$GroupName = ""
				$Content_IconsDrop2_ListView[0] = $GroupName
				GUICtrlCreateListViewItem($GroupName, $IconsDrop2_ListView)
			Next

		EndIf

		If  $sRet = "4:2" Then
			MsgBox(0, "Don't do that!!!", "Don't Drag and Drop Items from the Drop Field to the Group ListView.", 5)
			_Restart()
		EndIf

	EndIf

WEnd

#endregion



#Region Start Funktionen

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
    Local $tagNMHDR, $event, $hwndFrom, $code
    $tagNMHDR = DllStructCreate("int;int;int", $lParam)
    If @error Then Return
    $event = DllStructGetData($tagNMHDR, 3)
    If $wParam = $ListView Then
        If $event = $NM_CLICK Then
			_Update_TaskBar_PlayerOnline()
			_Change_Preview_Icon_VR_APP()
        EndIf

        If $event = $NM_DBLCLK Then
			_DB_Click_Listview()
        EndIf
    EndIf
    $tagNMHDR = 0
    $event = 0
    $lParam = 0
EndFunc

Func _ClickOn_Current_Available_Games_ListView()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameName = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_Selected_Row_Nr - 1, 0)

	_ClickOn_Available_Games_ListView_ItemChecked()
	_Change_Preview_Icon_Available_Games_ListView()
EndFunc

Func _ClickOn_Current_Shortcuts_ListView()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Current_Shortcuts_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$IconName = _GUICtrlListView_GetItemText($Current_Shortcuts_ListView, $ListView_Selected_Row_Nr - 1, 0)

	_Change_Preview_Icon_Available_Icons_ListView()
EndFunc

Func _ClickOn_Available_Groups_ListView()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Groups_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameName = _GUICtrlListView_GetItemText($Available_Groups_ListView, $ListView_Selected_Row_Nr - 1, 0)
	$DragandDrop_Name = $GameName

	_ListView_AvailableGroups_Click()
EndFunc

Func _Droped_Icon()
	$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

	$Icon_Folder = $Icons
	If $Check_idRadio_ImagePath = "" Then $Icon_Folder = $Icons
	If $Check_idRadio_ImagePath = "1" Then $Icon_Folder = $Icons_DIR_1
	If $Check_idRadio_ImagePath = "2" Then $Icon_Folder = $Icons_DIR_2
	If $Check_idRadio_ImagePath = "3" Then $Icon_Folder = $Icons_DIR_3
	If $Check_idRadio_ImagePath = "4" Then $Icon_Folder = $Icons_DIR_4

	$ListView_IconsDrop2_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_IconsDrop2_Selected_Row_Index = Int($ListView_IconsDrop2_Selected_Row_Index)
	$ListView_IconsDrop2_Selected_Row_Nr = $ListView_IconsDrop2_Selected_Row_Index + 1

	$GameName_IconsDrop2 = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_IconsDrop2_Selected_Row_Nr - 1, 0)

	$Drop_IconName = $IconName

	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[2] & " - " & $ListView_Item_Array[3]

	For $LOOP_Check_Name_1 = 1 To $ListView_Item_Array[0]
		$ListView_Check_Name_Array = _GUICtrlListView_GetItemTextArray($ListView, $LOOP_Check_Name_1)
		;MsgBox(0, "1", $GameName_IconsDrop2 & " : " & $ListView_Check_Name_Array[2])
		If $GameName_IconsDrop2 = $ListView_Check_Name_Array[2] Then
			$Drop_IconAppKey = $ListView_Check_Name_Array[3]
			;MsgBox(0, "2", $Drop_IconAppKey)
			ExitLoop
		EndIf
	Next

	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	Global $hQuery, $aRow, $iRows, $iCols, $aNames

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	If $iRows <> "" Then $iRows = $iRows + 1
	If $iRows = "" Then $iRows = 1


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)


	_SQLite_FetchNames($hQuery, $aNames)
	;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd

	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)


	For $NR = 1 To $iRows - 1
		_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
		If $iRows <> "" Then $iRows = $iRows + 1
		If $iRows = "" Then $iRows = 1

		_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)

		If $Drop_IconAppKey = $aRow[1] Then
			$Drop_Icon_Path = $Icon_Folder & $Drop_IconName
			$New_Icon_URL = $aRow[7]
			$New_Icon_Path = $Drop_Icon_Path

			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $New_Icon_URL & "','" & $aRow[8] & "','" & $New_Icon_Path & "','" & $aRow[10] & "');")

		Else
			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $aRow[9] & "','" & $aRow[10] & "');")
		EndIf
	Next

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	Sleep(100)

	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""

	_Read_from_VIVEHOME_DB()
EndFunc


Func _ClickOn_Available_Games_ListView_ItemChecked() ; Checkbox Favorites Check
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index ; + 1

	$CheckboxStatus = _GUICtrlListView_GetItemChecked($Available_Games_ListView, $ListView_Selected_Row_Nr)

	If $CheckboxStatus = "True" Then
		$NR_GameNames = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

		$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		$GameName = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_Selected_Row_Nr - 1, 0)

		For $LOOP_CheckImagePath_2 = 0 To $NR_GameNames
			$Get_DB_Name = _GUICtrlListView_GetItemText($listview, $LOOP_CheckImagePath_2, 1)
			If $GameName = $Get_DB_Name Then
				$CheckImagePath = _GUICtrlListView_GetItemText($listview, $LOOP_CheckImagePath_2, 3)
				$Check_Application_AppId = _GUICtrlListView_GetItemText($listview, $LOOP_CheckImagePath_2, 2)
				$Check_Application_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IsFavorite", "")
			EndIf
		Next

		$Check_GameName = $GameName
		$Check_ImagePath = $CheckImagePath

		If $Check_Application_IsFavorite = "false" or $Check_Application_IsFavorite = "" Then
			_Write_Favorite_2_Image()
			_Write_Favorite_2_DB_true()
			IniWrite($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IsFavorite", "true")
			$ApplicationNR = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "NR", "")
			IniWrite($ApplicationList_INI, "Application_" & $ApplicationNR, "IsFavorite", "true")
			_Read_from_VIVEHOME_DB()
		EndIf
	Else
		$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		$GameName = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_Selected_Row_Nr - 1, 0)

		For $NR_3 = 1 To $iRows - 1
			$Check_Application_Name = IniRead($ApplicationList_INI, "Application_" & $NR_3, "Name", "")
			If $Check_Application_Name = $GameName Then
				$Check_Application_AppId = IniRead($ApplicationList_INI, "Application_" & $NR_3, "AppId", "")
				$Check_Application_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IsFavorite", "")
			EndIf
		Next

		If $Check_Application_IsFavorite = "true" Then
			_Write_Favorite_2_DB_false()
			IniWrite($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IsFavorite", "false")
			$ApplicationNR = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "NR", "")
			IniWrite($ApplicationList_INI, "Application_" & $ApplicationNR, "IsFavorite", "false")
			FileDelete($Icons_DIR_2 & "Favorites\" & $Check_Application_AppId & ".jpg")
			_Read_from_VIVEHOME_DB()
		EndIf
	EndIf
EndFunc

Func _Write_Favorite_2_DB_true()
	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($Available_Games_ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[1] ; & " - " & $ListView_Item_Array[3]

    For $i = 1 To $ListView_Item_Array[0]
        $ListView_Selected_Row_Value &= StringFormat("Column[%2d] %s", $i, $ListView_Item_Array[$i]) & @CRLF
    Next


	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	Global $hQuery, $aRow, $iRows, $iCols, $aNames

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	If $iRows <> "" Then $iRows = $iRows + 1
	If $iRows = "" Then $iRows = 1


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)


	_SQLite_FetchNames($hQuery, $aNames)
	;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)


	For $NR = 1 To $iRows - 1
		_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
		If $iRows <> "" Then $iRows = $iRows + 1
		If $iRows = "" Then $iRows = 1

		_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)

		For $NR_2 = 1 To $iRows - 1
			$Check_Application_Name = IniRead($ApplicationList_INI, "Application_" & $NR_2, "Name", "")
			If $Check_Application_Name = $ListView_Item_Array[1] Then
				$Check_Application_AppId = IniRead($ApplicationList_INI, "Application_" & $NR_2, "AppId", "")
				$NewIcon_Path = $Icons_DIR_2 & "Favorites\" & $Check_Application_AppId & ".jpg"
				;MsgBox(0, "1", $NewIcon_Path)
				ExitLoop
			EndIf
		Next

		If $Check_Application_AppId = $aRow[1] Then
			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & "1" & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $NewIcon_Path & "','" & $aRow[10] & "');")

		Else
			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $aRow[9] & "','" & $aRow[10] & "');")
		EndIf
	Next

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	Sleep(100)

	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""
EndFunc

Func _Write_Favorite_2_DB_false()
	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($Available_Games_ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[1] ; & " - " & $ListView_Item_Array[3]

    For $i = 1 To $ListView_Item_Array[0]
        $ListView_Selected_Row_Value &= StringFormat("Column[%2d] %s", $i, $ListView_Item_Array[$i]) & @CRLF
    Next


	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	Global $hQuery, $aRow, $iRows, $iCols, $aNames

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	If $iRows <> "" Then $iRows = $iRows + 1
	If $iRows = "" Then $iRows = 1


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)


	_SQLite_FetchNames($hQuery, $aNames)
	;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)


	For $NR = 1 To $iRows - 1

		_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
		If $iRows <> "" Then $iRows = $iRows + 1
		If $iRows = "" Then $iRows = 1

		_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row

		$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

		For $NR_2 = 1 To $iRows - 1
			$Check_Application_Name = IniRead($ApplicationList_INI, "Application_" & $NR_2, "Name", "")
			If $Check_Application_Name = $ListView_Item_Array[1] Then
				$Check_Application_AppId = IniRead($ApplicationList_INI, "Application_" & $NR_2, "AppId", "")
				$NewIcon_Path = $Icons & $Check_Application_AppId & ".jpg"
				If $Check_idRadio_ImagePath = "1" Then
					$SteamGameID = StringReplace($Check_Application_AppId, 'steam.app.', '')
					$SteamGameID = StringReplace($SteamGameID, '.jpg', '')
					$NewIcon_Path = $Icons & $SteamGameID & "_header.jpg"
				EndIf
			EndIf
		Next

		If Not FileExists($NewIcon_Path) Then
			$SteamGameID = StringReplace($Check_Application_AppId, 'steam.app.', '')
			$SteamGameID = StringReplace($SteamGameID, '.jpg', '')
			$FileCopy_source = $Install_Folder_VIVE_Software & "Updater\App\Dashboard\win32\header_image\" & $SteamGameID & "_header.jpg"
			$FileCopy_target = $NewIcon_Path
			FileCopy($FileCopy_source, $FileCopy_target)
			If Not FileExists($NewIcon_Path) Then _Download_Icon_for_SteamGameID()
		EndIf


		If $Check_Application_AppId = $aRow[1] Then
			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & "0" & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $NewIcon_Path & "','" & $aRow[10] & "');")

		Else
			_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
											$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $aRow[9] & "','" & $aRow[10] & "');")
		EndIf
	Next


	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	Sleep(100)

	$ListView_Item_Array = 0
	$ListView_Selected_Row_Value = ""
EndFunc


Func _ListView_AvailableGames_Click()
	$GameName_DB = _GUICtrlListView_GetItemTextArray($listview)
	$NR_GameName_DB = $GameName_DB[0]
	$GameName = $DragandDrop_Name

	For $LOOP_CheckContent_2 = 0 To $NR_GameName_DB
		$Get_DB_Name = _GUICtrlListView_GetItemText($listview, $LOOP_CheckContent_2, 1)
		If $GameName = $Get_DB_Name Then
			$Appkey = _GUICtrlListView_GetItemText($listview, $LOOP_CheckContent_2, 2)
		EndIf
	Next

	$Available_GameName = $GameName
	$Available_Appkey = $Appkey

	IniWrite($config_ini, "Shortcut_Settings", "WidgetName", $Available_GameName)
	IniWrite($config_ini, "Shortcut_Settings", "WidgetInfoString_appkey", $Available_Appkey)

	GUICtrlSetData($Input_Shortcut_Name, $Available_GameName)
	GUICtrlSetData($Input_Shortcut_appkey, $Available_Appkey)
EndFunc

Func _Create_Shortcut_INI()
	$NR_Shorcuts = IniRead($Shortcuts_INI, "NR_Shorcuts", "NR", "")
	$NR_Shorcut_new = $NR_Shorcuts + 1

	$Read_SS_WidgetName = IniRead($config_ini, "Shortcut_Settings", "WidgetName", "")
	$Read_SS_WidgetUID = IniRead($config_ini, "Shortcut_Settings", "WidgetUID", "")
	$Read_SS_WidgetType = IniRead($config_ini, "Shortcut_Settings", "WidgetType", "")
	$Read_SS_IsVisible = IniRead($config_ini, "Shortcut_Settings", "IsVisible", "")
	$Read_SS_IsPhysicsEnabled = IniRead($config_ini, "Shortcut_Settings", "IsPhysicsEnabled", "")
	$Read_SS_Position_X = IniRead($config_ini, "Shortcut_Settings", "Position_X", "")
	$Read_SS_Position_Y = IniRead($config_ini, "Shortcut_Settings", "Position_Y", "")
	$Read_SS_Position_Z = IniRead($config_ini, "Shortcut_Settings", "Position_Z", "")
	$Read_SS_Rotation_X = IniRead($config_ini, "Shortcut_Settings", "Rotation_X", "")
	$Read_SS_Rotation_Y = IniRead($config_ini, "Shortcut_Settings", "Rotation_Y", "")
	$Read_SS_Rotation_Z = IniRead($config_ini, "Shortcut_Settings", "Rotation_Z", "")
	$Read_SS_Scale_X = IniRead($config_ini, "Shortcut_Settings", "Scale_X", "")
	$Read_SS_Scale_Y = IniRead($config_ini, "Shortcut_Settings", "Scale_Y", "")
	$Read_SS_Scale_Z = IniRead($config_ini, "Shortcut_Settings", "Scale_Z", "")
	$Read_SS_WidgetInfoString_TargetScaleX = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleX", "")
	$Read_SS_WidgetInfoString_TargetScaleY = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleY", "")
	$Read_SS_WidgetInfoString_TargetScaleZ = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleZ", "")
	$Read_SS_WidgetInfoString_appkey = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_appkey", "")

	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "NR", $NR_Shorcut_new)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetName", $Read_SS_WidgetName)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetUID", $Read_SS_WidgetUID)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetType", $Read_SS_WidgetType)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "IsVisible", $Read_SS_IsVisible)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "IsPhysicsEnabled", $Read_SS_IsPhysicsEnabled)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_X", $Read_SS_Position_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_Y", $Read_SS_Position_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_Z", $Read_SS_Position_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_X", $Read_SS_Rotation_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_Y", $Read_SS_Rotation_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_Z", $Read_SS_Rotation_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_X", $Read_SS_Scale_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_Y", $Read_SS_Scale_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_Z", $Read_SS_Scale_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleX", $Read_SS_WidgetInfoString_TargetScaleX)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleY", $Read_SS_WidgetInfoString_TargetScaleY)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleZ", $Read_SS_WidgetInfoString_TargetScaleZ)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_appkey", $Read_SS_WidgetInfoString_appkey)

	IniWrite($Shortcuts_INI, "NR_Shorcuts", "NR", $NR_Shorcut_new)
EndFunc


Func _ListView_AvailableGroups_Click()
	$Group_Name = $DragandDrop_Name
	$Content_Group_currentFilePath = $Icons & "Group_" & $Group_Name & ".jpg"

	IniWrite($config_ini, "Group_Settings", "WidgetName", $Group_Name)
	IniWrite($config_ini, "Group_Settings", "currentFilePath", $Content_Group_currentFilePath)

	_Group_Settings_IsVisible()
	_Group_Settings_IsPhysicsEnablede()
	_Group_Settings_Scale()
	_Group_Settings_glass()
	_Group_Settings_frame()

	GUICtrlSetData($Input_Group_Name, $Group_Name)
EndFunc

Func _Create_Groups_INI()
	$NR_Shorcuts = IniRead($Shortcuts_INI, "NR_Shorcuts", "NR", "")
	$NR_Shorcut_new = $NR_Shorcuts + 1

	$Read_SS_WidgetName = IniRead($config_ini, "Group_Settings", "WidgetName", "")
	$Read_SS_WidgetUID = IniRead($config_ini, "Group_Settings", "WidgetUID", "")
	$Read_SS_WidgetType = IniRead($config_ini, "Group_Settings", "WidgetType", "")
	$Read_SS_IsVisible = IniRead($config_ini, "Group_Settings", "IsVisible", "")
	$Read_SS_IsPhysicsEnabled = IniRead($config_ini, "Group_Settings", "IsPhysicsEnabled", "")
	$Read_SS_Position_X = IniRead($config_ini, "Group_Settings", "Position_X", "")
	$Read_SS_Position_Y = IniRead($config_ini, "Group_Settings", "Position_Y", "")
	$Read_SS_Position_Z = IniRead($config_ini, "Group_Settings", "Position_Z", "")
	$Read_SS_Rotation_X = IniRead($config_ini, "Group_Settings", "Rotation_X", "")
	$Read_SS_Rotation_Y = IniRead($config_ini, "Group_Settings", "Rotation_Y", "")
	$Read_SS_Rotation_Z = IniRead($config_ini, "Group_Settings", "Rotation_Z", "")
	$Read_SS_Scale_X = IniRead($config_ini, "Group_Settings", "Scale_X", "")
	$Read_SS_Scale_Y = IniRead($config_ini, "Group_Settings", "Scale_Y", "")
	$Read_SS_Scale_Z = IniRead($config_ini, "Group_Settings", "Scale_Z", "")
	$Read_SS_WidgetInfoString_TargetScaleX = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleX", "")
	$Read_SS_WidgetInfoString_TargetScaleY = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleY", "")
	$Read_SS_WidgetInfoString_TargetScaleZ = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleZ", "")
	$Read_SS_glass = IniRead($config_ini, "Group_Settings", "glass", "")
	$Read_SS_frame = IniRead($config_ini, "Group_Settings", "frame", "")
	$Read_SS_camera = IniRead($config_ini, "Group_Settings", "camera", "")
	$Read_SS_shuffle = IniRead($config_ini, "Group_Settings", "shuffle", "")
	$Read_SS_duration = IniRead($config_ini, "Group_Settings", "duration", "")
	$Read_SS_currentFilePath = IniRead($config_ini, "Group_Settings", "currentFilePath", "")
	$Read_SS_currentFolderPath = IniRead($config_ini, "Group_Settings", "currentFolderPath", "")
	$Read_SS_currentState = IniRead($config_ini, "Group_Settings", "currentState", "")
	$Read_SS_photoFrameTimingIndex = IniRead($config_ini, "Group_Settings", "photoFrameTimingIndex", "")

	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "NR", $NR_Shorcut_new)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetName", $Read_SS_WidgetName)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetUID", $Read_SS_WidgetUID)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetType", $Read_SS_WidgetType)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "IsVisible", $Read_SS_IsVisible)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "IsPhysicsEnabled", $Read_SS_IsPhysicsEnabled)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_X", $Read_SS_Position_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_Y", $Read_SS_Position_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Position_Z", $Read_SS_Position_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_X", $Read_SS_Rotation_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_Y", $Read_SS_Rotation_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Rotation_Z", $Read_SS_Rotation_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_X", $Read_SS_Scale_X)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_Y", $Read_SS_Scale_Y)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "Scale_Z", $Read_SS_Scale_Z)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleX", $Read_SS_WidgetInfoString_TargetScaleX)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleY", $Read_SS_WidgetInfoString_TargetScaleY)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "WidgetInfoString_TargetScaleZ", $Read_SS_WidgetInfoString_TargetScaleZ)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "glass", $Read_SS_glass)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "frame", $Read_SS_frame)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "camera", $Read_SS_camera)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "shuffle", $Read_SS_shuffle)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "duration", $Read_SS_duration)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "currentFilePath", $Read_SS_currentFilePath)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "currentFolderPath", $Read_SS_currentFolderPath)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "currentState", $Read_SS_currentState)
	IniWrite($Shortcuts_INI, "Shortcut_" & $NR_Shorcut_new, "photoFrameTimingIndex", $Read_SS_photoFrameTimingIndex)

	IniWrite($Shortcuts_INI, "NR_Shorcuts", "NR", $NR_Shorcut_new)
EndFunc


Func _Read_Steam_Shortcuts()
	Global $Content_json

	$Shortcut_NR = 1

	$Wert_Zeile_Shortcut_File = FileRead($VIVEHOME_Shortcut_File_source)
	$Wert_Zeile_Shortcut_Split = StringSplit($Wert_Zeile_Shortcut_File, '{')

	IniWrite($Shortcuts_INI, "NR_Shorcuts", "NR", "")
	FileWriteLine($Shortcuts_INI, " ")

	$NR_TO = $Wert_Zeile_Shortcut_Split[0]

	For $LOOP_NR_1 = 1 To $NR_TO
		If $LOOP_NR_1 > 3 Then
			$Shortcut_Split_1 = StringSplit($Wert_Zeile_Shortcut_Split[$LOOP_NR_1], ',')

			For $LOOP_NR_2 = 1 To $Shortcut_Split_1[0]
				$Shortcut_Split_2 = StringSplit($Shortcut_Split_1[$LOOP_NR_2], ':')

				For $LOOP_NR_3 = 1 To $Shortcut_Split_2[0]
					If $Shortcut_Split_2[0] > 1 Then
						If $Shortcut_Split_2[1] <> '"Position"' and $Shortcut_Split_2[1] <> '"Rotation"' and $Shortcut_Split_2[1] <> '"Scale"' and $Shortcut_Split_2[1] <> '"WidgetInfoString"' Then
							$Label = StringReplace($Shortcut_Split_2[1], '"', '')
							$Value = StringReplace($Shortcut_Split_2[2], '"', '')
							$Label_Stringlen = Stringlen($Label)
							IniWrite($Shortcuts_INI, "NR_Shorcuts", "NR", $Shortcut_NR)
							IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "NR", $Shortcut_NR)
							If $Label_Stringlen > 1 Then IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, $Label, $Value)
						EndIf

					EndIf

					If $Shortcut_Split_2[1] = '"Position"' Then
						$Value_1 = StringReplace($Shortcut_Split_2[2], '[', '')
						$Value_2 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
						$Value_3 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 2], ']', '')
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Position_X", $Value_1)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Position_Y", $Value_2)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Position_Z", $Value_3)
					EndIf

					If $Shortcut_Split_2[1] = '"Rotation"' Then
						$Value_1 = StringReplace($Shortcut_Split_2[2], '[', '')
						$Value_2 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
						$Value_3 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 2], ']', '')
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Rotation_X", $Value_1)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Rotation_Y", $Value_2)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Rotation_Z", $Value_3)
					EndIf

					If $Shortcut_Split_2[1] = '"Scale"' Then
						$Value_1 = StringReplace($Shortcut_Split_2[2], '[', '')
						$Value_2 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
						$Value_3 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 2], ']', '')
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Scale_X", $Value_1)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Scale_Y", $Value_2)
						IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "Scale_Z", $Value_3)
					EndIf

					If $Shortcut_Split_2[1] = '"WidgetInfoString"' Then

						If $Shortcut_Split_2[0] > 1 Then
							If $Shortcut_Split_2[2] = '["TargetScaleX"' Then
								If $Shortcut_Split_1[0] = 24 Then
									$Value_1 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
									$Value_2 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 3], '"', '')
									$Value_3 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 5], '"', '')
									If $Shortcut_Split_1[0] > 5 Then $Value_4 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 7], '"]}', '')
									If $Shortcut_Split_1[0] > 5 Then $Value_4 = StringReplace($Value_4, '"', '')
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleX", $Value_1)
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleY", $Value_2)
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleZ", $Value_3)
									If $Shortcut_Split_1[0] > 5 Then IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_appkey", $Value_4)
								EndIf

								If $Shortcut_Split_1[0] = 40 Then
									$Value_1 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
									$Value_2 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 3], '"', '')
									$Value_3 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 5], '"', '')
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleX", $Value_1)
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleY", $Value_2)
									IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_TargetScaleZ", $Value_3)

									For $LOOP_NR_4 = 22 To $Shortcut_Split_1[0] - 1 Step 2
										$Label = StringReplace($Shortcut_Split_1[$LOOP_NR_4], '"', '')
										$Value = StringReplace($Shortcut_Split_1[$LOOP_NR_4 + 1], '"', '')
										$Value = StringReplace($Value, ']', '')
										$Value = StringReplace($Value, '}', '')
										IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, $Label, $Value)
									Next

								EndIf
							EndIf
						EndIf

						If $Shortcut_Split_2[0] > 1 Then
							If $Shortcut_Split_2[2] = '["SceneNameList"' Then
								$Value_1 = StringReplace($Shortcut_Split_1[$LOOP_NR_2 + 1], '"', '')
								$Value_1 = StringReplace($Value_1, ']', '')
								$Value_1 = StringReplace($Value_1, '}', '')
								IniWrite($Shortcuts_INI, "Shortcut_" & $Shortcut_NR, "WidgetInfoString_SceneNameList", $Value_1)
							EndIf
						EndIf
					EndIf
				Next

				$Content_json = $Content_json & $Wert_Zeile_Shortcut_Split[$LOOP_NR_1]
			Next

		$Shortcut_NR = $Shortcut_NR + 1
		FileWriteLine($Shortcuts_INI, " ")

		EndIf
	Next
EndFunc

Func _Write_Steam_Shortcuts()
	$Wert_Zeile_Shortcut_File = FileRead($VIVEHOME_Shortcut_File_source)
	$Content_Shortcut_File = StringTrimRight($Wert_Zeile_Shortcut_File, 4)

	$Content_Shortcut_File_ADD_1 = IniRead($config_ini, "Shortcut_Settings", "WidgetName", "")
	$Content_Shortcut_File_ADD_2 = IniRead($config_ini, "Shortcut_Settings", "WidgetUID", "")
	$Content_Shortcut_File_ADD_3 = IniRead($config_ini, "Shortcut_Settings", "WidgetType", "")
	$Content_Shortcut_File_ADD_4 = IniRead($config_ini, "Shortcut_Settings", "IsVisible", "")
	$Content_Shortcut_File_ADD_5 = IniRead($config_ini, "Shortcut_Settings", "IsPhysicsEnabled", "")
	$Content_Shortcut_File_ADD_6 = IniRead($config_ini, "Shortcut_Settings", "Position_X", "")
	$Content_Shortcut_File_ADD_7 = IniRead($config_ini, "Shortcut_Settings", "Position_Y", "")
	$Content_Shortcut_File_ADD_8 = IniRead($config_ini, "Shortcut_Settings", "Position_Z", "")
	$Content_Shortcut_File_ADD_9_1 = IniRead($config_ini, "Shortcut_Settings", "Rotation_1", "")
	$Content_Shortcut_File_ADD_9 = IniRead($config_ini, "Shortcut_Settings", "Rotation_X", "")
	$Content_Shortcut_File_ADD_10 = IniRead($config_ini, "Shortcut_Settings", "Rotation_Y", "")
	$Content_Shortcut_File_ADD_11 = IniRead($config_ini, "Shortcut_Settings", "Rotation_Z", "")
	$Content_Shortcut_File_ADD_12 = IniRead($config_ini, "Shortcut_Settings", "Scale_X", "")
	$Content_Shortcut_File_ADD_13 = IniRead($config_ini, "Shortcut_Settings", "Scale_Y", "")
	$Content_Shortcut_File_ADD_14 = IniRead($config_ini, "Shortcut_Settings", "Scale_Z", "")
	$Content_Shortcut_File_ADD_15 = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleX", "")
	$Content_Shortcut_File_ADD_16 = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleY", "")
	$Content_Shortcut_File_ADD_17 = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_TargetScaleZ", "")
	$Content_Shortcut_File_ADD_18 = IniRead($config_ini, "Shortcut_Settings", "WidgetInfoString_appkey", "")

	$Content_Shortcut_File_ADD = '"WidgetName":"' & $Content_Shortcut_File_ADD_1 & '","WidgetUID":"' & $Content_Shortcut_File_ADD_2 & _
									'","WidgetType":' & $Content_Shortcut_File_ADD_3 & ',"IsVisible":' & $Content_Shortcut_File_ADD_4 & _
									',"IsPhysicsEnabled":' & $Content_Shortcut_File_ADD_5 & ',"Position":[' & $Content_Shortcut_File_ADD_6 & _
									',' & $Content_Shortcut_File_ADD_7 & ',' & $Content_Shortcut_File_ADD_8 & '],"Rotation":[' & $Content_Shortcut_File_ADD_9_1 & ',' & $Content_Shortcut_File_ADD_9 & _
									',' & $Content_Shortcut_File_ADD_10 & ',' & $Content_Shortcut_File_ADD_11 & '],"Scale":[' & $Content_Shortcut_File_ADD_12 & _
									',' & $Content_Shortcut_File_ADD_13 & ',' & $Content_Shortcut_File_ADD_14 & '],"WidgetInfoString":["TargetScaleX","' & $Content_Shortcut_File_ADD_15 & _
									'","TargetScaleY","' & $Content_Shortcut_File_ADD_16 & '","TargetScaleZ","' & $Content_Shortcut_File_ADD_17 & '","appkey","' & $Content_Shortcut_File_ADD_18 & '"]},'


	$Content_Shortcut_File_NEW = $Content_Shortcut_File_1 & $Content_Shortcut_File_ADD & $Content_Shortcut_File_2

	FileCopy($VIVEHOME_Shortcut_File_source, $VIVEHOME_Shortcut_File_source_bak, $FC_OVERWRITE + $FC_CREATEPATH)
	FileDelete($VIVEHOME_Shortcut_File_source)
	FileWrite($VIVEHOME_Shortcut_File_source, $Content_Shortcut_File_NEW)
EndFunc

Func _Write_Steam_Groups()
	$Wert_Zeile_Shortcut_File = FileRead($VIVEHOME_Shortcut_File_source)
	$Content_Shortcut_File = StringTrimRight($Wert_Zeile_Shortcut_File, 4)

	$Content_Shortcut_File_ADD_1 = IniRead($config_ini, "Group_Settings", "WidgetName", "")
	$Content_Shortcut_File_ADD_2 = IniRead($config_ini, "Group_Settings", "WidgetUID", "")
	$Content_Shortcut_File_ADD_3 = IniRead($config_ini, "Group_Settings", "WidgetType", "")
	$Content_Shortcut_File_ADD_4 = IniRead($config_ini, "Group_Settings", "IsVisible", "")
	$Content_Shortcut_File_ADD_5 = IniRead($config_ini, "Group_Settings", "IsPhysicsEnabled", "")
	$Content_Shortcut_File_ADD_6 = IniRead($config_ini, "Group_Settings", "Position_X", "")
	$Content_Shortcut_File_ADD_7 = IniRead($config_ini, "Group_Settings", "Position_Y", "")
	$Content_Shortcut_File_ADD_8 = IniRead($config_ini, "Group_Settings", "Position_Z", "")
	$Content_Shortcut_File_ADD_9_1 = IniRead($config_ini, "Group_Settings", "Rotation_1", "")
	$Content_Shortcut_File_ADD_9 = IniRead($config_ini, "Group_Settings", "Rotation_X", "")
	$Content_Shortcut_File_ADD_10 = IniRead($config_ini, "Group_Settings", "Rotation_Y", "")
	$Content_Shortcut_File_ADD_11 = IniRead($config_ini, "Group_Settings", "Rotation_Z", "")
	$Content_Shortcut_File_ADD_12 = IniRead($config_ini, "Group_Settings", "Scale_X", "")
	$Content_Shortcut_File_ADD_13 = IniRead($config_ini, "Group_Settings", "Scale_Y", "")
	$Content_Shortcut_File_ADD_14 = IniRead($config_ini, "Group_Settings", "Scale_Z", "")
	$Content_Shortcut_File_ADD_15 = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleX", "")
	$Content_Shortcut_File_ADD_16 = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleY", "")
	$Content_Shortcut_File_ADD_17 = IniRead($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleZ", "")
	$Content_Shortcut_File_ADD_18 = IniRead($config_ini, "Group_Settings", "glass", "")
	$Content_Shortcut_File_ADD_19 = IniRead($config_ini, "Group_Settings", "frame", "")
	$Content_Shortcut_File_ADD_20 = IniRead($config_ini, "Group_Settings", "camera", "")
	$Content_Shortcut_File_ADD_21 = IniRead($config_ini, "Group_Settings", "shuffle", "")
	$Content_Shortcut_File_ADD_22 = IniRead($config_ini, "Group_Settings", "duration", "")
	$Content_Shortcut_File_ADD_23 = IniRead($config_ini, "Group_Settings", "currentFilePath", "")
		If $Content_Shortcut_File_ADD_23 <> "" Then $Content_Shortcut_File_ADD_23 = StringReplace($Content_Shortcut_File_ADD_23, '\', '\\')
	$Content_Shortcut_File_ADD_24 = IniRead($config_ini, "Group_Settings", "currentFolderPath", "")
	$Content_Shortcut_File_ADD_25 = IniRead($config_ini, "Group_Settings", "currentState", "")
	$Content_Shortcut_File_ADD_26 = IniRead($config_ini, "Group_Settings", "photoFrameTimingIndex", "")


	$Content_Shortcut_File_ADD = '{"WidgetName":"' & $Content_Shortcut_File_ADD_1 & '","WidgetUID":"' & $Content_Shortcut_File_ADD_2 & _
									'","WidgetType":' & $Content_Shortcut_File_ADD_3 & ',"IsVisible":' & $Content_Shortcut_File_ADD_4 & _
									',"IsPhysicsEnabled":' & $Content_Shortcut_File_ADD_5 & ',"Position":[' & $Content_Shortcut_File_ADD_6 & _
									',' & $Content_Shortcut_File_ADD_7 & ',' & $Content_Shortcut_File_ADD_8 & '],"Rotation":[' & $Content_Shortcut_File_ADD_9_1 & ',' & $Content_Shortcut_File_ADD_9 & _
									',' & $Content_Shortcut_File_ADD_10 & ',' & $Content_Shortcut_File_ADD_11 & '],"Scale":[' & $Content_Shortcut_File_ADD_12 & _
									',' & $Content_Shortcut_File_ADD_13 & ',' & $Content_Shortcut_File_ADD_14 & '],"WidgetInfoString":["TargetScaleX","' & $Content_Shortcut_File_ADD_15 & _
									'","TargetScaleY","' & $Content_Shortcut_File_ADD_16 & '","TargetScaleZ","' & $Content_Shortcut_File_ADD_17 & '","glass","' & $Content_Shortcut_File_ADD_18 & _
									'","frame","' & $Content_Shortcut_File_ADD_19 & '","camera","' & $Content_Shortcut_File_ADD_20 & '","shuffle","' & $Content_Shortcut_File_ADD_21 & _
									'","duration","' & $Content_Shortcut_File_ADD_22 & '","currentFilePath","' & $Content_Shortcut_File_ADD_23 & _
									'","currentFolderPath","' & $Content_Shortcut_File_ADD_24 & '","currentState","' & $Content_Shortcut_File_ADD_25 & _
									'","photoFrameTimingIndex","' & $Content_Shortcut_File_ADD_26 & '"]}]}]}'


	$Content_Shortcut_File_NEW = $Content_Shortcut_File & "," & $Content_Shortcut_File_ADD

	FileCopy($VIVEHOME_Shortcut_File_source, $VIVEHOME_Shortcut_File_source_bak, $FC_OVERWRITE + $FC_CREATEPATH)
	FileDelete($VIVEHOME_Shortcut_File_source)
	FileWrite($VIVEHOME_Shortcut_File_source, $Content_Shortcut_File_NEW)

	_Write_GroupTEXT_2_Image()
EndFunc


Func _Write_GroupTEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "GroupImage.jpg", $DragandDrop_Name, "Arial", 32, -1, 148, 0, 0,  0xFFFFFFFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", $Icons & "Group_" & $DragandDrop_Name & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		$Content_Group_currentFilePath = $Icons & "Group_" & $DragandDrop_Name & ".jpg"
		IniWrite($config_ini, "Group_Settings", "currentFilePath", $Content_Group_currentFilePath)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	Else
		If FileExists($Install_DIR & "WTOB.png") Then
			FileCopy($Install_DIR & "WTOB.png", $Icons & "Group_" & $DragandDrop_Name & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
			$Content_Group_currentFilePath = $Icons & "Group_" & $DragandDrop_Name & ".jpg"
			IniWrite($config_ini, "Group_Settings", "currentFilePath", $Content_Group_currentFilePath)
			FileDelete($Install_DIR & "WTOB.png")
		EndIf
	EndIf

EndFunc

Func _Write_Favorite_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 60, $FAVImageSizeY = 60
	Global $hImage1, $hImage2

	$hImage1_Path = $Check_ImagePath
	If $hImage1_Path = "" Then $hImage1_Path = $gfx & "Image1.jpg"
	$hImage2_Path = $gfx & "Image2.jpg"

	$Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	$Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	$Check_Filename_2 = StringRight($Check_Filename_1, 11)
	$Check_Filename = $Check_Filename_1

	If $Check_Filename_2 = "_header.jpg" Then
		$Check_Filename_3 = StringReplace($Check_Filename_1, '_header.jpg', '')
		$Check_Filename = "steam.app." & $Check_Filename_3 & ".jpg"
	EndIf


	If Not FileExists($hImage1_Path) Then
		$hImage1_Path = $Check_Filename_3 & "_header.jpg"
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
	;End of graphics

	GUIRegisterMsg(0xF, "MY_PAINT"); Register PAINT-Event 0x000F = $WM_PAINT (WindowsConstants.au3)
	GUIRegisterMsg(0x85, "MY_PAINT") ; $WM_NCPAINT = 0x0085 (WindowsConstants.au3)Restore after Minimize.

	;Save composite image
	Local $sNewName = $Icons_DIR_2 & "Favorites\" & $Check_Filename
	Global $NewIcon_Path = $sNewName

	_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path) ; $hBMPBuff the bitmap

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_Favorite_2_Image()
EndFunc

Func MY_PAINT($hWnd, $msg, $wParam, $lParam)
    Return $GUI_RUNDEFMSG
EndFunc

Func _Quit_Favorite_2_Image()
    _GDIPlus_PenDispose($hPen)
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _GDIPlus_GraphicsDispose($hGraphic)
    _WinAPI_DeleteObject($hBMPBuff)
    _GDIPlus_Shutdown()
EndFunc


Func _Update_ListView_Available_Icons()
	$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

	$FileList_IconsFolder_2 = _FileListToArray($Icons, "*.jpg")

	If $Check_idRadio_ImagePath = "1" Then
		$FileList_IconsFolder_2 = _FileListToArray($Icons_DIR_1, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "2" Then
		$FileList_IconsFolder_2 = _FileListToArray($Icons_DIR_2, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "3" Then
		$FileList_IconsFolder_2 = _FileListToArray($Icons_DIR_3, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "4" Then
		$FileList_IconsFolder_2 = _FileListToArray($Icons_DIR_4, "*.jpg")
	EndIf

	Global $Content_Current_Shorcuts_ListView[$FileList_IconsFolder_2[0]]

	_GUICtrlListView_BeginUpdate($Current_Shortcuts_ListView)
	_GUICtrlListView_DeleteAllItems($Current_Shortcuts_ListView)

	For $LOOP_CheckContent_8 = 1 To $FileList_IconsFolder_2[0] - 1
		$WidgetName = $FileList_IconsFolder_2[$LOOP_CheckContent_8]

		If $WidgetName <> "" Then
			$Content_Current_Shorcuts_ListView[$LOOP_CheckContent_8 - 1] = $WidgetName
			$Current_Shortcuts_ListViewItem = GUICtrlCreateListViewItem($WidgetName, $Current_Shortcuts_ListView)
			GUICtrlSetOnEvent($Current_Shortcuts_ListViewItem, "_ClickOn_Current_Shortcuts_ListView")
		EndIf
	Next

	_Tab()

	_GUICtrlListView_EndUpdate($Current_Shortcuts_ListView)
EndFunc


Func _Checkbox_ADD_PlayerOnline()
	$Status_Checkbox = GUICtrlRead($Checkbox_ShowPlayerOnline)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "ShowPlayerOnline", "true")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "ShowPlayerOnline", "false")
	EndIf
EndFunc

Func _UpDown_PlayerOnline()
	$Value_UpDown_PlayerOnline = GUICtrlRead($Input_ShowPlayerOnline)
	IniWrite($config_ini, "Settings", "Value_ShowPlayerOnline", $Value_UpDown_PlayerOnline)
EndFunc

Func _Update_TaskBar_PlayerOnline()
	$Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = IniRead($config_ini,"Settings", "Load_ShowPlayerOnline_on_StartUp", "")

	If $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = "true" Then
		$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		$ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
		$ListView_Item_Name = $ListView_Item_Array[2]
		$ListView_Item_SteamID = $ListView_Item_Array[3]

		$PO_right_now = IniRead($ApplicationList_INI, "Application_" & $ListView_Item_SteamID, "right_now", "")
		$PO_24h_peak = IniRead($ApplicationList_INI, "Application_" & $ListView_Item_SteamID, "24h_peak", "")
		$PO_all_time = IniRead($ApplicationList_INI, "Application_" & $ListView_Item_SteamID, "all_time_peak", "")

		_GUICtrlStatusBar_SetText($Statusbar, "Players Online: "  & @TAB & "Right Now : " & $PO_right_now & "  /  " & "[24h Peak : " & $PO_24h_peak & "  /  " &  "All Time Peak : " & $PO_all_time & "]" & @TAB & "'VIVEHIM - Version " & $Version & "'")
	Else
		$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		$ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
		$ListView_Item_Name = $ListView_Item_Array[2]
		$ListView_Item_SteamID = $ListView_Item_Array[3]
		_GUICtrlStatusBar_SetText($Statusbar, $ListView_Item_Name  & " - " & $ListView_Item_SteamID & @TAB & "" & @TAB & "'VIVEHIM - Version " & $Version & "'")
	EndIf
EndFunc


Func _Tab()
	$TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = "0" Then
		GUIRegisterMsg($WM_notify, "_ClickOnListView")
		_GUICtrlStatusBar_SetText($Statusbar, $Name_TAB_1 & @TAB & "" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf

	If $TAB_Name = "1" Then
		_GUICtrlStatusBar_SetText($Statusbar, $Name_TAB_2 & @TAB & "" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf


	If $TAB_Name = "2" Then
		_GUIListViewEx_MsgRegister()
		$Content_Current_Shortcuts_ListView = _GUIListViewEx_ReturnArray($iLV_Current_Shortcuts_ListView)
		$Content_Current_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Current_Groups_ListView)
		$Content_Available_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Available_Groups_ListView)
		$DragandDrop_Name = ""
		$Available_GameName = ""
		$Available_Appkey = ""
		$Content_old = ""
		$Content_new_Check = ""
		_GUICtrlStatusBar_SetText($Statusbar, $Name_TAB_3 & @TAB & "" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf

	If $TAB_Name = "3" Then
		_GUICtrlStatusBar_SetText($Statusbar, $Name_TAB_4 & @TAB & "" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf
EndFunc

Func _DB_Click_Listview()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)

    For $i = 1 To $ListView_Item_Array[0]
        $ListView_Selected_Row_Value &= StringFormat("Column[%2d] %s", $i, $ListView_Item_Array[$i]) & @CRLF
    Next

	Sleep(200)
	_Button_1_3()
	Sleep(200)
EndFunc

Func _Change_Preview_Icon_VR_APP()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[2] & " - " & $ListView_Item_Array[3]

	$CheckImagePath = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 3)

	If $CheckImagePath = "" or $CheckImagePath = $Icons_DIR & "" & ".jpg" or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc

Func _Change_Preview_Icon_Desktop_APP()
	Local $ID = GUICtrlRead($idTreeView)
	$ID = $ID + 1
    Local $Handle = _GUICtrlTreeView_GetItemHandle($idTreeView, $ID)
    Local $Text = _GUICtrlTreeView_GetText($idTreeView, $Handle)

	$TreeView_Steam_app_ID = StringReplace($Text, 'AppKey:  ' , '')

	$New_Icon_steam_app_ID = $TreeView_Steam_app_ID
	$New_Icon_steam_app_ID_Path = $Icons_DIR & $New_Icon_steam_app_ID & ".jpg"

	If $New_Icon_steam_app_ID_Path = "" or $New_Icon_steam_app_ID_Path = $Icons_DIR & "" & ".jpg" or Not FileExists($New_Icon_steam_app_ID_Path) Then $New_Icon_steam_app_ID_Path = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $New_Icon_steam_app_ID_Path)
EndFunc

Func _Change_Preview_Icon_Available_Games_ListView()
	$NR_GameNames = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameName = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_Selected_Row_Nr - 1, 0)

	For $LOOP_CheckImagePath_1 = 0 To $NR_GameNames
		$Get_DB_Name = _GUICtrlListView_GetItemText($listview, $LOOP_CheckImagePath_1, 1)
		If $GameName = $Get_DB_Name Then
			$CheckImagePath = _GUICtrlListView_GetItemText($listview, $LOOP_CheckImagePath_1, 3)
		EndIf
	Next

	$New_Icon_steam_app_ID_Path = $CheckImagePath

	If $New_Icon_steam_app_ID_Path = "" or $New_Icon_steam_app_ID_Path = $Icons_DIR & "" & ".jpg" or Not FileExists($New_Icon_steam_app_ID_Path) Then $New_Icon_steam_app_ID_Path = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $New_Icon_steam_app_ID_Path)
	GUICtrlSetImage($Available_Icon_Preview_Image_1, $New_Icon_steam_app_ID_Path)
EndFunc

Func _Change_Preview_Icon_Available_Icons_ListView()
	$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

	$FileList_IconsFolder_3 = _FileListToArray($Icons, "*.jpg")

	If $Check_idRadio_ImagePath = "1" Then
		$FileList_IconsFolder_3 = _FileListToArray($Icons_DIR_1, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "2" Then
		$FileList_IconsFolder_3 = _FileListToArray($Icons_DIR_2, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "3" Then
		$FileList_IconsFolder_3 = _FileListToArray($Icons_DIR_3, "*.jpg")
	EndIf

	If $Check_idRadio_ImagePath = "4" Then
		$FileList_IconsFolder_3 = _FileListToArray($Icons_DIR_4, "*.jpg")
	EndIf

	Global $Content_Current_Shorcuts_ListView[$FileList_IconsFolder_3[0]]

	$NR_Icons = $FileList_IconsFolder_3[0]

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Current_Shortcuts_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$IconName = _GUICtrlListView_GetItemText($Current_Shortcuts_ListView, $ListView_Selected_Row_Nr - 1, 0)
	$CheckImagePath = $Icons & $IconName

	If $Check_idRadio_ImagePath = "1" Then
		$CheckImagePath = $Icons_DIR_1 & $IconName
	EndIf

	If $Check_idRadio_ImagePath = "2" Then
		$CheckImagePath = $Icons_DIR_2 & $IconName
	EndIf

	If $Check_idRadio_ImagePath = "3" Then
		$CheckImagePath = $Icons_DIR_3 & $IconName
	EndIf

	If $Check_idRadio_ImagePath = "4" Then
		$CheckImagePath = $Icons_DIR_4 & $IconName
	EndIf

	$New_Icon_steam_app_ID_Path = $CheckImagePath

	If $New_Icon_steam_app_ID_Path = "" or $New_Icon_steam_app_ID_Path = $Icons_DIR or Not FileExists($New_Icon_steam_app_ID_Path) Then $New_Icon_steam_app_ID_Path = $gfx & "Icon_Preview_2.jpg"
	GUICtrlSetImage($Available_Icon_Preview_Image_2, $New_Icon_steam_app_ID_Path)
EndFunc


Func _Button_Start_VIVEHOME()
	$Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
	$Check_ShowPlayerOnline = IniRead($Config_INI, "Settings", "ShowPlayerOnline", "")

	If $Check_ShowPlayerOnline = "true" Then
		If FileExists($System_DIR & "AddPO2Icons.exe") Then
			ShellExecute($System_DIR & "AddPO2Icons.exe")
		Else
			ShellExecute($System_DIR & "AddPO2Icons.au3", "", $System_DIR)
		EndIf
	EndIf

	Sleep(500)

	If FileExists($Install_Folder_VIVE_HOME & "ViveHome.exe") Then
		ShellExecute($Install_Folder_VIVE_HOME & "ViveHome.exe", "", $Install_Folder_VIVE_HOME)
	EndIf

	Sleep(500)

	Exit
EndFunc


Func _Button_1_3()
	$ListView_Item_Array = 0

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[2] & " - " & $ListView_Item_Array[3]


	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	If $iRows = "" Then $iRows = 1

	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)

	_SQLite_FetchNames($hQuery, $aNames)
	ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)


		_GUICtrlListView_BeginUpdate($ListView)
		_GUICtrlListView_DeleteAllItems($ListView)

		For $NR = 1 To $iRows ;- 1

			_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row

			$Application_App_Name = IniRead($ApplicationList_INI, "Application_" & $aRow[1], "Name", "")
			If $Application_App_Name = "" Then
				$Application_App_Name_search = StringReplace($aRow[1], 'vive.htc.', '')
				$Application_App_Name = IniRead($ApplicationList_INI, "Application_" & $Application_App_Name_search, "Name", "")
				If $Application_App_Name = "" Then $Application_App_Name = $aRow[1]
			EndIf

			If $ListView_Item_Array[3] = $aRow[1] Then

				$FileOpen_New_Icon_Path = FileOpenDialog("Choose File:", $Icons_DIR, "Images (*.jpg;*.png)", $FD_FILEMUSTEXIST + $FD_MULTISELECT)
				$New_Icon_URL = $aRow[7]
				$New_Icon_Path = $FileOpen_New_Icon_Path

				_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
												$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $New_Icon_URL & "','" & $aRow[8] & "','" & $New_Icon_Path & "','" & $aRow[10] & "');")

				$Ebene_temp = $NR - 1

				$Produkt_Nr_anzeige = $aRow[0]
				_GUICtrlListView_AddItem($listview, $Produkt_Nr_anzeige, "")

				$Anzeige_Spalte = $Application_App_Name
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 1)

				$Anzeige_Spalte = $aRow[1]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 2)

				$Anzeige_Spalte = $New_Icon_Path
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 3)

				$Anzeige_Spalte = $aRow[2]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 4)

				$Anzeige_Spalte = $aRow[3]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 5)

				$Anzeige_Spalte = $aRow[4]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 6)

				$Anzeige_Spalte = $aRow[5]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 7)
				If $Anzeige_Spalte = "1" Then
					IniWrite($ApplicationList_INI, "Application_" & $aRow[1], "IsFavorite", "true")
					_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 1)
				Else
					_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 0)
				EndIf

				$Anzeige_Spalte = $aRow[6]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 8)

				$Anzeige_Spalte = $New_Icon_URL
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 9)

				$Anzeige_Spalte = $aRow[8]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 10)

				$Anzeige_Spalte = $aRow[10]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 11)

			Else
				_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
												$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $aRow[9] & "','" & $aRow[10] & "');")

				$Ebene_temp = $NR - 1

				$Produkt_Nr_anzeige = $aRow[0]
				_GUICtrlListView_AddItem($listview, $Produkt_Nr_anzeige, "")

				$Anzeige_Spalte = $Application_App_Name
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 1)

				$Anzeige_Spalte = $aRow[1]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 2)

				$Anzeige_Spalte = $aRow[9]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 3)

				$Anzeige_Spalte = $aRow[2]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 4)

				$Anzeige_Spalte = $aRow[3]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 5)

				$Anzeige_Spalte = $aRow[4]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 6)

				$Anzeige_Spalte = $aRow[5]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 7)
				If $Anzeige_Spalte = "1" Then
					IniWrite($ApplicationList_INI, "Application_" & $aRow[1], "IsFavorite", "true")
					_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 1)
				Else
					_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 0)
				EndIf

				$Anzeige_Spalte = $aRow[6]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 8)

				$Anzeige_Spalte = $aRow[7]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 9)

				$Anzeige_Spalte = $aRow[8]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 10)

				$Anzeige_Spalte = $aRow[10]
				_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 11)

			EndIf

		Next

		_GUICtrlListView_EndUpdate($ListView)

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	Sleep(100)

	$ListView_Item_Array = 0
	$aRow = 0

	;_Read_from_VIVEHOME_DB()
	_Restart()
	;_Tab()
EndFunc


Func _Button_Save_GroupName()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Groups_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
	$Selected_Group_NR = $ListView_Selected_Row_Nr

	$GameName_ListView = _GUICtrlListView_GetItemText($Available_Groups_ListView, $ListView_Selected_Row_Nr - 1, 0)
	$GameName_Input = GUICtrlRead($Input_Group_Name)

	IniWrite($Config_INI, "Groups", "Group_" & $Selected_Group_NR, $GameName_Input)

	$NR_ROWS_old = UBound($Content_Available_Groups_ListView, $UBOUND_ROWS)
	$NEW_Content_Available_Groups_ListView = _GUIListViewEx_ReturnArray($iLV_Available_Groups_ListView)

	_GUICtrlListView_DeleteAllItems($Available_Groups_ListView)

	For $LOOP_CheckContent_9 = 1 To $NR_ROWS_old
		$GroupName = IniRead($Config_INI, "Groups", "Group_" & $LOOP_CheckContent_9, "")
		$Content_Available_Groups_ListView[$LOOP_CheckContent_9 - 1] = $GroupName
		$Available_Groups_ListViewItem = GUICtrlCreateListViewItem($GroupName, $Available_Groups_ListView)
		GUICtrlSetOnEvent($Available_Groups_ListViewItem, "_ClickOn_Available_Groups_ListView")
	Next

	_Tab()
EndFunc

Func _Group_Settings_IsVisible()
	$Value_Checkbox_Group_IsVisible = GUICtrlRead($Checkbox_Group_IsVisible)
		If $Value_Checkbox_Group_IsVisible = "1" Then $Value_Checkbox_Group_IsVisible = "true"
		If $Value_Checkbox_Group_IsVisible = "4" Then $Value_Checkbox_Group_IsVisible = "false"
	IniWrite($config_ini, "Group_Settings", "IsVisible", $Value_Checkbox_Group_IsVisible)
EndFunc

Func _Group_Settings_IsPhysicsEnablede()
	$Value_Checkbox_Group_IsPhysicsEnablede = GUICtrlRead($Checkbox_Group_IsPhysicsEnablede)
		If $Value_Checkbox_Group_IsPhysicsEnablede = "1" Then $Value_Checkbox_Group_IsPhysicsEnablede = "true"
		If $Value_Checkbox_Group_IsPhysicsEnablede = "4" Then $Value_Checkbox_Group_IsPhysicsEnablede = "false"
	IniWrite($config_ini, "Group_Settings", "IsPhysicsEnabled", $Value_Checkbox_Group_IsPhysicsEnablede)
EndFunc

Func _Group_Settings_Scale()
	$Value_Scale_X = GUICtrlRead($Input_UpDown_Group_Position_X)
	$Value_Scale_Y = GUICtrlRead($Input_UpDown_Group_Position_Y)
	$Value_Scale_Z = GUICtrlRead($Input_UpDown_Group_Position_Z)
	IniWrite($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleX", $Value_Scale_X)
	IniWrite($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleY", $Value_Scale_Y)
	IniWrite($config_ini, "Group_Settings", "WidgetInfoString_TargetScaleZ", $Value_Scale_Z)
EndFunc

Func _Group_Settings_glass()
	$Value_Checkbox_Group_glass = GUICtrlRead($Checkbox_Group_glass)
		If $Value_Checkbox_Group_glass = "1" Then $Value_Checkbox_Group_glass = "true"
		If $Value_Checkbox_Group_glass = "4" Then $Value_Checkbox_Group_glass = "False"
	IniWrite($config_ini, "Group_Settings", "glass", $Value_Checkbox_Group_glass)
EndFunc

Func _Group_Settings_frame()
	$Value_Checkbox_Group_frame = GUICtrlRead($Checkbox_Group_frame)
		If $Value_Checkbox_Group_frame = "1" Then $Value_Checkbox_Group_frame = "True"
		If $Value_Checkbox_Group_frame = "4" Then $Value_Checkbox_Group_frame = "False"
	IniWrite($config_ini, "Group_Settings", "frame", $Value_Checkbox_Group_frame)
EndFunc

Func _idRadio_GroupImage_1()
	IniWrite($config_ini, "Group_Settings", "GroupImage", "1")
	FileCopy($gfx & "GroupImage_Default.jpg", $gfx & "GroupImage.jpg", $FC_OVERWRITE)
EndFunc

Func _idRadio_GroupImage_2()
	IniWrite($config_ini, "Group_Settings", "GroupImage", "2")
	FileCopy($gfx & "GroupImage_Oculus.jpg", $gfx & "GroupImage.jpg", $FC_OVERWRITE)
EndFunc

Func _idRadio_GroupImage_3()
	IniWrite($config_ini, "Group_Settings", "GroupImage", "3")
	FileCopy($gfx & "GroupImage_VIVE.jpg", $gfx & "GroupImage.jpg", $FC_OVERWRITE)
EndFunc



Func _Button_Install_Folder()
	$FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Install_Folder, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder", $FileSelectFolder & "\")
	EndIf
EndFunc

Func _Button_Install_Folder_VIVE_Software()
	$FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Install_Folder_VIVE_Software, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_VIVE_Software", $FileSelectFolder & "\")
	EndIf
EndFunc

Func _Button_Install_Folder_VIVE_HOME()
	$FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Install_Folder_VIVE_HOME, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_VIVE_HOME", $FileSelectFolder & "\")
	EndIf
EndFunc

Func _Button_VIVE_HOME()
	$FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_VIVE_HOME, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "VIVE_HOME", $FileSelectFolder & "\")
	EndIf
EndFunc

Func _Button_VIVE_HOME_VRAPP()
	$FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_VIVE_HOME_VRAPP, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "VIVE_HOME_VRAPP", $FileSelectFolder & "\")
	EndIf
EndFunc


Func _Button_Install_Folder_open()
	$Value_Input = GUICtrlRead($Input_Install_Folder)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_VIVE_Software_open()
	$Value_Input = GUICtrlRead($Input_Install_Folder_VIVE_Software)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_VIVE_HOME_open()
	$Value_Input = GUICtrlRead($Input_Install_Folder_VIVE_HOME)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_VIVE_HOME_open()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_VIVE_HOME_VRAPP_open()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME_VRAPP)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc


Func _Button_Install_Folder_save()
	$Value_Input = GUICtrlRead($Input_Install_Folder)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" and $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	IniWrite($config_ini, "Folders", "Install_Folder", $Value_Input)
EndFunc

Func _Button_Install_Folder_VIVE_Software_save()
	$Value_Input = GUICtrlRead($Input_Install_Folder_VIVE_Software)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" and $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	IniWrite($config_ini, "Folders", "Install_Folder_VIVE_Software", $Value_Input)
EndFunc

Func _Button_Install_Folder_VIVE_HOME_save()
	$Value_Input = GUICtrlRead($Input_Install_Folder_VIVE_HOME)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" and $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	IniWrite($config_ini, "Folders", "Install_Folder_VIVE_HOME", $Value_Input)
EndFunc

Func _Button_VIVE_HOME_save()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" and $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	IniWrite($config_ini, "Folders", "VIVE_HOME", $Value_Input)
EndFunc

Func _Button_VIVE_HOME_VRAPP_save()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME_VRAPP)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" and $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	IniWrite($config_ini, "Folders", "VIVE_HOME_VRAPP", $Value_Input)
EndFunc


Func _Button_VIVE_HOME_delete()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"


	$Abfrage = MsgBox(4, "Information", "Do you realy want to Delete the following Files? " & @CRLF & @CRLF & _
											"- " & $Value_Input & "ApplicationList\" & @CRLF & "[VIVE HOME Desktop APP settings folder]" & @CRLF & @CRLF & _
											"Delete all '.appinfo' Files  manually if they was not deleted." & @CRLF & _
											"These Files will be created again automatically on next start." & @CRLF)

	If $Abfrage = 6 Then ;Ja - Auswahl = JA
		FileDelete($VIVE_HOME_ApplicationList_Folder)
		DirCreate($VIVE_HOME_ApplicationList_Folder)
		ShellExecute($VIVE_HOME_ApplicationList_Folder)
	EndIf
EndFunc

Func _Button_VIVE_HOME_VRAPP_delete()
	$Value_Input = GUICtrlRead($Input_VIVE_HOME_VRAPP)
	$Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"

	$Abfrage = MsgBox(4, "Information", "Do you realy want to Delete the following Files? " & @CRLF & @CRLF & _
											"- " & $VIVE_HOME_VRAPP_Folder & "vive.sqlite" & @CRLF & _
											"- " & $VIVE_HOME_VRAPP_Folder & "WidgetPreferences.json" & @CRLF & @CRLF & _
											"Delete the Files manually if they was not deleted." & @CRLF & _
											"These Files will be created again automatically on next start." & @CRLF & @CRLF & _
											"VIVEHIM will restart to be able to delete the Files." & @CRLF)

	If $Abfrage = 6 Then ;Ja - Auswahl = JA
		IniWrite($config_ini, "TEMP", "TEMP_1", "_Button_VIVE_HOME_VRAPP_delete")
		IniWrite($config_ini, "TEMP", "TEMP_2", $VIVE_HOME_VRAPP_Folder & "vive.sqlite")
		IniWrite($config_ini, "TEMP", "TEMP_3", $VIVE_HOME_VRAPP_Folder & "WidgetPreferences.json")

	If FileExists($Install_DIR & "StartVIVEHIM.exe") Then
		ShellExecute($Install_DIR & "VStartVIVEHIM.exe")
	Else
		ShellExecute($Install_DIR & "StartVIVEHIM.au3")
	EndIf

	Exit

	EndIf
EndFunc


Func _Checkbox_Load_ShowPlayerOnline_on_StartUp()
	$Status_Checkbox = GUICtrlRead($Checkbox_Load_ShowPlayerOnline_on_StartUp)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Load_ShowPlayerOnline_on_StartUp", "true")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Load_ShowPlayerOnline_on_StartUp", "false")
	EndIf
EndFunc



Func _idRadio_ImagePath_1()
	IniWrite($config_ini, "Settings", "IconPath", "1")
	_Update_ListView_Available_Icons()
EndFunc

Func _idRadio_ImagePath_2()
	IniWrite($config_ini, "Settings", "IconPath", "2")
	_Update_ListView_Available_Icons()
EndFunc

Func _idRadio_ImagePath_3()
	$Icons_DIR_3 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_1", "")

	If $Icons_DIR_3 = "" Then
		$Abfrage = MsgBox(4, "Information", "Folder Path is empty." & @CRLF & @CRLF & _
												"Do you want to select a new folder for 'custom folder 1'?")


		If $Abfrage = 6 Then ;Ja - Auswahl = JA
			$FileOpen_New_Icon_Path = FileSelectFolder("Choose File:", $Icons_DIR, "Images (*.jpg)", $FD_FILEMUSTEXIST + $FD_MULTISELECT)
			$New_Icon_Path = $FileOpen_New_Icon_Path & "\"
			IniWrite($Config_INI, "Folders", "Custom_Icon_Folder_1", $New_Icon_Path)
			IniWrite($config_ini, "Settings", "IconPath", "3")
		EndIf

	Else
		IniWrite($config_ini, "Settings", "IconPath", "3")
	EndIf
EndFunc

Func _idRadio_ImagePath_4()
	$Icons_DIR_4 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_2", "")

	If $Icons_DIR_4 = "" Then
		$Abfrage = MsgBox(4, "Information", "Folder Path is empty." & @CRLF & @CRLF & _
												"Do you want to select a new folder for 'custom folder 2'?")


		If $Abfrage = 6 Then ;Ja - Auswahl = JA
			$FileOpen_New_Icon_Path = FileSelectFolder("Choose File:", $Icons_DIR, "Images (*.jpg)", $FD_FILEMUSTEXIST + $FD_MULTISELECT)
			$New_Icon_Path = $FileOpen_New_Icon_Path & "\"
			IniWrite($Config_INI, "Folders", "Custom_Icon_Folder_2", $New_Icon_Path)
			IniWrite($config_ini, "Settings", "IconPath", "4")
		EndIf

	Else
		IniWrite($config_ini, "Settings", "IconPath", "4")
	EndIf
EndFunc

Func _Button_UpdateIcons()
	_GUICtrlStatusBar_SetText($Statusbar, "WORKING, please wait..." & @TAB & @TAB & "'Download and Fix Missing Icons'")

	If FileExists($System_Dir & "UpdateIcons.exe") Then
		ShellExecuteWait($System_Dir & "UpdateIcons.exe")
	Else
		ShellExecuteWait($System_Dir & "UpdateIcons.au3")
	EndIf

	IniWrite($config_ini, "Settings", "IconPath", "2")
	_GUICtrlStatusBar_SetText($Statusbar, "" & @TAB & @TAB & "'VIVE HOME Icon Manager - Version 0.5'")

	If FileExists($System_Dir & "VIVEHIM.exe") Then
		ShellExecute($System_Dir & "VIVEHIM.exe")
	Else
		ShellExecute($System_Dir & "VIVEHIM.au3")
	EndIf

	Exit
EndFunc

Func _Button_Download_Icons()
	_Download_Icons()

	MsgBox(0, "Finished", "Missing Icons have been downloaded." & @CRLF & @CRLF & _
						"Icons Folder: " & @CRLF & $Icons_DIR & @CRLF & @CRLF & _
						"If you have missing Icons or wrong Icon Image Path in the settings File then the Icons will not be loaded in VIVE HOME." & @CRLF & _
						"Use the 'Download and Fix Missing Icons' Button or change it manually by using TAB 1 and TAB 2." & @CRLF)

EndFunc

Func _Read_from_VIVEHOME_DB()
	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow_2, $iRows_2, $iCols_2)
	If $iRows <> "" Then $iRows = $iRows + 1
	If $iRows = "" Then $iRows = 1
	If $iRows_2 <> "" Then $iRows_2 = $iRows_2 + 1
	If $iRows_2 = "" Then $iRows_2 = 1

	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)


	_SQLite_FetchNames($hQuery, $aNames)
	;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)

	_GUICtrlListView_BeginUpdate($ListView)
	_GUICtrlListView_DeleteAllItems($ListView)

	For $NR = 1 To $iRows - 1

		_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
		If $iRows <> "" Then $iRows = $iRows + 1
		If $iRows = "" Then $iRows = 1

		_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row

		$Application_App_Name = IniRead($ApplicationList_INI, "Application_" & $aRow[1], "Name", "")
		If $Application_App_Name = "" Then
			$Application_App_Name_search = StringReplace($aRow[1], 'vive.htc.', '')
			$Application_App_Name = IniRead($ApplicationList_INI, "Application_" & $Application_App_Name_search, "Name", "")
			If $Application_App_Name = "" Then $Application_App_Name = $aRow[1]
		EndIf

		$Ebene_temp = $NR - 1

		$Produkt_Nr_anzeige = $aRow[0]
		_GUICtrlListView_AddItem($listview, $Produkt_Nr_anzeige, "")

		$Anzeige_Spalte = $Application_App_Name
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 1)

		$Anzeige_Spalte = $aRow[1]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 2)

		$Anzeige_Spalte = $aRow[9]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 3)

		$Anzeige_Spalte = $aRow[2]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 4)

		$Anzeige_Spalte = $aRow[3]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 5)

		$Anzeige_Spalte = $aRow[4]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 6)

		$Anzeige_Spalte = $aRow[5]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 7)
		If $Anzeige_Spalte = "1" Then
			IniWrite($ApplicationList_INI, "Application_" & $aRow[1], "IsFavorite", "true")
			_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 1)
		Else
			_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 0)
		EndIf

		$Anzeige_Spalte = $aRow[6]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 8)

		$Anzeige_Spalte = $aRow[7]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 9)

		$Anzeige_Spalte = $aRow[8]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 10)

		$Anzeige_Spalte = $aRow[10]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 11)

	Next

	_GUICtrlListView_EndUpdate($ListView)

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()
EndFunc

Func _Search_Files()
	Local $s_LocalFolder = $VIVE_HOME_ApplicationList_Folder
	Local $FileList = _FileListToArray($s_LocalFolder , "*.appinfo" , 1)

	If $FileList <> "" Then
		For $NR = 1 To $FileList[0]
			$Application_NR = $NR
			$FileList_NR = $FileList[0]
		Global $File_Name = $FileList[$NR]
		Global $File_Path = $VIVE_HOME_ApplicationList_Folder & $File_Name
		$ProcessBar_Status = $NR * 100 / $FileList[0]
		$ProcessBar_Status = $ProcessBar_Status - 15
		GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
		_ApplicationList_Update()
		$File_Path =  ""
		Next
		Sleep(500)
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

			$Anzahl_Zeilen = 15

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
					EndIf


					If $Name = "AppId" or $Name = "Name" Then
						If $Name <> "" Then
							If $Name = "AppId" Then $Write_AppId = $Wert
							If $Check_Name = '"Name"' Then
								$APP_Name = StringReplace($Wert_Zeile_komplett, ' "Name"', '')
								$APP_Name = StringReplace($APP_Name, '"', '')
								$APP_Name = StringReplace($APP_Name, ',', '')
								$APP_Name = StringTrimLeft($APP_Name, 3)
								$Name = "Name"
								$Wert = $APP_Name
							EndIf

							IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
							$Check_INI_Value_Name = IniRead($ApplicationList_INI, "Application_" & $Application_NR, $Name, "")

							If $Check_INI_Value_Name = "" Then
								IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
								IniWrite($ApplicationList_INI, "Application_" & $Application_NR, $Name, $Wert)
							EndIf

							$Check_INI_Wert = IniRead($ApplicationList_INI, "Application_" & $Application_NR, $Wert, "")

							If $Check_INI_Value_Name = "" Then
								IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "NR", $Application_NR)
								IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, $Name, $Wert)
							EndIf

							$CheckIf_SteamGame = StringLeft($Write_AppId, 10)

							$Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = IniRead($config_ini,"Settings", "Load_ShowPlayerOnline_on_StartUp", "")

							If $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = "true" Then
								If $CheckIf_SteamGame = "steam.app." Then
									;MsgBox(0, "$CheckIf_SteamGame", $CheckIf_SteamGame)
									_Get_ADD_PlayersOnline_DATA()
								EndIf
							EndIf
						EndIf
					EndIf
				Next
		EndIf
	EndIf
EndFunc

Func _Get_ADD_PlayersOnline_DATA()
	Global $Check_AppId = $Write_AppId
	Global $Steam_AppId = StringReplace($Check_AppId, 'steam.app.', '')

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $Steam_AppId & '/graphs/')

	Local $iPosition_1 = StringInStr($sHTML, '<li><strong>')
	Local $iPosition_2 = StringInStr($sHTML, '</strong><em>all-time peak')
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)
	Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)

	If $aArray[0] > 1 Then

		Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
		$PlayersOnline_right_now = $PlayersOnline_right_now[1]
		Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
		$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
		Global $PlayersOnline_all_time_peak = $aArray[4]

		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "right_now", $PlayersOnline_right_now)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "24h_peak", $PlayersOnline_24h_peak)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "all_time_peak", $PlayersOnline_all_time_peak)

		IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "right_now", $PlayersOnline_right_now)
		IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "24h_peak", $PlayersOnline_24h_peak)
		IniWrite($ApplicationList_INI, "Application_" & $Write_AppId, "all_time_peak", $PlayersOnline_all_time_peak)

		$PlayersOnline_right_now = ""
		$PlayersOnline_24h_peak = ""
		$PlayersOnline_all_time_peak = ""

	EndIf

EndFunc

Func _Download_Icons()
	$NR_of_Files = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	For $LOOP_Files_1 = 1 To $NR_of_Files

		$ContentInfo_AppKey = IniRead($ApplicationList_INI, "Application_" & $LOOP_Files_1, "ContentInfo_AppKey", "")
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
		InetGet($URL, $Download_Icon_path_jpg, 16, 0)
		If $ImagePath_Value = 3 Then $download = InetGet($URL, $Download_Icon_path_png, 16, 0)
	EndIf
EndFunc

Func _Download_Icon_for_SteamGameID()
	$ApplicationName = $Check_Application_AppId
	$Application_ID = $SteamGameID
	$Download_Icon_path_jpg = $Icons_DIR & "steam.app." & $Application_ID & '.jpg'
	$Download_Icon_path_png = $Icons_DIR & "steam.app." & $Application_ID & '.png'
	$ImagePath_Value = IniRead($Config_INI, "Settings", "ImagePath", "")
	If $ImagePath_Value = "" Then $ImagePath_Value = 2
	$Steam_Check = StringLeft($ApplicationName, 5)

	If $Steam_Check = "steam" Then
		$URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_ID & '/header.jpg'
		InetGet($URL, $Download_Icon_path_jpg, 16, 0)
		If $ImagePath_Value = 3 Then $download = InetGet($URL, $Download_Icon_path_png, 16, 0)
	EndIf
EndFunc

Func _Button_AddIcons()
	$VIVE_Home_DB_Path = $VIVE_HOME_VRAPP_Folder & "vive.sqlite"
	$VIVE_Home_DB_TABLE_Name = "apps"

	Global $hQuery, $aRow, $iRows, $iCols, $aNames

	_SQLite_Startup()

	Global $VIVE_Home_DB = _SQLite_Open($VIVE_Home_DB_Path) ; open Database

	_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
	If $iRows <> "" Then $iRows = $iRows + 1
	If $iRows = "" Then $iRows = 1

	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)

	_SQLite_FetchNames($hQuery, $aNames)
	;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aNames[0], $aNames[1], $aNames[2], $aNames[3], $aNames[4], $aNames[5], $aNames[6], $aNames[7], $aNames[8], $aNames[9]) & @CRLF)


	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)
	WEnd


	_SQLite_Query($VIVE_Home_DB, "SELECT ROWID,* FROM " & $VIVE_Home_DB_TABLE_Name & " ORDER BY ROWID;", $hQuery)
	_SQLite_FetchNames($hQuery, $aNames)


	For $NR = 1 To $iRows - 1

		_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
		If $iRows <> "" Then $iRows = $iRows + 1
		If $iRows = "" Then $iRows = 1

		_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row

		$ImagePath_Value = IniRead($Config_INI, "Settings", "IconPath", "")
		If $ImagePath_Value = "" Then $ImagePath_Value = 1

		Global $Steam_app_Value = $aRow[1]
		Global $Steam_app_ID = StringReplace($aRow[1], 'steam.app.', '')

		If $ImagePath_Value = "" Then $New_Icon_Path = $Icons
		If $ImagePath_Value = "1" Then $New_Icon_Path = $Icons_DIR_1 & $Steam_app_ID & "_header.jpg"
		If $ImagePath_Value = "2" Then $New_Icon_Path = $Icons_DIR_2 & $aRow[1] & ".jpg"
		If $ImagePath_Value = "3" Then $New_Icon_Path = $Icons_DIR_3 & $aRow[1] & ".jpg"
		If $ImagePath_Value = "4" Then $New_Icon_Path = $Icons_DIR_4 & $aRow[1] & ".jpg"


		$Check_steam_StringInStr = StringInStr($aRow[1], "steam.app.")
		If $Check_steam_StringInStr = 0 Then $New_Icon_Path = $aRow[9]
		If $Check_steam_StringInStr = 0 Then $New_Icon_URL = "http:\\cdn.akamai.steamstatic.com\steam\apps\" & $aRow[1] & "\header.jpg"

		$Check_steam_StringInStr = StringInStr($aRow[1], "revive.app.")
		If $Check_steam_StringInStr > 0 Then
			$New_Icon_URL = $aRow[7]
			$New_Icon_Path = $aRow[9]
		EndIf

		$Check_steam_StringInStr = StringInStr($aRow[1], "openvr.tool.")
		If $Check_steam_StringInStr > 0 Then
			If $ImagePath_Value = "" Then $New_Icon_Path = $Icons
			If $ImagePath_Value = "1" Then $New_Icon_Path = $Icons_DIR_1 & $Steam_app_ID & "_header.jpg"
			If $ImagePath_Value = "2" Then $New_Icon_Path = $Icons_DIR_2 & $aRow[1] & ".jpg"
			If $ImagePath_Value = "3" Then $New_Icon_Path = $Icons_DIR_3 & $aRow[1] & ".jpg"
			If $ImagePath_Value = "4" Then $New_Icon_Path = $Icons_DIR_4 & $aRow[1] & ".jpg"
			$New_Icon_URL = $aRow[7]

			If Not FileExists($New_Icon_Path) Then
				FileCopy($Icons & $aRow[1] & ".jpg", $New_Icon_Path)
			EndIf

		EndIf

		If $aRow[1] = "htc.vive.home" Then
			$New_Icon_URL = ""
			$New_Icon_Path = ""
		EndIf

		_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
									$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $New_Icon_URL & "','" & $aRow[8] & "','" & $New_Icon_Path & "','" & $aRow[10] & "');")

	Next

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	_Read_from_VIVEHOME_DB()
EndFunc

Func _Button_INFO()
	$Abfrage = MsgBox(4, "INFO", "VIVEhomeIconManager [VIVEHIM] made by cogent" & @CRLF & @CRLF & @CRLF & _
						"German Forum Thread:" & @CRLF & _
						"http://evo-x.de/wbb3/board453-community-magazin/board595-virtual-reality-vr/220052-vivehim-vive-home-icon-manager-download-and-fixes-missing-icons-in-vive-home/" & @CRLF & _
						@CRLF & @CRLF & _
						"English Forum Thread:" & @CRLF & _
						"https://www.reddit.com/r/Vive/comments/5lg82i/vivehim_vive_home_icon_manager_download_and_fixes/?st=j04657gm&sh=2300aa82" & @CRLF & _
						@CRLF & @CRLF & @CRLF & _
						"01.01.2017 - cogent" & @CRLF & @CRLF & @CRLF & _
						"Do you want to open the Forum Thread in your Internet Explorer?" & @CRLF & @CRLF & @CRLF, 20)

	If $Abfrage = 6 Then ;Ja - Auswahl = JA
		ShellExecute("http://evo-x.de/wbb3/board453-community-magazin/board595-virtual-reality-vr/220052-vivehim-vive-home-icon-manager-download-and-fixes-missing-icons-in-vive-home/")
		ShellExecute("https://www.reddit.com/r/Vive/comments/5lg82i/vivehim_vive_home_icon_manager_download_and_fixes/?st=j04657gm&sh=2300aa82")
	EndIf
EndFunc

Func _Restart()
	FileDelete($Shortcuts_INI)
	FileDelete(@ScriptDir & "\" & "PlayersOnline.jpg")
	If FileExists($Install_DIR & "StartVIVEHIM.exe") Then
		ShellExecute($Install_DIR & "StartVIVEHIM.exe")
	Else
		ShellExecute($Install_DIR & "StartVIVEHIM.au3")
	EndIf

	Exit
EndFunc

Func _Beenden()
	FileDelete($Shortcuts_INI)
	FileDelete(@ScriptDir & "\" & "PlayersOnline.jpg")
	IniWrite($config_ini, "TEMP", "TEMP_1", "")
	IniWrite($config_ini, "TEMP", "TEMP_2", "")
	IniWrite($config_ini, "TEMP", "TEMP_3", "")
	Exit
EndFunc

#endregion
