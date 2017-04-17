
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
#include "_GDIPlus_WTOB.au3"
#include <GDIPlus.au3>
#include <Inet.au3>

#include <IE.au3>
#include <MsgBoxConstants.au3>

Opt("GUIOnEventMode", 1)

#Region Set Global and Local
Global $config_ini, $font, $font_arial, $Install_DIR, $Install_DIR_StringReplace, $gfx, $Anzeige_Fortschrittbalken
Global $Linie_oben, $Linie_unten, $Linie_rechts, $Linie_links
Global $Erster_Start, $Abfrage, $Icon_Preview_Image, $Available_Icon_Preview_Image, $Available_Icon_Preview_Image_1, $Available_Icon_Preview_Image_2, $Available_Icon_Preview_Image_3
Global $ListView, $idTreeView, $Statusbar, $GUI, $iwParam, $Button_UpdateIcons, $Check_idRadio_ImagePath
Global $Application_NR, $Write_AppId, $ListView_Selected_Row_Value
Global $hWnd, $iMsg, $iwParam, $ilParam, $GetTableArray, $iStylesEx
Global $id_CreateTreeViewItem, $APP_Name, $AppNR, $AppName, $AppId, $AppIsFavorite, $App_PO_right_now, $App_PO_24h_peak, $App_PO_all_time_peak
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
Global $Current_Shortcuts_ListView, $Available_Games_ListView, $Current_Groups_ListView, $NR_Shorcuts
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
Global $Status_Checkbox_Group_Name_2_Image, $Checkbox_Group_Name_2_Image
Global $Check_idRadio_GroupImage, $idRadio_GroupImage_1, $idRadio_GroupImage_2, $idRadio_GroupImage_3
Global $BK_Path_IconsDrop2_ListView, $Content_IconsDrop2_ListView, $iLV_IconsDrop2_ListView, $ListView_content, $Drop_IconName
Global $Drop_Icon_Path, $Icon_Folder, $ListView_Check_Name_Array, $Drop_IconAppKey, $ListView_IconsDrop2_Selected_Row_Index
Global $ListView_IconsDrop2_Selected_Row_Nr, $GameName_IconsDrop2, $Application_App_Name_search
Global $hQuery, $aRow, $iRows, $iCols, $aNames, $Steam_app_Value, $Steam_app_ID
Global $IconName, $ApplicationNR, $Check_ShowPlayerOnline
Global $Value_ShowPlayerOnline, $Input_ShowPlayerOnline, $UpDown_ShowPlayerOnline, $Status_Checkbox, $Value_UpDown_PlayerOnline
Global $VIVE_HOME_Software_Search_Folder, $VIVE_HOME_Software_Folder, $CheckIf_SteamGame
Global $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp, $Checkbox_Load_ShowPlayerOnline_on_StartUp
Global $PO_right_now, $PO_24h_peak, $PO_all_time, $ListView_Item_Name, $ListView_Item_SteamID
Global $Input_Install_Folder, $Button_Install_Folder, $Input_Install_Folder_VIVE_Software, $Button_Install_Folder_VIVE_Software
Global $Input_Install_Folder_VIVE_HOME, $Button_Install_Folder_VIVE_HOME, $Input_VIVE_HOME, $Button_VIVE_HOME, $Input_VIVE_HOME_VRAPP, $Button_VIVE_HOME_VRAPP
Global $FileSelectFolder, $Value_Input, $Check_Value_Input, $Label_Settings_2, $Label_Settings_2, $VIVE_HOME_ApplicationList_Folder
Global $Button_StartGame, $GameID, $Check_IF_Steam_APP, $oIE, $IE_Adresse, $HTML_GUI, $TreeView_Game_ID, $TreeView_Steam_app_Name
Global $id_TreeViewItem_AppKey, $id_TreeViewItem_AppNameAppName, $id_TreeViewItem_AppId, $id_TreeViewItem_AppIsFavorite, $id_TreeViewItem_App_PO_right_now, $id_TreeViewItem_App_PO_24h_peak, $id_TreeViewItem_App_PO_all_time_peak
Global $Content_Current_Groups_ListView, $Content_Available_Groups_ListView, $Checkbox_Overwrite_ApplicationList_INI_on_StartUp
Global $Button_ADD_Icon, $Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp, $Status_Checkbox_AutoDownload_Missing_Icons, $Checkbox_AutoDownload_Missing_Icons
Global $Application_IDNR, $Missing_Steam_app_Name, $Missing_Steam_app_ID, $Button_Delete_ApplicationList_INI, $hImagebtn
Global $Status_Checkbox_FB_Check, $Checkbox_FB_Check, $Check_Checkbox_FB_Check, $Checkbox_Start_as_Admin
Global $GetItemTextString, $GetItem_Name, $GetItem_AppId, $GetItem_IsFavorite, $GetItem_IconPath, $GetItem_NR, $ApplicationNR_TEMP
Global $Check_GameName, $LOOP_Checkbox_1, $Button_Save_Favorites, $Time, $Status_Checkbox_Use_VIVEHOME_lnk, $Checkbox_Use_VIVEHOME_lnk
Global $OVR_Service_Check, $OVR_Service_Check_pic, $Button_OVR_Service_Start, $Button_OVR_Service_Stop, $Status_Checkbox_StopOVRS_on_StartUp, $Checkbox_StopOVRS_on_StartUp
Global $Status_Checkbox_Minimize_OVRS, $Checkbox_Minimize_OVRS, $NR_TEMP, $Check_SteamName, $NR_ProcessBar, $ProcessBar_Status_new
Global $ListView_DB_Selected_Row_Index, $ListView_DB_Selected_Row_Nr, $GameName_DB_Click, $GameAppId_DB_Click
Global $Check_AppId, $sHTML, $sStringReplace, $Check_Steam_AppId, $Button_SaveFavorites_TAB1, $GameName_ListView, $GameAppId_ListView
Global $Status_Checkbox_USE_FB_GUI, $Checkbox_USE_FB_GUI, $USE_FB_GUI_Image, $StartedAsAdmin, $Button_HTCS_Service_Start, $Button_HTCS_Service_Stop
Global $USE_FB_GUI_Check, $HTC_Service_Check, $HTC_Service_Check_pic, $Status_Checkbox_StopHTCS_on_StartUp, $Checkbox_StopHTCS_on_StartUp
Global $Status_IDRadio, $idRadio_1, $idRadio_2, $idRadio_3, $idRadio_4, $SelectGroup_DropDown
Global $Group_1, $Group_2, $Group_3, $Group_4, $Group_5, $Group_6, $Group_7, $Group_8, $Group_9, $Group_10
Global $Button_ADD_Group, $GameName_DropDown, $Group_TEMP

Local $hQuery, $aRow, $iRows, $iCols, $aNames
#endregion

#Region Declare Variables/Const 1
Global $Version = "0.70"
Global $config_ini = @ScriptDir & "\config.ini"
$Install_DIR_StringReplace = StringReplace($config_ini, 'System\config.ini', '')
$Install_DIR = $Install_DIR_StringReplace
IniWrite($config_ini, "Folders", "Install_Folder", $Install_DIR)
Global $Install_Folder_VIVE_Software = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_Software", "")
Global $Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
Global $VIVE_HOME_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME", "")
Global $VIVE_HOME_VRAPP_Folder = IniRead($Config_INI, "Folders", "VIVE_HOME_VRAPP", "")
Global $VIVEHOME_Shortcut_File_source = "C:\Users\cogent\AppData\Roaming\HTC\Vive\WidgetPreferences.json"
Global $VIVEHOME_Shortcut_File_source_bak = "C:\Users\cogent\AppData\Roaming\HTC\Vive\WidgetPreferences.json.bak"
Global $VIVEHIM_WidgetPreferences_folder = $Install_DIR & "WidgetPreferences\"

Global $gfx = @ScriptDir & "\" & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $Icons_Favorites_Folder = $Install_DIR & "Icons\Favorites\"
If Not FileExists($Icons_Favorites_Folder) Then DirCreate($Icons_Favorites_Folder)
Global $Icons_DIR_1 = $Install_Folder_VIVE_Software & "Updater\App\Dashboard\win32\header_image\"
Global $Icons_DIR_2 = $Icons
Global $Icons_DIR_3 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_1", "")
Global $Icons_DIR_4 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_2", "")

$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")
If $Check_idRadio_ImagePath = "" Then IniWrite($config_ini, "Settings", "IconPath", "2")
If $Check_idRadio_ImagePath = "" Then $Check_idRadio_ImagePath = 2

If $Check_idRadio_ImagePath = "" Then $Icons = $Icons
If $Check_idRadio_ImagePath = "1" Then $Icons = $Icons_DIR_1
If $Check_idRadio_ImagePath = "2" Then $Icons = $Icons_DIR_2
If $Check_idRadio_ImagePath = "3" Then $Icons = $Icons_DIR_3
If $Check_idRadio_ImagePath = "4" Then $Icons = $Icons_DIR_4

$StartedAsAdmin = IniRead($Config_INI, "TEMP", "StartedAsAdmin", "")
#endregion

#region Erster Start Abfrage

$Erster_Start = IniRead($config_ini, "Settings", "First_Start", "true")

If $Erster_Start = "true" or $Erster_Start = "" Then
	$Abfrage = MsgBox (4, "First Start - VIVE Home Icon Manager - Version " & $Version, "First start of VIVEHIM takes a few seconds because it will check all games and create the File 'ApplicationList.ini'." & @CRLF & _
																	"After second start it will only check if there are new games and if there are then it will only add the new one and will not check the old games anymore." & @CRLF & @CRLF & _
																	"VIVE HOME settings - folders:" & @CRLF & _
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
#endregion


#region Declare Names
$Name_TAB_1 = "VIVE HOME Database"
$Name_TAB_2 = "GAMES Overview"
$Name_TAB_3 = "ICONS + WIDGETS"
$Name_TAB_4 = "SETTINGS"

$font = "arial"
$font_arial = "arial"
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
$GUI = GUICreate("VIVE HOME Icon Manager", 643, 545, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

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
If $Check_idRadio_ImagePath = "" Then $Check_idRadio_ImagePath = 2

Global $idRadio_ImagePath_1 = GUICtrlCreateRadio("Use VIVE Dashboard folder", 182, 13, 145, 15)
If $Check_idRadio_ImagePath = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Choose folder to use with VIVEHIM and Vive Home." & @CRLF & @CRLF & _
					"Add the folder path to the Vive Home Database using the 'plus' Button at the right.")

Global $idRadio_ImagePath_2 = GUICtrlCreateRadio("Use VIVEHIM folder", 182, 27, 145, 15)
If $Check_idRadio_ImagePath = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Choose folder to use with VIVEHIM and Vive Home." & @CRLF & @CRLF & _
					"Add the folder path to the Vive Home Database using the 'plus' Button at the right.")

Global $idRadio_ImagePath_3 = GUICtrlCreateRadio("Use custom folder 1", 338, 13, 115, 13)
If $Check_idRadio_ImagePath = "3" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Choose folder to use with VIVEHIM and Vive Home." & @CRLF & @CRLF & _
					"Add the folder path to the Vive Home Database using the 'plus' Button at the right.")

Global $idRadio_ImagePath_4 = GUICtrlCreateRadio("Use custom folder 2", 338, 27, 115, 13)
If $Check_idRadio_ImagePath = "4" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Choose folder to use with VIVEHIM and Vive Home." & @CRLF & @CRLF & _
					"Add the folder path to the Vive Home Database using the 'plus' Button at the right.")

