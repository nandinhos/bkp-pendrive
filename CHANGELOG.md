# Changelog

All notable changes to this project will be documented in this file.

## [0.9.0] - 2026-01-13
### Added
- **Verbose Mode**: Added `-v/--verbose` flag to show detailed execution logs and debug info.
- **Shell Completion**: Added bash and zsh completion scripts in `completions/` for faster command entry.
- **Strategic Debugging**: Integrated `log_debug` across critical paths (selection, health checks, unmount).

## [0.8.0] - 2026-01-13
### Added
- **Test Suite**: Integrated `bats-core` for automated shell testing.
- Created `tests/test_helper.bash` with hardware mocks.
- 12 unit tests covering state parsing and configuration constants.
- Added `scripts/test.sh` to run tests.

## [0.7.1] - 2026-01-13
### Changed
- **Architecture Refactor**: Created `lib/constants.sh` to centralize all hardcoded strings (paths, timeouts, filters).
- Extracted shared `parse_usbipd_state` logic into a reusable function.
- Cleaned up duplicated constants across `lib/` files.

## [0.7.0] - 2026-01-13
### Added
- **Static Analysis**: Integrated `shellcheck` for all shell scripts.
- Added `scripts/lint.sh` for automated code quality checks.
### Fixed
- Fixed multiple SC2155 (declare/assign separately) warnings.
- Fixed SC2086/SC2046 quoting and word-splitting issues in mount commands.
- Resolved SC2295 parameter expansion quoting.
- Fixed SC2126 (prefer grep -c).

## [0.6.6] - 2026-01-12
### Improved
- **UX/Colors**: Added color-coding to `usb-driver down` menu (Yellow paths, Cyan device names).
- Highlighted "Desmontar TODOS" in Red.
- Clarified success messages when quitting or finishing unmount operations.
- Fixed "Device busy" issues by refining `usbipd` attach syntax.
