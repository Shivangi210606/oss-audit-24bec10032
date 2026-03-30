# OSS Audit — LibreOffice

**Student Name:** Shivangi Panigrahy
**Registration Number:** 24BEC10032
**Course:** Open Source Software
**Chosen Software:** LibreOffice
**Date of Submission:** 31 March 2026

---

## About This Project

This repository is a capstone audit of **LibreOffice**, a free and open-source office suite maintained by The Document Foundation. The project examines LibreOffice's origin story, its Mozilla Public License 2.0, its Linux footprint, its FOSS ecosystem, and how it compares to Microsoft Office.

The repository contains five shell scripts that demonstrate practical Linux and shell scripting skills, each connected to the themes of open source, transparency, and automation.

---

## Repository Contents

| File | Description |
|---|---|
| `script1_system_identity.sh` | Displays a system welcome screen with kernel, distro, user, uptime, and date |
| `script2_package_inspector.sh` | Checks if LibreOffice is installed, shows version/license, prints philosophy note |
| `script3_disk_auditor.sh` | Audits key system directories for permissions, ownership, and disk usage |
| `script4_log_analyzer.sh` | Reads a log file, counts keyword matches, shows last 5 matching lines |
| `script5_manifesto_generator.sh` | Interactively generates a personalised open source philosophy statement |

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Fedora, Debian, or any major distro)
- Bash shell (pre-installed on all Linux systems)
- LibreOffice installed (for Script 2 and Script 3 to show full output)

To install LibreOffice on Ubuntu/Debian:
```bash
sudo apt update && sudo apt install libreoffice
```

To install LibreOffice on Fedora/RHEL:
```bash
sudo dnf install libreoffice
```

---

### Script 1 — System Identity Report
Displays a formatted welcome screen with system information.

```bash
bash script1_system_identity.sh
```

**Expected output:** Distribution name, kernel version, logged-in user, home directory, uptime, current date and time, and the OS license.

---

### Script 2 — FOSS Package Inspector
Checks whether LibreOffice is installed and prints its details and a philosophy note.

```bash
bash script2_package_inspector.sh
```

**Expected output:** Installation status, version, license, summary, and a contextual open source philosophy message.

---

### Script 3 — Disk and Permission Auditor
Loops through important system directories and reports permissions, ownership, and disk usage.

```bash
bash script3_disk_auditor.sh
```

**Expected output:** A table of directories with their permissions, owner, group, and size. Also audits LibreOffice's config and installation directories specifically.

---

### Script 4 — Log File Analyzer
Reads a log file and counts how many lines contain a given keyword.

```bash
bash script4_log_analyzer.sh /var/log/syslog error
```

**Arguments:**
- `$1` — Path to the log file (e.g. `/var/log/syslog`)
- `$2` — Keyword to search for (default: `error` if not provided)

**Expected output:** Total count of matching lines and the last 5 matching lines printed to the terminal.

---

### Script 5 — Open Source Manifesto Generator
Asks three interactive questions and generates a personalised open source philosophy statement saved to a `.txt` file.

```bash
bash script5_manifesto_generator.sh
```

**Expected output:** Prompts for three answers, composes a paragraph from them, saves it to `manifesto_<username>.txt`, and displays it on screen.

---

## Dependencies

| Dependency | Used In | How to Install |
|---|---|---|
| `bash` | All scripts | Pre-installed on Linux |
| `libreoffice` | Scripts 2, 3 | `sudo apt install libreoffice` |
| `rpm` or `dpkg` | Script 2 | Pre-installed on RPM/Debian systems |
| `awk`, `grep`, `du`, `df` | Scripts 3, 4 | Pre-installed on all Linux systems |

---

## License

This project was created for academic purposes as part of the Open Source Software course. The shell scripts are released under the MIT License — free to use, share, and modify.
