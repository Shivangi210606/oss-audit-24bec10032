#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Shivangi Panigrahy | Reg No: 24BEC10032
# Course: Open Source Software | Chosen Software: LibreOffice
# Description: Displays a welcome screen with key system info
# ============================================================

# --- Student and project variables ---
STUDENT_NAME="Shivangi Panigrahy"
REG_NUMBER="24BEC10032"
SOFTWARE_CHOICE="LibreOffice"
SOFTWARE_LICENSE="Mozilla Public License 2.0 (MPL 2.0)"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                         # Linux kernel version
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Distro name
USER_NAME=$(whoami)                        # Currently logged-in user
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')       # Current date (e.g. Monday, 01 January 2025)
CURRENT_TIME=$(date '+%H:%M:%S')           # Current time in HH:MM:SS

# --- Linux OS license note ---
# The Linux kernel itself is licensed under GPL v2 (GNU General Public License version 2)
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display the identity report ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT         "
echo "============================================================"
echo ""
echo "  Student  : $STUDENT_NAME"
echo "  Reg No   : $REG_NUMBER"
echo "  Project  : Auditing $SOFTWARE_CHOICE ($SOFTWARE_LICENSE)"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  LICENSE NOTE"
echo "------------------------------------------------------------"
echo "  This operating system (Linux kernel) is covered by:"
echo "  $OS_LICENSE"
echo ""
echo "  This means you are free to: run, study, share, and"
echo "  modify it. Any modifications you distribute must also"
echo "  remain open source under the same license."
echo "============================================================"
