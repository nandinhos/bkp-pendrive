#!/bin/bash

check_wsl() {
    grep -qi microsoft /proc/version || {
        log_error "Este script deve ser executado dentro do WSL"
        exit 1
    }
}

check_root() {
    if [ "$EUID" -ne 0 ]; then
        log_error "Execute como root (sudo)"
        exit 1
    fi
}

check_command() {
    command -v "$1" >/dev/null 2>&1 || {
        log_error "Comando necessário não encontrado: $1"
        exit 1
    }
}
