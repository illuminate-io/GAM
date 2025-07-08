# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains Google Admin Console (GAM) administration scripts for managing Google Workspace users and groups at Santa Fe School. The scripts use GAMADV-XTD3 to automate common administrative tasks including user management, group synchronization, and organizational unit operations.

## Commands

### GAM Binary Location
All scripts reference the GAM binary at: `/home/isaac/bin/gamadv-xtd3/gam7/gam` (Multi-Script.sh) or `/home/isaac/bin/gamadv-xtd3/gam` (other scripts)

### Running Scripts
- `./Multi-Script.sh` - Main interactive admin tool for user management
- `./Disable-User.sh` - Disable/suspend individual users
- `./PrintGroupMembers.sh` - Export group membership to CSV
- `./Student-OU-Sync.sh` - Sync students to organizational units and groups
- `./GROUPS/groups-script.sh` - Advanced group management with configurable graduation years
- `./Suspend\ Users\ in\ Bulk/Account\ Action\ -\ Suspend\ Students\ in\ Bulk.sh` - Bulk suspend students from CSV

### No Build/Test/Lint Commands
This is a collection of shell scripts with no build system, test framework, or linting configured.

## Architecture

### Core Components

1. **Multi-Script.sh** - Main administrative interface
   - Interactive menu-driven tool for common user admin tasks
   - Handles user group membership, password resets, suspensions, and offboarding
   - Supports student, staff, and family user types
   - Includes annual grade year shift functionality

2. **GROUPS/ Directory** - Advanced group management
   - `config.sh` - Configuration file with graduation year setting
   - `groups-script.sh` - Sophisticated group sync with grade-based calculations
   - Uses associative arrays for organizational units, managers, and group mappings

3. **Individual Admin Scripts**
   - `Disable-User.sh` - Single user suspension workflow
   - `PrintGroupMembers.sh` - Group membership export utility
   - `Student-OU-Sync.sh` - Student organizational unit synchronization

4. **Bulk Operations**
   - `Suspend Users in Bulk/` - Mass student suspension from CSV input

### School Structure

The scripts manage users across grade-based organizational units:
- **Unicorn** (Pre-K): PK1, PK2
- **Grasshopper** (Kindergarten): K
- **Stargazer** (Elementary): 1st, 2nd Grade
- **Centaur** (Elementary): 3rd, 4th Grade  
- **Badger** (Upper Elementary): 5th, 6th Grade
- **MS** (Middle School): 7th, 8th Grade

### Group Types
- Family groups: `family-[grade]@santafeschool.org`
- Student groups: `student-[grade]@santafeschool.org`
- Year-based groups: `family-[year]@santafeschool.org`, `student-[year]@santafeschool.org`

### Key Variables
- `gradyear` - Current graduation year (set in GROUPS/config.sh)
- Grade years calculated as `gradyear + offset` for each grade level
- Organizational units follow pattern: `Users/[Staff|Students]/[Division]/[Grade]`

## Important Notes

- All scripts require GAMADV-XTD3 to be installed and configured
- The domain is `santafeschool.org`
- Scripts include confirmation prompts for destructive operations
- Group synchronization supports both regular and "no-mail" managers
- Annual grade shift (option 4 in Multi-Script.sh) should only be run once per year in mid-July