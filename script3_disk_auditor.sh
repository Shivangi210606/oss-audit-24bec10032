#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Shivangi Panigrahy | Reg No: 24BEC10032
# Course: Open Source Software | Chosen Software: LibreOffice
# Description: Loops through system directories and reports
#              disk usage, owner, and permissions for each.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/libreoffice")

# --- LibreOffice-specific config directory (per-user) ---
LO_USER_CONFIG="$HOME/.config/libreoffice"

# --- System-wide LibreOffice installation directory ---
LO_INSTALL_DIR="/usr/lib/libreoffice"

echo "============================================================"
echo "          DISK AND PERMISSION AUDITOR                       "
echo "============================================================"
echo ""
echo "  Format: PERMISSIONS | OWNER | GROUP | SIZE | PATH"
echo "------------------------------------------------------------"

# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then
        # awk extracts: field1=permissions, field3=owner, field4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # du gets disk usage; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  $PERMS | $OWNER | $GROUP | ${SIZE:-N/A} | $DIR"
    else
        # Directory does not exist on this system
        echo "  [NOT FOUND] $DIR does not exist on this system"
    fi
done

echo ""
echo "------------------------------------------------------------"
echo "  LIBREOFFICE CONFIG DIRECTORY AUDIT"
echo "------------------------------------------------------------"

# --- Check LibreOffice user config directory ---
if [ -d "$LO_USER_CONFIG" ]; then
    LO_PERMS=$(ls -ld "$LO_USER_CONFIG" | awk '{print $1}')
    LO_OWNER=$(ls -ld "$LO_USER_CONFIG" | awk '{print $3}')
    LO_SIZE=$(du -sh "$LO_USER_CONFIG" 2>/dev/null | cut -f1)
    echo "  User Config   : $LO_USER_CONFIG"
    echo "  Permissions   : $LO_PERMS"
    echo "  Owner         : $LO_OWNER"
    echo "  Size          : ${LO_SIZE:-N/A}"
    echo ""
    echo "  Why this matters: LibreOffice stores user profiles here."
    echo "  Only the user ($LO_OWNER) should have write access."
    echo "  This protects personal macros, settings, and templates."
else
    echo "  User config dir not found: $LO_USER_CONFIG"
    echo "  (LibreOffice may not be installed or never opened.)"
fi

echo ""
# --- Check system-wide LibreOffice installation ---
if [ -d "$LO_INSTALL_DIR" ]; then
    INST_PERMS=$(ls -ld "$LO_INSTALL_DIR" | awk '{print $1}')
    INST_OWNER=$(ls -ld "$LO_INSTALL_DIR" | awk '{print $3}')
    INST_SIZE=$(du -sh "$LO_INSTALL_DIR" 2>/dev/null | cut -f1)
    echo "  System Install: $LO_INSTALL_DIR"
    echo "  Permissions   : $INST_PERMS"
    echo "  Owner         : $INST_OWNER"
    echo "  Size          : ${INST_SIZE:-N/A}"
    echo ""
    echo "  Why this matters: Root-owned installation prevents"
    echo "  unprivileged users from tampering with binaries."
else
    echo "  System install dir not found: $LO_INSTALL_DIR"
    echo "  (Try: /usr/share/libreoffice or /opt/libreoffice)"
fi

echo "============================================================"