$Button_AddIcons = GUICtrlCreateButton("Add Icons", 456, 10, 30, 30, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_AddIcons, $gfx & "AddIcons.bmp")
GuiCtrlSetTip(-1, "Adds selected Icon Path to all Steam games in VIVE HOME Database." & @CRLF & _
					"This can take some time, depending how many games are installed.")


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

If $StartedAsAdmin <> "true" Then _GUICtrlStatusBar_SetText($Statusbar, "LOADING, please wait..." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
If $StartedAsAdmin = "true" Then _GUICtrlStatusBar_SetText($Statusbar, "LOADING, please wait..." & @TAB & "[ADMIN]" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")


; TABS ERSTELLEN
$TAB_NR = GUICtrlCreateTab(2, 50, 1095, 575, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
GUICtrlSetOnEvent($TAB_NR, "_Tab")

$TAB_NR_1 = GUICtrlCreateTab(70, 105, 420, 380)
$TAB_NR_1_1 = GUICtrlCreateTabItem($Name_TAB_1)
Global $listview = GUICtrlCreateListView("", 0, 70, 644, 404, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT), $TAB_NR_1)
_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
GUICtrlSetFont($listview, 11, 500, 1, $font_arial)

; Load images
$ListView_Favorite_Image = _GUIImageList_Create(16,16)
_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")
_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_2.bmp")
_GUICtrlListView_SetImageList($listview, $ListView_Favorite_Image, 1)

; Add columns
_GUICtrlListView_AddColumn($listview, "NR.", 58)
_GUICtrlListView_AddColumn($listview, "Name", 135)
_GUICtrlListView_AddColumn($listview, "App Key", 142)
_GUICtrlListView_AddColumn($listview, "Online", 53, 2)
_GUICtrlListView_AddColumn($listview, "Icon File Path", 232)
_GUICtrlListView_AddColumn($listview, "Launch Count", 105)
_GUICtrlListView_AddColumn($listview, "Last Launched", 107)
_GUICtrlListView_AddColumn($listview, "Total Played", 90)
_GUICtrlListView_AddColumn($listview, "Is Favorite", 88)
_GUICtrlListView_AddColumn($listview, "Installed Time", 98)
_GUICtrlListView_AddColumn($listview, "Icon Url", 88)
_GUICtrlListView_AddColumn($listview, "Icon Timestamp", 110)
_GUICtrlListView_AddColumn($listview, "Icon Fetch Time", 113)

$Button_StartGame = GUICtrlCreateButton("Add Icons", 5, 480, 87, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_StartGame, $gfx & "StartGame.bmp")
GuiCtrlSetTip(-1, "Starts selected SteamVR Game.")

$Button_SaveFavorites_TAB1 = GUICtrlCreateButton("Save Favorites", 100, 480, 87, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_SaveFavorites_TAB1, $gfx & "SaveFavorites.bmp")
GuiCtrlSetTip(-1, "Saves Favorites." & @CRLF & _
					"This can take some time, depending how many games are installed and selected as Favorites." & @CRLF & @CRLF & _
					"If Favorites or Player online count on Icons does not work then delete 'ApplicationList.ini in SETTINGS TAB and deselect/select Favorites again.")

GUICtrlCreateTabItem("")


$TAB_NR_2 = GUICtrlCreateTabItem($Name_TAB_2)

Local $Kopfzeile_Explorerbaum = GUICtrlCreateListView("", 0, 70, 690, 25, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT), $TAB_NR_2)
_GUICtrlListView_SetExtendedListViewStyle($Kopfzeile_Explorerbaum, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))

_GUICtrlListView_AddColumn($Kopfzeile_Explorerbaum, "VIVE HOME - Application Overview", 645)
Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

Local $idTreeView = GUICtrlCreateTreeView(0, 93, 644, 377, $iStyle, $WS_EX_CLIENTEDGE)

GUICtrlCreateTabItem("")


$TAB_NR_3 = GUICtrlCreateTabItem($Name_TAB_3)

; Create ListViews
$Available_Games_ListView  = GUICtrlCreateListView("VIVE HOME Games", 10, 85, 200, 160)
_GUICtrlListView_SetColumnWidth($Available_Games_ListView, 0, 178)
_GUICtrlListView_SetExtendedListViewStyle($Available_Games_ListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))
GuiCtrlSetTip(-1, "Listview shows all available Vive Home games." & @CRLF & @CRLF & _
					"Select the game in the Listview to see the current Icon in the preview." & @CRLF & _
					"Select the game in the Listview first before trying to add a new new." & @CRLF & @CRLF)

$Current_Shortcuts_ListView = GUICtrlCreateListView("Available Icons", 430, 85, 200, 160)
_GUICtrlListView_SetColumnWidth($Current_Shortcuts_ListView, 0, 178)
_GUICtrlListView_SetExtendedListViewStyle($Current_Shortcuts_ListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))
GuiCtrlSetTip(-1, "Listview shows all available Icons in selected folder." & @CRLF & @CRLF & _
					"Select the Icon in the Listview to see it in the preview." & @CRLF & _
					"Change current Icon folder to show the Icons from that folder in the Listview." & @CRLF & @CRLF)

$Current_Groups_ListView = GUICtrlCreateListView("VIVE HOME Objects / Groups", 220, 300, 200, 160)
_GUICtrlListView_SetColumnWidth($Current_Groups_ListView, 0, 178)
GuiCtrlSetTip(-1, "Listview shows all available/added Vive Home widgets and objects." & @CRLF & _
					"It shows also groups if they was added using VIVEHIM." & @CRLF & @CRLF & _
					"Explanation:" & @CRLF & _
					"# = Game shortcuts" & @CRLF & _
					"* = Group Image or general image" & @CRLF & _
					"- = VivePort Portal")

GUICtrlCreateLabel("Current Icon", 210, 82, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)
$Available_Icon_Preview_Image_1 = GUICtrlCreatePic($gfx & "Icon_Preview_4.jpg", 210, 97, 130, 60)

GUICtrlCreateLabel("ADD Icon", 353, 82, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)

GUICtrlCreateLabel("Selected Icon", 300, 170, 160, 20) ;
GUICtrlSetFont(-1, 11, 400, 2, $font_arial)
$Available_Icon_Preview_Image_2 = GUICtrlCreatePic($gfx & "Icon_Preview_2.jpg", 300, 185, 130, 60)

; Button
$Button_ADD_Icon = GUICtrlCreateButton("ADD Icon", 350, 97, 70, 40, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_ADD_Icon, $gfx & "ADD_Icon.bmp")
GuiCtrlSetTip(-1, "Adds selected Icon to the selected game." & @CRLF & @CRLF & _
					"Select the game and Icon first before using this function.")

GUICtrlCreateGroup("", 0, 270, 643, 1)


GUICtrlCreateGroup("Group Settings", 10, 296, 205, 165)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


$SelectGroup_DropDown = GUICtrlCreateCombo("Choose Group", 20, 320, 160, 20)
GUICtrlSetFont($SelectGroup_DropDown, 11, 400, 1, $font_arial)
GuiCtrlSetTip(-1, "Choose Group you want to add or edit." & @CRLF & @CRLF & _
					"Name of the group can be changed and saved after it was selected in the DropDown.")
_Update_Group_DropDown()

$Button_ADD_Group = GUICtrlCreateButton("ADD Group", 185, 320, 20, 20, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_ADD_Group, $gfx & "ADD_Group.bmp")
GuiCtrlSetTip(-1, "Add selected group to Vive Home using this Button.")

$Label_Shortcut_Settings_Group_Name = GUICtrlCreateLabel("Group Name:", 20, 345, 200, 20) ;
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Group_Name = GUICtrlCreateInput("", 20, 360, 160, 20)
GuiCtrlSetTip(-1, "Change the current name")

$Button_Save_GroupName = GUICtrlCreateButton("SAVE", 185, 360, 20, 20, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_Save_GroupName, $gfx & "Save.bmp")
GuiCtrlSetTip(-1, "Saves/Changes the current name for selected group.")

$Status_Checkbox_Group_IsVisible = IniRead($config_ini,"Group_Settings", "IsVisible", "")
$Checkbox_Group_IsVisible = GUICtrlCreateCheckbox("Visible", 20, 385, 55, 20) ; 320
If $Status_Checkbox_Group_IsVisible = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

$Status_Checkbox_Group_IsPhysicsEnabled = IniRead($config_ini,"Group_Settings", "IsPhysicsEnabled", "")
$Checkbox_Group_IsPhysicsEnablede = GUICtrlCreateCheckbox("IsPhysicsEnabled", 75, 385, 110, 20)
If $Status_Checkbox_Group_IsPhysicsEnabled = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")


$Status_Checkbox_Group_glass = IniRead($config_ini,"Group_Settings", "glass", "")
$Checkbox_Group_glass = GUICtrlCreateCheckbox("Glass", 20, 410, 50, 20)
If $Status_Checkbox_Group_glass = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

$Status_Checkbox_Group_frame = IniRead($config_ini,"Group_Settings", "frame", "")
$Checkbox_Group_frame = GUICtrlCreateCheckbox("Frame", 75, 410, 50, 20)
If $Status_Checkbox_Group_frame = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

$Status_Checkbox_Group_Name_2_Image = IniRead($config_ini,"Group_Settings", "frame", "")
$Checkbox_Group_Name_2_Image = GUICtrlCreateCheckbox("Write Name", 130, 410, 75, 20)
If $Status_Checkbox_Group_Name_2_Image = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")


GUICtrlCreateLabel("Image:", 20, 435, 38, 20) ;
GUICtrlSetFont(-1, 10, 400, 1, $font_arial)


$Check_idRadio_GroupImage = IniRead($config_ini, "Group_Settings", "GroupImage", "")

Global $idRadio_GroupImage_1 = GUICtrlCreateRadio("Default", 62, 435, 50, 15)
If $Check_idRadio_GroupImage = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

Global $idRadio_GroupImage_2 = GUICtrlCreateRadio("Oculus", 117, 435, 50, 15)
If $Check_idRadio_GroupImage = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

Global $idRadio_GroupImage_3 = GUICtrlCreateRadio("VIVE", 170, 435, 40, 13)
If $Check_idRadio_GroupImage = "3" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Widget settings for selected group.")

GUICtrlCreateGroup("Widget Preferences", 428, 296, 205, 165)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

Global $Button_Backup_WidgetPreferences_json = GUICtrlCreateButton("Backup 'WidgetPreferences.json'", 435, 315, 190, 40, $BS_BITMAP)
GUICtrlSetFont(-1, 9, 400, 1, $font_arial)
GuiCtrlSetTip(-1, "Backups Vive Home 'WidgetPreferences.json' File.")

GUICtrlCreateLabel("New 'WidgetPreferences.json':", 435, 365, 200, 20) ;
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)

Global $Select_WidgetPreferences_DropDown = GUICtrlCreateCombo("Choose File", 435, 385, 190, 20)
GUICtrlSetFont($Select_WidgetPreferences_DropDown, 11, 400, 1, $font_arial)
GuiCtrlSetTip(-1, "Choose new 'WidgetPreferences.json' File from '...\VIVEHIM\WidgetPreferences\' folder.")
_Update_Select_WidgetPreferences_DropDown()

