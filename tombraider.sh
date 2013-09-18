#!/bin/bash
# Date : (2013-09-17 22-00)
# Last revision : (2013-09-17 22-00)
# Wine version used : 1.5.25
# Distribution used to test : Linux Mint 15 (xfce) 
# Author : Dason Kurkiewicz dasonk@gmail.com
# Script licence : GPL v.2
# Program licence : Retail
# Depend :
 
[ -z "$PLAYONLINUX" ] && exit 0
source "$PLAYONLINUX/lib/sources"
 
GOGID="tomb_raider_123"
PREFIX="tombraider"
WORKING_WINE_VERSION="1.5.25"
 
TITLE="GOG - Tomb Raider 1-3"
SHORTCUT_NAME="Tomb Raider 1-3"
 
POL_SetupWindow_Init
#POL_SetupWindow_SetID 1518
POL_Debug_Init
 
POL_SetupWindow_presentation "$TITLE" "Core Design / Square Enix" "http://www.gog.com/gamecard/$GOGID" "Dason Kurkiewicz" "$PREFIX"
 
POL_Call POL_GoG_setup "$GOGID" "47d080fcf0d106403b016952c429ba5c"
 
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WORKING_WINE_VERSION"
 
# fake sdbinst.exe
POL_Call POL_Install_nop "$WINEPREFIX/drive_c/windows/system32/sdbinst.exe"
# Need for install to work
POL_Call POL_Install_gdiplus
 
POL_Call POL_GoG_install
 
# GoG work!
Set_OS winxp
 
#POL_SetupWindow_VMS "2"
 
# http://appdb.winehq.org/objectManager.php?sClass=version&iId=24425
Set_Managed "Off"
 
# Doesn't hurt ;)
POL_Wine_reboot

POL_Shortcut "tomb.exe" "Tomb Raider 1"
POL_Shortcut "Tomb2.exe" "Tomb Raider 2"
POL_Shortcut "tomb3.exe" "Tomb Raider 3"

POL_SetupWindow_Close
 
exit 0
