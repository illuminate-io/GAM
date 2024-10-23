#!/bin/bash
# config/group_config.sh

# Source OU config to use OU variables
source "$(dirname "$0")/ou_config.sh"

# Group definitions
declare -A GROUPS
declare -A MANAGERS
declare -A NOMAIL

# Unicorn groups
GROUPS[unicorn]="family-unicorn@santafeschool.org family-\${YEARS[PK1]}@santafeschool.org family-\${YEARS[PK2]}@santafeschool.org"
MANAGERS[unicorn]="'${OU[ADM]}','${OU[UNI]}','${OU[UND]}'"
NOMAIL[unicorn]="'${OU[WELL]}','${OU[SHAR]}'"

# Grasshopper groups
GROUPS[grasshopper]="family-grasshopper@santafeschool.org family-\${YEARS[K]}@santafeschool.org"
MANAGERS[grasshopper]="'${OU[ADM]}','${OU[GRASS]}','${OU[UND]}'"
NOMAIL[grasshopper]="'${OU[WELL]}','${OU[SHAR]}'"

# Stargazer groups
GROUPS[stargazer]="family-stargazer@santafeschool.org family-first@santafeschool.org family-second@santafeschool.org family-\${YEARS[STAR1]}@santafeschool.org family-\${YEARS[STAR2]}@santafeschool.org"
MANAGERS[stargazer]="'${OU[ADM]}','${OU[STAR]}','${OU[UND]}'"
NOMAIL[stargazer]="'${OU[WELL]}','${OU[SPA]}','${OU[SHAR]}'"

# Continue pattern for other groups...
# (Centaur, Badger, MS groups would follow the same pattern)

# General groups
GROUPS[general]="underhill@santafeschool.org wholeschool@santafeschool.org staff@santafeschool.org students@santafeschool.org alumni@santafeschool.org families@santafeschool.org"
MANAGERS[general]="'${OU[UND]}','${OU[ADM]}'"
NOMAIL[general]="'${OU[SHAR]}'"

# Helpdesk
GROUPS[helpdesk]="helpdesk@santafeschool.org"