Global $Button_Rename_WidgetPreferences_json = GUICtrlCreateButton("Rename", 435, 413, 90, 40, $BS_BITMAP)
GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
GuiCtrlSetTip(-1, "Renames selected Filename in '...\VIVEHIM\WidgetPreferences\' folder.")

Global $Button_AddNew_WidgetPreferences_json = GUICtrlCreateButton("Add", 535, 413, 90, 40, $BS_BITMAP)
GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
GuiCtrlSetTip(-1, "Adds selected File to Vive Home settings folder to use on next start.")

GUICtrlCreateTabItem("")


$TAB_NR_4 = GUICtrlCreateTabItem($Name_TAB_4)

Global $Button_Install_Folder_save, $Button_Install_Folder_VIVE_Software_save, $Button_Install_Folder_VIVE_HOME_save, $Button_VIVE_HOME_save, $Button_VIVE_HOME_VRAPP_save
Global $Button_VIVE_HOME_delete, $Button_VIVE_HOME_VRAPP_delete, $Button_Install_Folder_open, $Button_Install_Folder_VIVE_Software_open
Global $Button_Install_Folder_VIVE_HOME_open, $Button_VIVE_HOME_open, $Button_VIVE_HOME_VRAPP_open

#Region Folders
GUICtrlCreateGroup("Folders", 5, 75, 390, 240)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

