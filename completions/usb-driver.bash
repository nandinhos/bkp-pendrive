# usb-driver bash completion
# Source this file or add to ~/.bashrc

_usb_driver() {
    local cur prev opts commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main commands
    commands="up down status list check install attach help"
    
    # Global options
    opts="--select -s --all -a --force --eject --simulate -v --verbose --help"
    
    # Complete commands first, then options
    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi
    
    # For 'attach' command, try to complete with available BUSIDs
    if [[ "${prev}" == "attach" ]]; then
        # Get list of available BUSIDs (this requires usbipd)
        local busids
        busids=$(powershell.exe -NoProfile -Command "& 'C:\Program Files\usbipd-win\usbipd.exe' list" 2>/dev/null | \
            grep -E "^[0-9]+-[0-9]+" | awk '{print $1}' 2>/dev/null || echo "")
        COMPREPLY=( $(compgen -W "${busids}" -- ${cur}) )
        return 0
    fi
    
    # Default to options
    if [[ ${cur} == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}

complete -F _usb_driver usb-driver
