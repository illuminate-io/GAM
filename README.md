# GAM Administration Scripts

A collection of Google Workspace administration scripts for managing users, groups, and organizational units using [GAMADV-XTD3](https://github.com/taers232c/GAMADV-XTD3).

## Overview

These scripts automate common Google Workspace administrative tasks for educational institutions, specifically designed for Santa Fe School's organizational structure with grade-based user management.

## Features

- **User Management**: Create, suspend, and offboard users across different roles (students, staff, families)
- **Group Management**: Automated group synchronization based on grade levels and organizational units
- **Bulk Operations**: Process multiple users simultaneously
- **Grade-Based Organization**: Handles school-specific grade transitions and organizational structure
- **Centralized Configuration**: Shared configuration system for easy maintenance

## Scripts

### Main Administration Tools

- **`Multi-Script.sh`** - Interactive main interface for user administration
  - Check group membership
  - Reset passwords
  - Suspend users
  - Offboard students, staff, and families
  - Annual grade year transitions

- **`GROUPS/groups-script.sh`** - Advanced group management
  - Configurable graduation year calculations
  - Automated manager assignments
  - Grade-based group synchronization

### Individual Utilities

- **`Disable-User.sh`** - Suspend individual users and move to appropriate OUs
- **`PrintGroupMembers.sh`** - Export group membership to CSV files
- **`Student-OU-Sync.sh`** - Synchronize students with organizational units and groups
- **`Suspend Users in Bulk/Account Action - Suspend Students in Bulk.sh`** - Bulk suspend multiple users from CSV

## Prerequisites

- **GAMADV-XTD3** installed and configured
- Google Workspace domain with appropriate administrative privileges
- Bash shell environment (Linux/macOS)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/illuminate-io/GAM.git
   cd GAM
   ```

2. Update the GAM binary path in `shared-config.sh`:
   ```bash
   export GAM_PATH="/path/to/your/gamadv-xtd3/gam7/gam"
   ```

3. Configure your domain in `shared-config.sh`:
   ```bash
   export DOMAIN="yourdomain.org"
   ```

4. Make scripts executable:
   ```bash
   chmod +x *.sh GROUPS/*.sh
   ```

## Configuration

### Shared Configuration

All scripts use `shared-config.sh` for centralized configuration:

- **GAM_PATH**: Location of GAMADV-XTD3 binary
- **DOMAIN**: Your Google Workspace domain
- **Organizational Units**: Predefined OU paths for different user types
- **Utility Functions**: Logging, error handling, and validation functions

### Grade Year Configuration

For grade-based operations, update `GROUPS/config.sh`:

```bash
export gradyear=25  # Current 8th grade graduation year
```

## Usage

### Interactive Administration

Run the main script for an interactive menu:

```bash
./Multi-Script.sh
```

### Group Management

Navigate to the GROUPS directory and run:

```bash
cd GROUPS
./groups-script.sh
```

### Bulk Operations

For bulk user suspension, prepare a CSV file with email addresses and run:

```bash
cd "Suspend Users in Bulk"
./Account\ Action\ -\ Suspend\ Students\ in\ Bulk.sh
```

## School Organization Structure

The scripts are designed around a grade-based organizational structure:

- **Unicorn** (Pre-K): PK1, PK2
- **Grasshopper** (Kindergarten): K
- **Stargazer** (Elementary): 1st, 2nd Grade
- **Centaur** (Elementary): 3rd, 4th Grade
- **Badger** (Upper Elementary): 5th, 6th Grade
- **MS** (Middle School): 7th, 8th Grade

## Group Types

- **Family Groups**: `family-[grade]@domain.org`
- **Student Groups**: `student-[grade]@domain.org`
- **Year-Based Groups**: `family-[year]@domain.org`, `student-[year]@domain.org`

## Safety Features

- **Confirmation Prompts**: Interactive confirmation for destructive operations
- **Preview Mode**: Some scripts offer preview mode to review changes before execution
- **Logging**: Built-in logging functions for audit trails
- **Error Handling**: Comprehensive error checking and validation

## Development

### Adding New Scripts

When creating new scripts:

1. Source the shared configuration:
   ```bash
   source "$(dirname "$0")/shared-config.sh"
   ```

2. Use the centralized variables and utility functions
3. Follow the established patterns for error handling and logging

### Utility Functions

Available functions from `shared-config.sh`:

- `log_action()` - Log administrative actions
- `run_gam_safe()` - Execute GAM commands with error handling
- `validate_email()` - Validate email address format

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly in a development environment
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

These scripts are designed for educational institution use and should be thoroughly tested in a development environment before use in production. Always ensure you have proper backups and understand the implications of administrative actions.

## Support

For issues or questions:
- Check the [fix rollup documentation](fixes/fix-rollup-2025-07-08.md) for recent changes
- Review the [CLAUDE.md](CLAUDE.md) file for development guidance
- Open an issue in this repository

---

**Note**: This repository contains scripts for Google Workspace administration using GAMADV-XTD3. Ensure you have appropriate permissions and understand Google Workspace policies before running these scripts in your environment.