GUICtrlCreateLabel("VIVEHIM Install path:", 10, 97, 270, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder = GUICtrlCreateInput($install_dir, 10, 114, 265, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder = GUICtrlCreateButton("...", 280, 113, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_open = GUICtrlCreateButton("Open", 308, 113, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_save = GUICtrlCreateButton("Save", 338, 113, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE Software Install path:", 10, 137, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder_VIVE_Software = GUICtrlCreateInput($Install_Folder_VIVE_Software, 10, 154, 265, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder_VIVE_Software = GUICtrlCreateButton("...", 280, 153, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_VIVE_Software_open = GUICtrlCreateButton("Open", 308, 153, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_VIVE_Software_save = GUICtrlCreateButton("Save", 338, 153, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_Software_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_Software_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE HOME Install path:", 10, 177, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_Install_Folder_VIVE_HOME = GUICtrlCreateInput($Install_Folder_VIVE_HOME, 10, 194, 265, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_Install_Folder_VIVE_HOME = GUICtrlCreateButton("...", 280, 193, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_Install_Folder_VIVE_HOME_open = GUICtrlCreateButton("Open", 308, 193, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_Install_Folder_VIVE_HOME_save = GUICtrlCreateButton("Save", 338, 193, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_HOME_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_Install_Folder_VIVE_HOME_save, $gfx & "Save.bmp")

GUICtrlCreateLabel("VIVE HOME Desktop APP path", 10, 227, 265, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
GUICtrlCreateLabel("[Settings]:", 210, 227, 80, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_VIVE_HOME = GUICtrlCreateInput($VIVE_HOME_Folder, 10, 244, 265, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_VIVE_HOME = GUICtrlCreateButton("...", 280, 243, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_VIVE_HOME_open = GUICtrlCreateButton("Open", 308, 243, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_VIVE_HOME_save = GUICtrlCreateButton("Save", 338, 243, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
$Button_VIVE_HOME_delete = GUICtrlCreateButton("Delete", 362, 243, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Deletes '.appinfo' Files in ApplicationList Folder." & @CRLF & _
					"These Files are automatically created on next Start of VIVE_HOME Desktop APP.")
_GUICtrlButton_SetImage($Button_VIVE_HOME_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_save, $gfx & "Save.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_delete, $gfx & "Delete_small.bmp")

GUICtrlCreateLabel("VIVE HOME VR APP path", 10, 267, 180, 20)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
GUICtrlCreateLabel("[Settings]:", 176, 267, 80, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
$Input_VIVE_HOME_VRAPP = GUICtrlCreateInput($VIVE_HOME_VRAPP_Folder, 10, 284, 265, 20)
GuiCtrlSetTip(-1, "Enter Folder path.")
$Button_VIVE_HOME_VRAPP = GUICtrlCreateButton("...", 280, 283, 25, 22, 0)
GuiCtrlSetTip(-1, "Choose Folder.")
$Button_VIVE_HOME_VRAPP_open = GUICtrlCreateButton("Open", 308, 283, 25, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
$Button_VIVE_HOME_VRAPP_save = GUICtrlCreateButton("Save", 338, 283, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Saves Folder Path.")
$Button_VIVE_HOME_VRAPP_delete = GUICtrlCreateButton("Delete", 362, 283, 22, 22, $BS_BITMAP)
GuiCtrlSetTip(-1, "Deletes 'vive.sqlite' and 'WidgetPreferences_empty.json' in VIVE_HOME settings Folder." & @CRLF & _
					"These Files are automatically created on next Start of VIVE_HOME VR APP or SteamVR.")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_open, $gfx & "Folder_small.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_save, $gfx & "Save.bmp")
_GUICtrlButton_SetImage($Button_VIVE_HOME_VRAPP_delete, $gfx & "Delete_small.bmp")
#endregion

#Region Processes and Services
GUICtrlCreateGroup("Processes and Services", 410, 75, 228, 240)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

GUICtrlCreateLabel("Oculus Rift", 420, 95, 200, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

;Check if ORV Service / process are running
If ProcessExists("OVRServiceLauncher.exe") Then
    $OVR_Service_Check = "true"
Else
	$OVR_Service_Check = "false"
EndIf

If $OVR_Service_Check = "true" Then
	$OVR_Service_Check_pic = GUICtrlCreatePic($gfx & "OVRS_running.bmp", 608, 128, 20, 20)

	If IniRead($config_ini,"Settings", "StopOVRS_on_StartUp", "") = "true" Then
		RunWait("net stop OVRService", "", @SW_HIDE)
		_Button_OVR_Service_Stop()
		Sleep(100)
		GUICtrlSetImage($OVR_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf
Else
	$OVR_Service_Check_pic = GUICtrlCreatePic($gfx & "OVRS_stoped.bmp", 608, 128, 20, 20)
EndIf

$Button_OVR_Service_Start = GUICtrlCreateButton("", 420, 115, 86, 46, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_OVR_Service_Start, $gfx & "StartORS.bmp")
GuiCtrlSetTip(-1, "Starts the Oculus Service, if it was not running, so that you can use it again.")

$Button_OVR_Service_Stop = GUICtrlCreateButton("", 515, 115, 86, 46, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_OVR_Service_Stop, $gfx & "StopORS.bmp")
GuiCtrlSetTip(-1, "Stops the Oculus Service. Start it again if you want to use your Ouclus Rift.")

$Status_Checkbox_Minimize_OVRS = IniRead($config_ini,"Settings", "Minimize_OVRS", "")
$Checkbox_Minimize_OVRS = GUICtrlCreateCheckbox(" Minimize OR Shop Window", 420, 160, 180, 20)
If $Status_Checkbox_Minimize_OVRS = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Automatically minimizes Oculus Rift Shop Window after it was started." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 10, 400, 1, $font_arial)

$Status_Checkbox_StopOVRS_on_StartUp = IniRead($config_ini,"Settings", "StopOVRS_on_StartUp", "")
$Checkbox_StopOVRS_on_StartUp = GUICtrlCreateCheckbox(" Stop Service on StartUp", 420, 177, 180, 20)
If $Status_Checkbox_StopOVRS_on_StartUp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Stops Oculus Rift Service on VIVEHIM StartUp." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 10, 400, 1, $font_arial)

GUICtrlCreateLabel("HTC Vive", 420, 210, 200, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

;Check if ORV Service / process are running
If ProcessExists("Vive.exe") Then
    $HTC_Service_Check = "true"
Else
	$HTC_Service_Check = "false"
EndIf

If $HTC_Service_Check = "true" Then
	$HTC_Service_Check_pic = GUICtrlCreatePic($gfx & "OVRS_running.bmp", 608, 238, 20, 20)

	If IniRead($config_ini,"Settings", "StopHTCS_on_StartUp", "") = "true" Then
		RunWait("net stop Viveport", "", @SW_HIDE)
		RunWait("net stop HTC Account Service", "", @SW_HIDE)
		_Button_HTC_Service_Stop()
		Sleep(100)
		GUICtrlSetImage($HTC_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf
Else
	$HTC_Service_Check_pic = GUICtrlCreatePic($gfx & "OVRS_stoped.bmp", 608, 238, 20, 20)
EndIf

$Button_HTCS_Service_Start = GUICtrlCreateButton("", 420, 230, 86, 36, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_HTCS_Service_Start, $gfx & "StartHTCS.bmp")
GuiCtrlSetTip(-1, "Starts the HTC Service, if it was not running, so that you can use it again.")

$Button_HTCS_Service_Stop = GUICtrlCreateButton("", 515, 230, 86, 36, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_HTCS_Service_Stop, $gfx & "StopHTCS.bmp")
GuiCtrlSetTip(-1, "Stops the HTC Service. Start it again if you want to use your HTC VIVE.")

$Status_Checkbox_StopHTCS_on_StartUp = IniRead($config_ini,"Settings", "StopHTCS_on_StartUp", "")
$Checkbox_StopHTCS_on_StartUp = GUICtrlCreateCheckbox(" Stop Service on StartUp", 420, 265, 180, 20)
If $Status_Checkbox_StopHTCS_on_StartUp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Stops HTC VIVE Service on VIVEHIM StartUp." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 10, 400, 1, $font_arial)


GUICtrlCreateGroup("VIVEHIM StartUP", 5, 320, 390, 85)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

; Checkbox
$Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = IniRead($config_ini,"Settings", "Load_ShowPlayerOnline_on_StartUp", "")
$Checkbox_Load_ShowPlayerOnline_on_StartUp = GUICtrlCreateCheckbox(" Load Players Online Count on StartUp", 11, 340, 315, 20)
If $Status_Checkbox_Load_ShowPlayerOnline_on_StartUp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Loads Players Online count Data on_StartUp for use in the GUI. " & @CRLF & @CRLF & _
					"It loads the Player Count for all SteamVR Games on StartUP. " & "Choose a Game in TAB '" & $Name_TAB_1 & "' to see the Number of Players that are currently online." & @CRLF & _
					"This function will slow down the StartUp Time for VIHEHIM on Start." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)

$Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp = IniRead($config_ini,"Settings", "Overwrite_ApplicationList_INI_on_StartUp", "")
$Checkbox_Overwrite_ApplicationList_INI_on_StartUp = GUICtrlCreateCheckbox(" Delete 'ApplicationList.ini' on StartUp", 11, 360, 315, 20)
If $Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Deletes '...\VIVEHIM\System\ApplicationList.ini' File on every StartUp. " & @CRLF & @CRLF & _
					"This function will slow down the StartUp Time for VIHEHIM on Start." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)

; Button
$Button_Delete_ApplicationList_INI = GUICtrlCreateButton("Delete", 330, 360, 55, 21)
GUICtrlSetTip(-1, "Deletes ApplicationList.ini File in '...\VIVEHIM\System\' Folder.")
$hImagebtn = _GUIImageList_Create(13, 13, 5, 3)
_GUIImageList_AddIcon($hImagebtn, "shell32.dll", 131, True)
_GUICtrlButton_SetImageList($Button_Delete_ApplicationList_INI, $hImagebtn)


$Status_Checkbox_AutoDownload_Missing_Icons = IniRead($config_ini,"Settings", "AutoDownload_Missing_Icons", "")
$Checkbox_AutoDownload_Missing_Icons = GUICtrlCreateCheckbox(" Download missing Icons on StartUp", 11, 380, 315, 20)
If $Status_Checkbox_AutoDownload_Missing_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Automatically tries to Download missing Icons on StartUp if Icon cannot be found." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
#endregion

#Region Background Processes
GUICtrlCreateGroup("Background Processes", 410, 320, 228, 155)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


GUICtrlCreateLabel("Show Online Count on Icons", 420, 340, 180, 20)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


$Status_IDRadio = IniRead($config_ini,"Settings", "IDRadio", "")

$idRadio_1 = GUICtrlCreateRadio("Only one time with VIVE HOME Start", 435, 355, 195, 20)
If $Status_IDRadio = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)

$idRadio_2 = GUICtrlCreateRadio("With Fallback function", 435, 372, 155, 20)
If $Status_IDRadio = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)

$idRadio_3 = GUICtrlCreateRadio("Update in Intervals [minutes]", 435, 389, 155, 20)
If $Status_IDRadio = "3" Then GUICtrlSetState(-1, $GUI_CHECKED)

$idRadio_4 = GUICtrlCreateRadio("Don't use it", 435, 406, 155, 20)
If $Status_IDRadio = "4" Then GUICtrlSetState(-1, $GUI_CHECKED)

GuiCtrlSetTip($idRadio_1, "Shows Players Online count on Icons instead of the yellow Favorite 'Star'." & @CRLF & @CRLF & _
					"It will Update Player Online count only on VIVE HOME start using this option.")

GuiCtrlSetTip($idRadio_2, "Shows Players Online count on Icons instead of the yellow Favorite 'Star'." & @CRLF & @CRLF & _
					"It will Update Player Online count with Fallback function everytime VIVE HOME is loaded.")

GuiCtrlSetTip($idRadio_3, "Shows Players Online count on Icons instead of the yellow Favorite 'Star'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons on Start if VIVE HOME was started using the 'START VIVE HOME' Button." & @CRLF & _
					"Player Online counts are automatically Updated using the 'pause Loop' Time Interval until SteamVR is closed.")

GuiCtrlSetTip($idRadio_4, "Shows Players Online count on Icons instead of the yellow Favorite 'Star'." & @CRLF & @CRLF & _
					"Deactivate this function by choosing this option.")


If $Status_IDRadio = "2" Then
	GUICtrlSetState($Checkbox_FB_Check, $GUI_CHECKED)
	IniWrite($config_ini, "Settings", "ShowPlayerOnline", "false")
	IniWrite($config_ini, "Settings", "FB_Check", "true")
EndIf

If $Status_IDRadio = "3" Then
	GUICtrlSetState($Checkbox_FB_Check, $GUI_UNCHECKED)
	GUICtrlSetState($Checkbox_USE_FB_GUI, $GUI_UNCHECKED)
	IniWrite($config_ini, "Settings", "ShowPlayerOnline", "true")
	IniWrite($config_ini, "Settings", "FB_Check", "false")
EndIf

; UPDOWN
Global $Value_ShowPlayerOnline = IniRead($config_ini, "Settings", "Value_ShowPlayerOnline", "")
Global $Input_ShowPlayerOnline = GUICtrlCreateInput($Value_ShowPlayerOnline, 590, 390, 43, 19)
GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font)
GuiCtrlSetTip(-1, "Time in Minutes. " & "Sets Time for the 'pause Loop'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons using this Time Interval.")
Global $UpDown_ShowPlayerOnline = GUICtrlCreateUpdown($Input_ShowPlayerOnline)
GuiCtrlSetTip(-1, "Time in Minutes. " & "Sets Time for the 'pause Loop'." & @CRLF & @CRLF & _
					"It will Update Player Online count on all selected Icons using this Time Interval.")





$Status_Checkbox_FB_Check = IniRead($config_ini,"Settings", "FB_Check", "")
$Checkbox_FB_Check = GUICtrlCreateCheckbox(" Use ViveHome Fallback Check", 420, 430, 215, 20)
If $Status_Checkbox_FB_Check = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
If $Status_Checkbox_FB_Check = "True" Then IniWrite($config_ini, "Settings", "ShowPlayerOnline", "false")
GuiCtrlSetTip(-1, "Starts Fallback Check together with VIVE HOME auf automatically loads VIVE HOME again after game was closed." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
#endregion

#Region Experimental
GUICtrlCreateGroup("Experimental", 5, 410, 390, 65)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
GUICtrlSetColor(-1, "0x0000FF")
GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


$Status_Checkbox_USE_FB_GUI = IniRead($config_ini,"Settings", "USE_FB_GUI", "")
$Checkbox_USE_FB_GUI = GUICtrlCreateCheckbox(" Fallback Check Status Window", 11, 430, 220, 20)
If $Status_Checkbox_USE_FB_GUI = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
GuiCtrlSetTip(-1, "Shows a GUI Window while the File 'FBCheck' is running in the Background." & @CRLF & @CRLF)
GUICtrlSetFont(-1, 11, 400, 1, $font_arial)

$USE_FB_GUI_Check = IniRead($Config_INI, "Settings", "USE_FB_GUI", "")
$USE_FB_GUI_Image = GUICtrlCreatePic($gfx & "FB_Window_false.jpg", 253, 429, 130, 22) ; 450, 438
If $USE_FB_GUI_Check = "true" Then GUICtrlSetImage($USE_FB_GUI_Image, $gfx & "FB_Window.jpg")
#endregion

GUICtrlCreateTabItem("")
#endregion


#Region Funktionen Verknüpfen

GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
GUICtrlSetOnEvent($Button_Exit, "_Beenden")
GUICtrlSetOnEvent($Button_INFO, "_Button_INFO")
GUICtrlSetOnEvent($Button_Restart, "_Restart")

GUICtrlSetOnEvent($Button_SaveFavorites_TAB1, "_Button_SaveFavorites_TAB1")

GUICtrlSetOnEvent($Button_ADD_Icon, "_Button_ADD_Icon")
GUICtrlSetOnEvent($Button_StartGame, "_Button_StartGame")
GUICtrlSetOnEvent($Button_Delete_ApplicationList_INI, "_Button_Delete_ApplicationList_INI")

GUICtrlSetOnEvent($Button_OVR_Service_Start, "_Button_OVR_Service_Start")
GUICtrlSetOnEvent($Button_OVR_Service_Stop, "_Button_OVR_Service_Stop")
GUICtrlSetOnEvent($Button_HTCS_Service_Start, "_Button_HTC_Service_Start")
GUICtrlSetOnEvent($Button_HTCS_Service_Stop, "_Button_HTC_Service_Stop")

GUICtrlSetOnEvent($Checkbox_StopOVRS_on_StartUp, "_Checkbox_StopOVRS_on_StartUp")
GUICtrlSetOnEvent($Checkbox_Minimize_OVRS, "_Checkbox_Minimize_OVRS")
GUICtrlSetOnEvent($Checkbox_StopHTCS_on_StartUp, "_Checkbox_StopHTCS_on_StartUp")

GUICtrlSetOnEvent($UpDown_ShowPlayerOnline, "_UpDown_PlayerOnline")

GUICtrlSetOnEvent($idRadio_1, "_idRadio_1")
GUICtrlSetOnEvent($idRadio_2, "_idRadio_2")
GUICtrlSetOnEvent($idRadio_3, "_idRadio_3")
GUICtrlSetOnEvent($idRadio_4, "_idRadio_4")

GUICtrlSetOnEvent($Button_Backup_WidgetPreferences_json, "_Button_Backup_WidgetPreferences_json")
GUICtrlSetOnEvent($Button_Rename_WidgetPreferences_json, "_Button_Rename_WidgetPreferences_json")
GUICtrlSetOnEvent($Button_AddNew_WidgetPreferences_json, "_Button_AddNew_WidgetPreferences_json")

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
GUICtrlSetOnEvent($Checkbox_Overwrite_ApplicationList_INI_on_StartUp, "_Checkbox_Overwrite_ApplicationList_INI_on_StartUp")
GUICtrlSetOnEvent($Checkbox_AutoDownload_Missing_Icons, "_Checkbox_AutoDownload_Missing_Icons")
GUICtrlSetOnEvent($Checkbox_FB_Check, "_Checkbox_FB_Check")
GUICtrlSetOnEvent($Checkbox_USE_FB_GUI, "_Checkbox_USE_FB_GUI")

GUICtrlSetOnEvent($Button_Start_VIVEHOME, "_Button_Start_VIVEHOME")
GUICtrlSetOnEvent($Button_UpdateIcons, "_Button_UpdateIcons")
GUICtrlSetOnEvent($idRadio_ImagePath_1, "_idRadio_ImagePath_1")
GUICtrlSetOnEvent($idRadio_ImagePath_2, "_idRadio_ImagePath_2")
GUICtrlSetOnEvent($idRadio_ImagePath_3, "_idRadio_ImagePath_3")
GUICtrlSetOnEvent($idRadio_ImagePath_4, "_idRadio_ImagePath_4")

GUICtrlSetOnEvent($Button_AddIcons, "_Button_AddIcons")

GUICtrlSetOnEvent($Button_ADD_Group, "_Button_ADD_Group")
GUICtrlSetOnEvent($SelectGroup_DropDown, "_SelectGroup_DropDown")
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
#endregion

_Search_Files()
_Read_from_VIVEHOME_DB()
GUICtrlSetData($Anzeige_Fortschrittbalken, 90)
_Create_TreeView()
GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
_Read_Steam_Shortcuts()
_Create_ListViews_TAB_3()
_Tab()
GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
If $StartedAsAdmin <> "true" Then _GUICtrlStatusBar_SetText($Statusbar, "Program loaded and can now be used." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
If $StartedAsAdmin = "true" Then _GUICtrlStatusBar_SetText($Statusbar, "Program loaded and can now be used." & @TAB & "[ADMIN]" & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
GUICtrlSetState($TAB_NR_1_1, $GUI_SHOW)


#Region While 1
While 1
	Sleep(100)
    $nMsg = GUIGetMsg()

    Switch $nMsg

        Case $GUI_EVENT_CLOSE
            Exit

	EndSwitch
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

	$GetItem_Name = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "Name", "")
	$GetItem_AppId = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "AppId", "")
	$GetItem_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "IsFavorite", "")
	$GetItem_IconPath = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "IconPath", "")
	$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $GetItem_AppId, "NR", "")

	_Change_Preview_Icon_Available_Games_ListView()
EndFunc

Func _ClickOn_Current_Shortcuts_ListView()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Current_Shortcuts_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$IconName = _GUICtrlListView_GetItemText($Current_Shortcuts_ListView, $ListView_Selected_Row_Nr - 1, 0)

	_Change_Preview_Icon_Available_Icons_ListView()
EndFunc


Func _Write_Favorite_2_DB_true()
	$Check_GameName = $GameName
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
			If $Check_Application_Name = $Check_GameName Then ; $ListView_Item_Array[1]
				$Check_Application_AppId = IniRead($ApplicationList_INI, "Application_" & $NR_2, "AppId", "")
				$NewIcon_Path = $Icons_DIR_2 & "Favorites\" & $Check_Application_AppId & ".jpg"
				$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "NR", "")
				IniWrite($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IconPath", $NewIcon_Path)
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_NR, "IconPath", $NewIcon_Path)
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
	$Check_GameName = $GameName
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
			If $Check_Application_Name = $Check_GameName Then
				$Check_Application_AppId = IniRead($ApplicationList_INI, "Application_" & $NR_2, "AppId", "")
				$NewIcon_Path = $Icons & $Check_Application_AppId & ".jpg"
				$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "NR", "")
				IniWrite($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IconPath", $NewIcon_Path)
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_NR, "IconPath", $NewIcon_Path)
				If $Check_idRadio_ImagePath = "1" Then
					$SteamGameID = StringReplace($Check_Application_AppId, 'steam.app.', '')
					$SteamGameID = StringReplace($SteamGameID, '.jpg', '')
					$NewIcon_Path = $Icons & $SteamGameID & "_header.jpg"
					$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $Check_Application_AppId, "NR", "")
					IniWrite($ApplicationList_INI, "Application_" & $Check_Application_AppId, "IconPath", $NewIcon_Path)
					IniWrite($ApplicationList_INI, "Application_" & $GetItem_NR, "IconPath", $NewIcon_Path)
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


Func _SelectGroup_DropDown()
	$Group_Name = GUICtrlRead($SelectGroup_DropDown)
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


Func _UpDown_PlayerOnline()
	$Value_UpDown_PlayerOnline = GUICtrlRead($Input_ShowPlayerOnline)

	IniWrite($config_ini, "Settings", "Value_ShowPlayerOnline", $Value_UpDown_PlayerOnline)

	If $Value_UpDown_PlayerOnline < "1" Then
		IniWrite($config_ini, "Settings", "Value_ShowPlayerOnline", "1")
		GUICtrlSetData($Input_ShowPlayerOnline, "1")
	EndIf
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

	Sleep(200)
	_Button_StartGame()
	Sleep(200)
EndFunc

Func _Change_Preview_Icon_VR_APP()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name_ID = $ListView_Item_Array[2] & " - " & $ListView_Item_Array[3]

	$CheckImagePath = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 4)

	If $CheckImagePath = "" or $CheckImagePath = $Icons_DIR & "" & ".jpg" or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc

Func _Change_Preview_Icon_Desktop_APP()
	Local $ID = GUICtrlRead($idTreeView)
	$ID = $ID + 3
    Local $Handle = _GUICtrlTreeView_GetItemHandle($idTreeView, $ID)
    Local $Text = _GUICtrlTreeView_GetText($idTreeView, $Handle)

	$TreeView_Steam_app_ID = StringReplace($Text, 'App ID:', '')
	$TreeView_Steam_app_ID = StringReplace($TreeView_Steam_app_ID, ' ' , '')

	$NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")
	If $NR_Applications = "" Then $NR_Applications = 1

	For $LOOP_Preview_Image_1 = 1 To $NR_Applications
		$ListView_Check_Name_Array = _GUICtrlListView_GetItemTextArray($ListView, $LOOP_Preview_Image_1)
		If $TreeView_Steam_app_ID = $ListView_Check_Name_Array[3] Then
			$New_Icon_steam_app_ID_Path = _GUICtrlListView_GetItemText($ListView, $LOOP_Preview_Image_1, 4)
			ExitLoop
		EndIf
	Next

	If $New_Icon_steam_app_ID_Path = "" or $New_Icon_steam_app_ID_Path = $Icons_DIR & "" & ".jpg" or Not FileExists($New_Icon_steam_app_ID_Path) Then $New_Icon_steam_app_ID_Path = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $New_Icon_steam_app_ID_Path)
	$New_Icon_steam_app_ID_Path = ""
EndFunc

Func _Change_Preview_Icon_Available_Games_ListView()
	$NR_GameNames = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameName = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_Selected_Row_Nr - 1, 0)

	$GetItem_Name = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "Name", "")
	$GetItem_AppId = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "AppId", "")
	$GetItem_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "IsFavorite", "")
	$GetItem_IconPath = IniRead($ApplicationList_INI, "Application_" & $ListView_Selected_Row_Nr, "IconPath", "")
	$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $GetItem_AppId, "NR", "")

	$New_Icon_steam_app_ID_Path = $GetItem_IconPath

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

Func _Button_SaveFavorites_TAB1()
	$NR_GameNames = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	_GUICtrlStatusBar_SetText($Statusbar, "Start adding Favorites..." & @TAB  & $GameName &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")

	For $LOOP_Checkbox_1 = 0 To $NR_GameNames
		$GameName_ListView = _GUICtrlListView_GetItemText($listview, $LOOP_Checkbox_1, 1)
		$GameAppId_ListView = _GUICtrlListView_GetItemText($listview, $LOOP_Checkbox_1, 2)

		$CheckboxStatus =  _GUICtrlListView_GetItemChecked($ListView, $LOOP_Checkbox_1)

		If $CheckboxStatus = "True" Then
			$GetItem_Name = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "Name", "")
			$GetItem_AppId = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "AppId", "")
			$GetItem_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "IsFavorite", "")
			$GetItem_IconPath = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "IconPath", "")
			$GetItem_NR = IniRead($ApplicationList_INI, "Application_" & $GetItem_AppId, "NR", "")

			$GameName = $GetItem_Name
			$Check_ImagePath = $GetItem_IconPath

			If $GetItem_IsFavorite = "false" or $GetItem_IsFavorite = "" Then
				_GUICtrlStatusBar_SetText($Statusbar, "Working...Adding Favorite: " & @TAB & $GameName & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
				GUICtrlSetImage($Icon_Preview_Image, $Check_ImagePath)
				GUICtrlSetImage($Available_Icon_Preview_Image_1, $Check_ImagePath)
				_Write_Favorite_2_Image()
				_Write_Favorite_2_DB_true()
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_AppId, "IsFavorite", "true")
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_NR, "IsFavorite", "true")
				_GUICtrlStatusBar_SetText($Statusbar, "Favorite successful added: " & @TAB  & $GameName &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
			EndIf
			$GameName = ""
			$Check_ImagePath = ""
		Else
			$GetItem_Name = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "Name", "")
			$GetItem_AppId = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "AppId", "")
			$GetItem_IsFavorite = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "IsFavorite", "")
			$GetItem_IconPath = IniRead($ApplicationList_INI, "Application_" & $GameAppId_ListView, "IconPath", "")

			$GameName = $GetItem_Name
			$Check_ImagePath = $GetItem_IconPath

			If $GetItem_IsFavorite = "true" Then
				_GUICtrlStatusBar_SetText($Statusbar, "Working...Removing Favorite: " & @TAB  & $GameName &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
				GUICtrlSetImage($Icon_Preview_Image, $Check_ImagePath)
				GUICtrlSetImage($Available_Icon_Preview_Image_1, $Check_ImagePath)
				_Write_Favorite_2_DB_false()
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_AppId, "IsFavorite", "false")
				IniWrite($ApplicationList_INI, "Application_" & $GetItem_NR, "IsFavorite", "false")
				FileDelete($Icons_DIR_2 & "Favorites\" & $GetItem_AppId & ".jpg")
				_GUICtrlStatusBar_SetText($Statusbar, "Favorite successful removed: " & @TAB  & $GameName &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
			EndIf
			$GameName = ""
			$Check_ImagePath = ""
		EndIf

		$ProcessBar_Status = $LOOP_Checkbox_1 * 100 / $NR_GameNames
		$ProcessBar_Status = $ProcessBar_Status
		GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)

	Next
	_Read_from_VIVEHOME_DB()
	Sleep(500)
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	_GUICtrlStatusBar_SetText($Statusbar, "Finished adding Favorites." & @TAB & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
EndFunc


Func _Button_ADD_Icon()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
	$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")

	$Icon_Folder = $Icons
	If $Check_idRadio_ImagePath = "" Then $Icon_Folder = $Icons
	If $Check_idRadio_ImagePath = "1" Then $Icon_Folder = $Icons_DIR_1
	If $Check_idRadio_ImagePath = "2" Then $Icon_Folder = $Icons_DIR_2
	If $Check_idRadio_ImagePath = "3" Then $Icon_Folder = $Icons_DIR_3
	If $Check_idRadio_ImagePath = "4" Then $Icon_Folder = $Icons_DIR_4

	$ListView_IconsDrop2_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($Available_Games_ListView)
	$ListView_IconsDrop2_Selected_Row_Index = Int($ListView_IconsDrop2_Selected_Row_Index)
	$ListView_IconsDrop2_Selected_Row_Nr = $ListView_IconsDrop2_Selected_Row_Index

	$GameName_IconsDrop2 = _GUICtrlListView_GetItemText($Available_Games_ListView, $ListView_IconsDrop2_Selected_Row_Nr, 0)

	$Drop_IconName = $IconName

	GUICtrlSetData($Anzeige_Fortschrittbalken, 30)

	If $Drop_IconName <> "" Then

		If $ListView_IconsDrop2_Selected_Row_Index >= 0 Then

		$ListView_Item_Array = 0
		$ListView_Selected_Row_Value = ""

		$Drop_IconAppKey = IniRead($ApplicationList_INI, "Application_" & $ListView_IconsDrop2_Selected_Row_Nr + 1, "AppId", "")


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

	GUICtrlSetData($Anzeige_Fortschrittbalken, 60)

		For $NR = 1 To $iRows - 1
			$NR_ProcessBar = $NR + 60
			$ProcessBar_Status = $NR * 100 / $iRows - 1
			$ProcessBar_Status = $ProcessBar_Status
			$ProcessBar_Status_new = 40 * $ProcessBar_Status / 100
			GUICtrlSetData($Anzeige_Fortschrittbalken, $NR_ProcessBar + $ProcessBar_Status_new)
			_SQLite_GetTable2d(-1, "SELECT * FROM " & $VIVE_Home_DB_TABLE_Name & ";", $aRow, $iRows, $iCols)
			If $iRows <> "" Then $iRows = $iRows + 1
			If $iRows = "" Then $iRows = 1

			_SQLite_FetchData($hQuery, $aRow, False, False) ; Read Out the next Row
			;ConsoleWrite(StringFormat(" %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s  %-10s %-10s  %-10s  %-10s ", $aRow[0], $aRow[1], $aRow[2], $aRow[3], $aRow[4], $aRow[5], $aRow[6], $aRow[7], $aRow[8], $aRow[9]) & @CRLF)

			If $Drop_IconAppKey = $aRow[1] Then
				$Drop_Icon_Path = $Icon_Folder & $Drop_IconName
				$New_Icon_URL = $aRow[7]
				$New_Icon_Path = $Drop_Icon_Path
				$NR_TEMP = IniRead($ApplicationList_INI, "Application_" & $Drop_IconAppKey, "NR", "")
				IniWrite($ApplicationList_INI, "Application_" & $Drop_IconAppKey, "IconPath", $New_Icon_Path)
				IniWrite($ApplicationList_INI, "Application_" & $NR_TEMP, "IconPath", $New_Icon_Path)

				_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
												$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $New_Icon_URL & "','" & $aRow[8] & "','" & $New_Icon_Path & "','" & $aRow[10] & "');")

			Else
				_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
												$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $aRow[7] & "','" & $aRow[8] & "','" & $aRow[9] & "','" & $aRow[10] & "');")
			EndIf
		Next

	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

		_SQLite_QueryFinalize($hQuery)
		_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
		_SQLite_Shutdown()

		GUICtrlSetImage($Icon_Preview_Image, $New_Icon_Path)
		GUICtrlSetImage($Available_Icon_Preview_Image_1, $New_Icon_Path)

		$ListView_Item_Array = 0
		$ListView_Selected_Row_Value = ""

		Sleep(100)

		_Read_from_VIVEHOME_DB()

		Else

			MsgBox(0, "Select Game", "Select Game on the left List View first.")

		EndIf

	Else

		MsgBox(0, "Select Game and Icon", "Select Game and Icon on the left and right List View first.")

	EndIf

	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	_GUICtrlStatusBar_SetText($Statusbar, "New Icon added: " & @TAB  & $Drop_IconName & " - " & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
EndFunc

Func _Button_Start_VIVEHOME()
	$Install_Folder_VIVE_HOME = IniRead($Config_INI, "Folders", "Install_Folder_VIVE_HOME", "")
	$Check_ShowPlayerOnline = IniRead($Config_INI, "Settings", "ShowPlayerOnline", "")
	$Check_Checkbox_FB_Check = IniRead($config_ini,"Settings", "FB_Check", "")

	$Status_IDRadio = IniRead($config_ini,"Settings", "IDRadio", "")

	_GUICtrlStatusBar_SetText($Statusbar, "Starting VIVE HOME: " & @TAB & @TAB & "'VIVEHIM - Version " & $Version & "'")

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
		$NR_TEMP = 0
		Do
			$NR_TEMP = $NR_TEMP + 1
			Sleep(1000)
			If $NR_TEMP = 45 Then
				MsgBox(0, "Attention", "Was not able to start SteamVR." & @CRLF & @CRLF & "Try it again...")
				_Restart()
			EndIf
		Until ProcessExists("vrmonitor.exe")
	EndIf

	Sleep(500)

	If $Check_ShowPlayerOnline = "true"  and $Status_IDRadio <> "4" Then
		If FileExists($System_DIR & "AddPO2Icons.exe") Then
			ShellExecute($System_DIR & "AddPO2Icons.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "AddPO2Icons.au3", "", $System_DIR)
		EndIf
	EndIf

	Sleep(500)

	If FileExists($System_DIR & "1_ViveHome.exe") Then
		ShellExecuteWait($System_DIR & "1_ViveHome.exe", "", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "1_ViveHome.au3", "", $System_DIR)
	EndIf

	Sleep(2000)

	If $Check_Checkbox_FB_Check = "true" Then
		If FileExists($System_DIR & "FBCheck.exe") Then
			ShellExecute($System_DIR & "FBCheck.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "FBCheck.au3", "", $System_DIR)
		EndIf
	EndIf

	Sleep(100)

	Exit
EndFunc

Func _Button_StartGame()
	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	$ListView_Item_Name = $ListView_Item_Array[2]
	$ListView_Item_SteamID = $ListView_Item_Array[3]

	$Check_IF_Steam_APP = StringLeft($ListView_Item_SteamID, 10)
	$GameID = StringReplace($ListView_Item_SteamID, 'steam.app.', '')

	$Check_ShowPlayerOnline = IniRead($Config_INI, "Settings", "ShowPlayerOnline", "")

	If $Check_ShowPlayerOnline = "true" Then
		If FileExists($System_DIR & "AddPO2Icons.exe") Then
			ShellExecute($System_DIR & "AddPO2Icons.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "AddPO2Icons.au3", "", $System_DIR)
		EndIf
	EndIf

	Sleep(500)

	If $Check_IF_Steam_APP = "steam.app." Then
		_GUICtrlStatusBar_SetText($Statusbar, "Starting Game: " & $ListView_Item_Name  & " - " & $ListView_Item_SteamID & @TAB & @TAB & "'VIVEHIM - Version " & $Version & "'")
		ShellExecute("steam://launch/" & $GameID & "/VR\")
	EndIf

	Sleep(10000)

	_Tab()
EndFunc

Func _Button_Delete_ApplicationList_INI()
	If FileExists($ApplicationList_INI) Then
		FileDelete($ApplicationList_INI)
	EndIf
	If FileExists($ApplicationList_INI) Then MsgBox(0, "Error", "ApplicationList.ini was not deleted, delete the File manually in '...\VIVEHIM\System\' Folder.", 5)
	If Not FileExists($ApplicationList_INI) Then MsgBox(0, "Deleted", "ApplicationList.ini Deleted", 3)
EndFunc


Func _Button_OVR_Service_Start()
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	GUICtrlSetData($Anzeige_Fortschrittbalken, 5)
	_GUICtrlStatusBar_SetText($Statusbar, "Starting Oculus Service." & @TAB & "...working..." &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	IniWrite($Config_INI, "TEMP", "OVRService", "Start")

	If FileExists($System_DIR & "StartStopOVRS.exe") Then
		ShellExecuteWait($System_DIR & "StartStopOVRS.exe", "", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "StartStopOVRS.au3", "", $System_DIR)
	EndIf
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

	Sleep(500)
	IniWrite($Config_INI, "TEMP", "OVRService", "")
	_Check_OVR_Service()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "Oculus Service running." & @TAB & "OVRS Running: " & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
EndFunc

Func _Button_OVR_Service_Stop()
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	GUICtrlSetData($Anzeige_Fortschrittbalken, 5)
	_GUICtrlStatusBar_SetText($Statusbar, "Stopping Oculus Service." & @TAB & "...working..." &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	IniWrite($Config_INI, "TEMP", "OVRService", "Stop")

	If FileExists($System_DIR & "StartStopOVRS.exe") Then
		ShellExecuteWait($System_DIR & "StartStopOVRS.exe", "", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "StartStopOVRS.au3", "", $System_DIR)
	EndIf
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

	Sleep(500)
	IniWrite($Config_INI, "TEMP", "OVRService", "")
	Sleep(1000)
	_Check_OVR_Service()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "Oculus Service stopped." & @TAB & "OVRS Stopped: " & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
EndFunc

Func _Check_OVR_Service()
	Sleep(1000)
	$OVR_Service_Check = "false"

	If ProcessExists("OVRServiceLauncher.exe") Then
		GUICtrlSetImage($OVR_Service_Check_pic, $gfx & "OVRS_running.bmp")
	Else
		GUICtrlSetImage($OVR_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf

	If Not ProcessExists("OVRServiceLauncher.exe") Then
		GUICtrlSetImage($OVR_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf
EndFunc

Func _Button_HTC_Service_Start()
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	GUICtrlSetData($Anzeige_Fortschrittbalken, 5)
	_GUICtrlStatusBar_SetText($Statusbar, "Starting HTC Service." & @TAB & "...working..." &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	IniWrite($Config_INI, "TEMP", "HTCService", "Start")

	If FileExists($System_DIR & "StartStopHTCS.exe") Then
		ShellExecuteWait($System_DIR & "StartStopHTCS.exe", "", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "StartStopHTCS.au3", "", $System_DIR)
	EndIf

	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

	If FileExists($Install_Folder_VIVE_Software & "PCClient\Vive.exe") Then
		ShellExecute($Install_Folder_VIVE_Software & "PCClient\Vive.exe", "", $System_DIR)
	EndIf

	Sleep(1000)
	IniWrite($Config_INI, "TEMP", "HTCService", "")
	_Check_HTC_Service()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "HTC Vive Service running." & @TAB & "HTCS Running: " & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
EndFunc

Func _Button_HTC_Service_Stop()
	$Time = @HOUR & ":" & @MIN & ":" & @SEC
	GUICtrlSetData($Anzeige_Fortschrittbalken, 5)
	_GUICtrlStatusBar_SetText($Statusbar, "Stopping HTC Service." & @TAB & "...working..." &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	IniWrite($Config_INI, "TEMP", "HTCService", "Stop")

	If FileExists($System_DIR & "StartStopHTCS.exe") Then
		ShellExecuteWait($System_DIR & "StartStopHTCS.exe", "", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "StartStopHTCS.au3", "", $System_DIR)
	EndIf
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

	Sleep(500)
	IniWrite($Config_INI, "TEMP", "HTCService", "")
	Sleep(1000)
	_Check_HTC_Service()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "HTC Service stopped." & @TAB & "HTCS Stopped: " & $Time &  @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
EndFunc

Func _Check_HTC_Service()
	Sleep(1000)
	$HTC_Service_Check = "false"

	If ProcessExists("Vive.exe") Then
		GUICtrlSetImage($HTC_Service_Check_pic, $gfx & "OVRS_running.bmp")
	Else
		GUICtrlSetImage($HTC_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf

	If Not ProcessExists("Vive.exe") Then
		GUICtrlSetImage($HTC_Service_Check_pic, $gfx & "OVRS_stoped.bmp")
	EndIf
EndFunc

Func _Checkbox_StopOVRS_on_StartUp()
	$Status_Checkbox = GUICtrlRead($Checkbox_StopOVRS_on_StartUp)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "StopOVRS_on_StartUp", "true")
		MsgBox(0, "Attention", "VIVEHIM needs to be started as Admin to be able to stop Processes and Services." & @CRLF & "Use 'StartVIVEHIM_AsAdmin.exe' in VIVEHIM install folder.", 10)
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "StopOVRS_on_StartUp", "false")
	EndIf
EndFunc

Func _Checkbox_Minimize_OVRS()
	$Status_Checkbox = GUICtrlRead($Checkbox_Minimize_OVRS)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Minimize_OVRS", "true")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Minimize_OVRS", "false")
	EndIf
EndFunc

Func _Checkbox_StopHTCS_on_StartUp()
	$Status_Checkbox = GUICtrlRead($Checkbox_StopHTCS_on_StartUp)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "StopHTCS_on_StartUp", "true")
		MsgBox(0, "Attention", "VIVEHIM needs to be started as Admin to be able to stop Processes and Services." & @CRLF & "Use 'StartVIVEHIM_AsAdmin.exe' in VIVEHIM install folder.", 10)
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "StopHTCS_on_StartUp", "false")
	EndIf
EndFunc


Func _idRadio_1()
	IniWrite($config_ini, "Settings", "IDRadio", "1")
EndFunc

Func _idRadio_2()
	IniWrite($config_ini, "Settings", "IDRadio", "2")
	IniWrite($config_ini, "Settings", "ShowPlayerOnline", "false")
	IniWrite($config_ini, "Settings", "FB_Check", "true")
	GUICtrlSetState($Checkbox_FB_Check, $GUI_CHECKED)
EndFunc

Func _idRadio_3()
	IniWrite($config_ini, "Settings", "IDRadio", "3")
	IniWrite($config_ini, "Settings", "ShowPlayerOnline", "true")
	IniWrite($config_ini, "Settings", "FB_Check", "false")
	GUICtrlSetState($Checkbox_FB_Check, $GUI_UNCHECKED)
	GUICtrlSetState($Checkbox_USE_FB_GUI, $GUI_UNCHECKED)
EndFunc

Func _idRadio_4()
	IniWrite($config_ini, "Settings", "IDRadio", "4")
EndFunc


Func _Button_ADD_Group()
	$DragandDrop_Name = GUICtrlRead($SelectGroup_DropDown)
	_Create_Groups_INI()
	_Write_Steam_Groups()
	_Tab()
	_GUICtrlStatusBar_SetText($Statusbar, "Group added....VIVEHIM will be restarted..." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	Sleep(1000)
	_Create_ListViews_TAB_3()
	;_Restart()
EndFunc

Func _Button_Save_GroupName()
	$GameName_DropDown = GUICtrlRead($SelectGroup_DropDown)
	$GameName_Input = GUICtrlRead($Input_Group_Name)

	For $LOOP_CheckContent_9 = 1 To 10
		$Group_TEMP = IniRead($Config_INI, "Groups", "Group_" & $LOOP_CheckContent_9, "")
		If $Group_TEMP = $GameName_DropDown Then $Selected_Group_NR = $LOOP_CheckContent_9
	Next

	IniWrite($Config_INI, "Groups", "Group_" & $Selected_Group_NR, $GameName_Input)

	_Update_Group_DropDown()
	_Tab()
	_GUICtrlStatusBar_SetText($Statusbar, "Group Name saved." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
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


Func _Button_Backup_WidgetPreferences_json()
	If Not FileExists($VIVEHIM_WidgetPreferences_folder & "BackupWP.json") Then
		FileCopy($VIVE_HOME_VRAPP_Folder & "WidgetPreferences.json", $VIVEHIM_WidgetPreferences_folder & "BackupWP.json", $FC_OVERWRITE + $FC_CREATEPATH)
		_GUICtrlStatusBar_SetText($Statusbar, "BackupWP File created." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	Else

		$Abfrage = MsgBox (4, "BACKUP", "Backup File already exist." & @CRLF & @CRLF & _
										"Do you really want to overwrite existing Backup File with the new one?" & @CRLF)

		If $Abfrage = 6 Then
			FileCopy($VIVE_HOME_VRAPP_Folder & "WidgetPreferences.json", $VIVEHIM_WidgetPreferences_folder & "BackupWP.json", $FC_OVERWRITE + $FC_CREATEPATH)
			_GUICtrlStatusBar_SetText($Statusbar, "BackupWP File created [overwritten]." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
		Else
			_GUICtrlStatusBar_SetText($Statusbar, "BackupWP File not created." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
		EndIf

	EndIf
EndFunc

Func _Button_Rename_WidgetPreferences_json()
	Local $Old_Name = GUICtrlRead($Select_WidgetPreferences_DropDown)

	$Abfrage = MsgBox (4, "Attention", "Do you really want to rename selected 'WidgetPreferences.json' File?" & @CRLF)

	If $Abfrage = 6 Then
		Local $New_Name = InputBox ( "Enter new Name", "Old Name: " & StringTrimRight($Old_Name, 5) & @CRLF & @CRLF & "Enter new Name and continue.")
		If StringRight($New_Name, 5) <> ".json" Then $New_Name = $New_Name & ".json"
		FileMove($VIVEHIM_WidgetPreferences_folder & $Old_Name, $VIVEHIM_WidgetPreferences_folder & $New_Name, $FC_OVERWRITE + $FC_CREATEPATH)
		_GUICtrlStatusBar_SetText($Statusbar, "Name changed. " & $Old_Name & " to " & $New_Name & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
		_Update_Select_WidgetPreferences_DropDown()
	Else
		_GUICtrlStatusBar_SetText($Statusbar, "Name not changed" & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf
EndFunc

Func _Button_AddNew_WidgetPreferences_json()
	Local $WidgetPreference = GUICtrlRead($Select_WidgetPreferences_DropDown)

	$Abfrage = MsgBox (4, "Attention", "Do you really want to add selected/new 'WidgetPreferences.json' File?" & @CRLF)

	If $Abfrage = 6 Then
		FileCopy($VIVEHIM_WidgetPreferences_folder & $WidgetPreference, $VIVE_HOME_VRAPP_Folder & "WidgetPreferences.json", $FC_OVERWRITE + $FC_CREATEPATH)
		_GUICtrlStatusBar_SetText($Statusbar, "New/Selected 'WidgetPreferences.json' File added." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	Else
		_GUICtrlStatusBar_SetText($Statusbar, "'WidgetPreferences.json' File not added." & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
	EndIf
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

Func _Checkbox_Overwrite_ApplicationList_INI_on_StartUp()
	$Status_Checkbox = GUICtrlRead($Checkbox_Overwrite_ApplicationList_INI_on_StartUp)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Overwrite_ApplicationList_INI_on_StartUp", "true")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Overwrite_ApplicationList_INI_on_StartUp", "false")
	EndIf
EndFunc

Func _Checkbox_AutoDownload_Missing_Icons()
	$Status_Checkbox = GUICtrlRead($Checkbox_AutoDownload_Missing_Icons)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "AutoDownload_Missing_Icons", "true")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "AutoDownload_Missing_Icons", "false")
	EndIf
EndFunc

Func _Checkbox_FB_Check()
	$Status_Checkbox = GUICtrlRead($Checkbox_FB_Check)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "FB_Check", "true")
		IniWrite($config_ini, "Settings", "ShowPlayerOnline", "false")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "FB_Check", "false")
	EndIf
EndFunc

Func _Checkbox_USE_FB_GUI()
	$Status_Checkbox = GUICtrlRead($Checkbox_USE_FB_GUI)

	If $Status_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "USE_FB_GUI", "true")
		GUICtrlSetState($Checkbox_FB_Check, $GUI_CHECKED)
		GUICtrlSetImage($USE_FB_GUI_Image, $gfx & "FB_Window.jpg")
	EndIf

	If $Status_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "USE_FB_GUI", "false")
		GUICtrlSetImage($USE_FB_GUI_Image, $gfx & "FB_Window_false.jpg")
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
	$Status_Checkbox_AutoDownload_Missing_Icons = IniRead($config_ini,"Settings", "AutoDownload_Missing_Icons", "")
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

		$Anzeige_Spalte = IniRead($ApplicationList_INI, "Application_" & $aRow[1], "right_now", "")
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 3)


		$Anzeige_Spalte = $aRow[9]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 4)
		If $Status_Checkbox_AutoDownload_Missing_Icons = "true" Then
			If Not FileExists($aRow[9]) Then
				$Missing_Steam_app_Name = $Application_App_Name
				$Missing_Steam_app_ID = $aRow[1]
				_Download_Icon_for_SteamID()
			EndIf
		EndIf
		$ApplicationNR_TEMP = IniRead($ApplicationList_INI, "Application_" & $aRow[1], "NR", "")
		IniWrite($ApplicationList_INI, "Application_" & $aRow[1], "IconPath", $aRow[9])
		IniWrite($ApplicationList_INI, "Application_" & $ApplicationNR_TEMP, "IconPath", $aRow[9])

		$Anzeige_Spalte = $aRow[2]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 5)

		$Anzeige_Spalte = $aRow[3]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 6)

		$Anzeige_Spalte = $aRow[4]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 7)

		$Anzeige_Spalte = $aRow[5]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 8)
		If $Anzeige_Spalte = "1" Then
			IniWrite($ApplicationList_INI, "Application_" & $aRow[1], "IsFavorite", "true")
			_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 1)
			_GUICtrlListView_SetItemChecked($listview, $Ebene_temp)
		Else
			_GUICtrlListView_SetItemImage($listview, $Ebene_temp, 0)
		EndIf

		$Anzeige_Spalte = $aRow[6]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 9)

		$Anzeige_Spalte = $aRow[7]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 10)

		$Anzeige_Spalte = $aRow[8]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 11)

		$Anzeige_Spalte = $aRow[10]
		_GUICtrlListView_AddSubItem($ListView, $Ebene_temp, $Anzeige_Spalte, 12)

	$ApplicationNR_TEMP = ""

	Next

	_GUICtrlListView_EndUpdate($ListView)

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()
EndFunc

