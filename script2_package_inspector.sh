#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Shivangi Panigrahy | Reg No: 24BEC10032
# Course: Open Source Software | Chosen Software: LibreOffice
# Description: Checks if a FOSS package is installed, shows
#              its version/license, and prints a philosophy note
# ============================================================

# --- Set the package to inspect ---
# LibreOffice is typically split into components; libreoffice-common
# is the base package. Adjust for your distro if needed.
PACKAGE="libreoffice"

# --- Check if running on RPM-based or Debian-based system ---
# This makes the script portable across distros
if command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
elif command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
else
    echo "Error: No supported package manager (rpm/dpkg) found."
    exit 1
fi

echo "============================================================"
echo "          FOSS PACKAGE INSPECTOR                            "
echo "============================================================"
echo "  Package Manager Detected: $PKG_MANAGER"
echo "  Checking for package    : $PACKAGE"
echo "------------------------------------------------------------"

# --- Check if the package is installed using if-then-else ---
if [ "$PKG_MANAGER" = "rpm" ]; then
    # RPM-based check (Fedora, RHEL, CentOS)
    if rpm -q $PACKAGE &>/dev/null; then
        echo "  STATUS: $PACKAGE is INSTALLED."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # Use grep with pipe to extract only the relevant fields
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary|URL'
    else
        echo "  STATUS: $PACKAGE is NOT installed."
        echo "  To install, run: sudo dnf install libreoffice"
    fi

elif [ "$PKG_MANAGER" = "dpkg" ]; then
    # Debian/Ubuntu-based check
    if dpkg -l $PACKAGE &>/dev/null 2>&1 | grep -q "^ii"; then
        echo "  STATUS: $PACKAGE is INSTALLED."
        echo ""
        echo "  Package Details:"
        echo "  ----------------"
        # dpkg -l gives installed version; -s gives full details
        dpkg -s $PACKAGE 2>/dev/null | grep -E 'Version|Maintainer|Homepage|Description'
    else
        echo "  STATUS: $PACKAGE is NOT installed."
        echo "  To install, run: sudo apt install libreoffice"
    fi
fi

echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTES"
echo "------------------------------------------------------------"

# --- Case statement: print a philosophy note based on package name ---
case $PACKAGE in
    libreoffice)
        echo "  LibreOffice: Born from a community fork of OpenOffice.org in"
        echo "  2010, LibreOffice proves that when a community disagrees with"
        echo "  a corporation's direction, open source gives them the power"
        echo "  to take back control and continue the work themselves."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that helped build the open internet."
        echo "  Licensed under Apache 2.0, it allows commercial use freely."
        ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        echo "  MariaDB was itself a fork created when Oracle acquired MySQL."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's browser defending the open web against"
        echo "  corporate monopoly — freedom as a product feature."
        ;;
    git)
        echo "  Git: Linus Torvalds built this when proprietary tools failed"
        echo "  him. Shared freely — now used by every developer on Earth."
        ;;
    python3|python)
        echo "  Python: A language shaped entirely by community consensus."
        echo "  The PSF license is permissive — knowledge belongs to all."
        ;;
    *)
        # Default case: package not in our known list
        echo "  $PACKAGE: An open-source tool whose freedom to use, modify,"
        echo "  and share makes the global software ecosystem possible."
        ;;
esac

echo "============================================================"