Func _Search_Files()
	Local $s_LocalFolder = $VIVE_HOME_ApplicationList_Folder
	Local $FileList = _FileListToArray($s_LocalFolder , "*.appinfo" , 1)
	$Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp = IniRead($config_ini,"Settings", "Overwrite_ApplicationList_INI_on_StartUp", "")
	Local $Check_NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	If Not FileExists($ApplicationList_INI) Then $Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp = "true"

	If $Status_Checkbox_Overwrite_ApplicationList_INI_on_StartUp = "true" Then
		If $FileList <> "" Then
			FileDelete($ApplicationList_INI)
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
	Else
		If $FileList[0] > $Check_NR_Applications Then
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
		EndIf
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

Func _Create_TreeView()
	$NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")
	If $NR_Applications = "" Then $NR_Applications = 1

	For $I = 0 To $NR_Applications
		$AppNR = IniRead($ApplicationList_INI, "Application_" & $I, "NR", "")
		$AppName = IniRead($ApplicationList_INI, "Application_" & $I, "Name", "")
		$AppId = IniRead($ApplicationList_INI, "Application_" & $I, "AppId", "")
		$AppIsFavorite = IniRead($ApplicationList_INI, "Application_" & $AppId, "IsFavorite", "")
		$App_PO_right_now = IniRead($ApplicationList_INI, "Application_" & $I, "right_now", "")
		$App_PO_24h_peak = IniRead($ApplicationList_INI, "Application_" & $I, "24h_peak", "")
		$App_PO_all_time_peak = IniRead($ApplicationList_INI, "Application_" & $I, "all_time_peak", "")

		If $AppName <> "" Then Global $id_CreateTreeViewItem = GUICtrlCreateTreeViewItem($AppName, $idTreeView)
		GUICtrlSetOnEvent($id_CreateTreeViewItem, "_Change_Preview_Icon_Desktop_APP")

			If $AppNR <> "" Then $id_TreeViewItem_AppKey = GUICtrlCreateTreeViewItem("App NR:" & "               " & $AppNR, $id_CreateTreeViewItem)
			If $AppNR <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_AppKey, "_Create_HTMLView_GUI")
			If $AppName <> "" Then $id_TreeViewItem_AppNameAppName = GUICtrlCreateTreeViewItem("App Name:" & "         " & $AppName, $id_CreateTreeViewItem)
			If $AppName <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_AppNameAppName, "_Create_HTMLView_GUI")
			If $AppId <> "" Then $id_TreeViewItem_AppId = GUICtrlCreateTreeViewItem("App ID:" & "                " & $AppId, $id_CreateTreeViewItem)
			If $AppId <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_AppId, "_Create_HTMLView_GUI")
			If $AppIsFavorite <> "" Then $id_TreeViewItem_AppIsFavorite = GUICtrlCreateTreeViewItem("App Is Favorite:" & "  " & $AppIsFavorite, $id_CreateTreeViewItem)
			If $AppIsFavorite <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_AppIsFavorite, "_Create_HTMLView_GUI")
			If $AppIsFavorite = "" Then $id_TreeViewItem_AppIsFavorite = GUICtrlCreateTreeViewItem("App Is Favorite:" & "  " & "false", $id_CreateTreeViewItem)
			If $AppIsFavorite = "" Then GUICtrlSetOnEvent($id_TreeViewItem_AppIsFavorite, "_Create_HTMLView_GUI")
			If $App_PO_right_now <> "" Then $id_TreeViewItem_App_PO_right_now = GUICtrlCreateTreeViewItem("Players Online right now:" & "       " & $App_PO_right_now, $id_CreateTreeViewItem)
			If $App_PO_right_now <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_App_PO_right_now, "_Create_HTMLView_GUI")
			If $App_PO_24h_peak <> "" Then $id_TreeViewItem_App_PO_24h_peak = GUICtrlCreateTreeViewItem("Players Online 24h peak:" & "         " & $App_PO_24h_peak, $id_CreateTreeViewItem)
			If $App_PO_24h_peak <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_App_PO_24h_peak, "_Create_HTMLView_GUI")
			If $App_PO_all_time_peak <> "" Then $id_TreeViewItem_App_PO_all_time_peak = GUICtrlCreateTreeViewItem("Players Online all time peak:" & "  " & $App_PO_all_time_peak, $id_CreateTreeViewItem)
			If $App_PO_all_time_peak <> "" Then GUICtrlSetOnEvent($id_TreeViewItem_App_PO_all_time_peak, "_Create_HTMLView_GUI")
	Next
EndFunc

Func _Create_HTMLView_GUI()
	Local $Button_Exit_HTML_GUI, $TreeView_Steam_app_NR, $TreeView_Steam_app_Name, $TreeView_Steam_app_ID, $TreeView_Steam_app_IS_Favorite
	Local $TreeView_Steam_app_PO_right_now, $TreeView_Steam_app_PO_24h_peak, $TreeView_Steam_app_PO_all_time_peak, $Text_SplitNR
	Local $Handle_2, $Text_2

	Local $ID = GUICtrlRead($idTreeView)
	$ID = $ID
	Local $Handle = _GUICtrlTreeView_GetItemHandle($idTreeView, $ID)
	Local $Text = _GUICtrlTreeView_GetText($idTreeView, $Handle)

	$Text_SplitNR = StringInStr($Text, ':')
	$Text = StringLeft($Text, $Text_SplitNR)

	If $Text = "App NR:" Then $ID = $ID + 2
	If $Text = "App Name:" Then $ID = $ID + 1
	If $Text = "App ID" Then $ID = $ID
	If $Text = "App Is Favorite:" Then $ID = $ID - 1
	If $Text = "Players Online right now:" Then $ID = $ID - 2
	If $Text = "Players Online 24h peak:" Then $ID = $ID - 3
	If $Text = "Players Online all time peak:" Then $ID = $ID - 4

	$Handle_2 = _GUICtrlTreeView_GetItemHandle($idTreeView, $ID)
	$Text_2 = _GUICtrlTreeView_GetText($idTreeView, $Handle_2)

	$TreeView_Steam_app_ID = StringReplace($Text_2, 'App ID:', '')
	$TreeView_Steam_app_ID = StringReplace($TreeView_Steam_app_ID, ' ', '')
	$TreeView_Game_ID = StringReplace($TreeView_Steam_app_ID, 'steam.app.' , '')
	$TreeView_Steam_app_Name = IniRead($ApplicationList_INI, "Application_" & $TreeView_Steam_app_ID, "Name", "")

	$oIE = ObjCreate("Shell.Explorer.2")

	$HTML_GUI = GUICreate($TreeView_Steam_app_Name & " - " & $TreeView_Game_ID, 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUICtrlCreateObj($oIE, 0, 0, 979, 550)

	Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 940, 560, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_HTML_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit2.bmp")
	GuiCtrlSetTip(-1, "Closes HTML GUI.")

	$IE_Adresse = "https://steamdb.info/app/" & $TreeView_Game_ID & "/graphs/"
	$oIE.navigate($IE_Adresse)

	GUISetState()
	$TreeView_Game_ID = ""
EndFunc

Func _Button_Exit_HTML_GUI()
	GUIDelete($HTML_GUI)
EndFunc

Func _Create_ListViews_TAB_3()
	_GUICtrlListView_DeleteAllItems($Available_Games_ListView)
	_GUICtrlListView_DeleteAllItems($Current_Shortcuts_ListView)
	_GUICtrlListView_DeleteAllItems($Current_Groups_ListView)

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

			If $GroupWidgetName <> "" Then
				If $GroupWidgetUID = "htc_widget_photo_frame" Then $GroupWidgetName = "* " & $GroupWidgetName
				If $GroupWidgetUID = "htc_widget_app_shortcut" Then $GroupWidgetName = "# " & $GroupWidgetName
				If $GroupWidgetUID = "htc_widget_portal" Then $GroupWidgetName = "- " & $GroupWidgetName & " -"
				$Content_Current_Groups_ListView[$LOOP_Content_3 - 1] = $GroupName
				GUICtrlCreateListViewItem($GroupWidgetName, $Current_Groups_ListView)
			EndIf
	Next

	;$ProcessBar_Status = 100
	;GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
EndFunc

Func _Update_Group_DropDown()
	GUICtrlSetData($SelectGroup_DropDown, "", "Choose Group")
	$Group_1 = IniRead($Config_INI, "Groups", "Group_1", "")
	$Group_2 = IniRead($Config_INI, "Groups", "Group_2", "")
	$Group_3 = IniRead($Config_INI, "Groups", "Group_3", "")
	$Group_4 = IniRead($Config_INI, "Groups", "Group_4", "")
	$Group_5 = IniRead($Config_INI, "Groups", "Group_5", "")
	$Group_6 = IniRead($Config_INI, "Groups", "Group_6", "")
	$Group_7 = IniRead($Config_INI, "Groups", "Group_7", "")
	$Group_8 = IniRead($Config_INI, "Groups", "Group_8", "")
	$Group_9 = IniRead($Config_INI, "Groups", "Group_9", "")
	$Group_10 = IniRead($Config_INI, "Groups", "Group_10", "")

	GUICtrlSetData($SelectGroup_DropDown, "Choose Group" & "|" & $Group_1 & "|" & $Group_2 & "|" & $Group_3 & "|" & $Group_4 & "|" & $Group_5 & "|" & $Group_6 & "|" & $Group_7 & "|" & $Group_8 & "|" & $Group_9 & "|" & $Group_10, "Choose Group")
	GUICtrlSetFont($SelectGroup_DropDown, 11, 400, 1, $font_arial)
EndFunc

Func _Update_Select_WidgetPreferences_DropDown()
	Local $s_LocalFolder_WP = $VIVEHIM_WidgetPreferences_folder
	Local $FileList = _FileListToArray($s_LocalFolder_WP , "*.json" , 1)

	If $FileList <> 0 Then
		GUICtrlSetData($Select_WidgetPreferences_DropDown, "", "Choose File")
		Global $WidgetPreferences_Data = ""

		For $LOOP_DropDown = 1 To $FileList[0]
			$WidgetPreferences_Data = $WidgetPreferences_Data & "|" & $FileList[$LOOP_DropDown]
			If $LOOP_DropDown = 1 Then $WidgetPreferences_Data = "Choose File" & "|" & $FileList[$LOOP_DropDown]
		Next

		GUICtrlSetData($Select_WidgetPreferences_DropDown, $WidgetPreferences_Data, "Choose File")
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
	$Icons_DIR_1 = $Install_Folder_VIVE_Software & "Updater\App\Dashboard\win32\header_image\"
	$Icons_DIR_2 = $Install_DIR & "Icons\"
	$Icons_DIR_3 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_1", "")
	$Icons_DIR_4 = IniRead($Config_INI, "Folders", "Custom_Icon_Folder_2", "")

	$Check_idRadio_ImagePath = IniRead($config_ini, "Settings", "IconPath", "")
	If $Check_idRadio_ImagePath = "" Then IniWrite($config_ini, "Settings", "IconPath", "2")
	If $Check_idRadio_ImagePath = "" Then $Check_idRadio_ImagePath = 2

	If $Check_idRadio_ImagePath = "" Then $Icons_DIR = $Icons
	If $Check_idRadio_ImagePath = "1" Then $Icons_DIR = $Icons_DIR_1
	If $Check_idRadio_ImagePath = "2" Then $Icons_DIR = $Icons_DIR_2
	If $Check_idRadio_ImagePath = "3" Then $Icons_DIR = $Icons_DIR_3
	If $Check_idRadio_ImagePath = "4" Then $Icons_DIR = $Icons_DIR_4

	$ApplicationName = $Missing_Steam_app_Name
	$Application_ID = $Missing_Steam_app_ID
	$Application_IDNR = StringReplace($Application_ID, 'steam.app.', '')

	$Download_Icon_path_jpg = $Icons_DIR & "steam.app." & $Application_IDNR & '.jpg'
	If $Check_idRadio_ImagePath = "1" Then $Download_Icon_path_jpg = $Icons_DIR_1 & $Application_IDNR & '_header' & '.jpg'

	$Steam_Check = StringLeft($Application_ID, 5)

	If $Steam_Check = "steam" Then
		$URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_IDNR & '/header.jpg'
		InetGet($URL, $Download_Icon_path_jpg, 16, 0)
	EndIf

	;If Not FileExists($Download_Icon_path_jpg) Then


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
	_GUICtrlStatusBar_SetText($Statusbar, "WORKING, please wait..." & @TAB & @TAB & "'...Adding new Icon path'")

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

		$Check_SteamName = IniRead($ApplicationList_INI, "Application_" & $aRow[1], "Name", "")
		If $Check_SteamName = "1_ViveHome" Then
			$New_Icon_URL = ""
			$New_Icon_Path = $Icons_DIR_2 & $Check_SteamName & ".jpg"
		EndIf

		If $aRow[1] = "htc.vive.home" Then
			$New_Icon_URL = ""
			$New_Icon_Path = ""
		EndIf

		_SQLite_Exec($VIVE_Home_DB, "REPLACE INTO " & $VIVE_Home_DB_TABLE_Name & "(rowid,app_key,launch_count,last_launched,total_played,is_favorite,installed_time,img_url,img_timestamp,img_file_path,img_fetch_time) VALUES ('" & _
									$aRow[0] & "','" & $aRow[1] & "','" & $aRow[2] & "','" & $aRow[3] & "','" & $aRow[4] & "','" & $aRow[5] & "','" & $aRow[6] & "','" & $New_Icon_URL & "','" & $aRow[8] & "','" & $New_Icon_Path & "','" & $aRow[10] & "');")

		_GUICtrlStatusBar_SetText($Statusbar, "WORKING, Adding new Icon path...please wait..." & @TAB & @TAB & $aRow[1])
		$ProcessBar_Status = $NR * 100 / $iRows - 1
		$ProcessBar_Status = $ProcessBar_Status
		MsgBox(0, "", $ProcessBar_Status)
		GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
	Next

	_SQLite_QueryFinalize($hQuery)
	_SQLite_Close($VIVE_HOME_VRAPP_Folder & "vive.sqlite")
	_SQLite_Shutdown()

	_Read_from_VIVEHOME_DB()
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	Sleep(500)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "New Icon path added" & @TAB & @TAB & "'VIVE HOME Icon Manager - Version " & $Version & "'")
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
	$StartedAsAdmin = IniRead($Config_INI, "TEMP", "StartedAsAdmin", "")

	FileDelete($Shortcuts_INI)
	FileDelete(@ScriptDir & "\" & "PlayersOnline.jpg")

	If $StartedAsAdmin = "true" Then
		If FileExists($Install_DIR & "StartVIVEHIM_AsAdmin.exe") Then
			ShellExecute($Install_DIR & "StartVIVEHIM_AsAdmin.exe")
		Else
			ShellExecute($Install_DIR & "StartVIVEHIM_AsAdmin.au3")
		EndIf
	Else
		If FileExists($Install_DIR & "StartVIVEHIM.exe") Then
			ShellExecute($Install_DIR & "StartVIVEHIM.exe")
		Else
			ShellExecute($Install_DIR & "StartVIVEHIM.au3")
		EndIf
	EndIf
	Exit
EndFunc

Func _Beenden()
	FileDelete($Shortcuts_INI)
	FileDelete(@ScriptDir & "\" & "PlayersOnline.jpg")
	IniWrite($config_ini, "TEMP", "StartedAsAdmin", "")
	IniWrite($config_ini, "TEMP", "TEMP_1", "")
	IniWrite($config_ini, "TEMP", "TEMP_2", "")
	IniWrite($config_ini, "TEMP", "TEMP_3", "")
	Exit
EndFunc

#endregion