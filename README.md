# bkp-pendrive

<p align="center">
  <img src="img/nando-dev-logo.png" alt="NandoDev Logo" width="200"/>
</p>

<p align="center">
  <strong>🔌 Ferramenta CLI para montar pendrives USB no WSL2</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-WSL2-blue?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/shell-bash-green?style=flat-square" alt="Shell">
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="License">
</p>

---

## 📋 Sobre

O **bkp-pendrive** resolve um problema comum para desenvolvedores que usam WSL2: montar pendrives USB formatados em **EXT4**, **NTFS**, **FAT32** ou **exFAT** diretamente no Linux, sem precisar acessar via `/mnt/c/`.

### ✨ Funcionalidades

- 🔄 **Semi-Auto-attach** via `usbipd-win` - anexa o USB ao WSL mediante autorização do usuário no PowerShell como Admin
- 📁 **Multi-filesystem** - suporta EXT4, NTFS, FAT32, exFAT
- 🎨 **Interface colorida** - output amigável com cores ANSI
- ⚡ **Simples de usar** - apenas `bkp-pendrive up` e `down`
- 🧪 **Modo simulação** - teste sem hardware com `--simulate`

---

## 🚀 Instalação

### Pré-requisitos

1. **Windows 11** (ou Windows 10 com WSL2)
2. **WSL2** com uma distribuição Linux (Ubuntu recomendado)
3. **usbipd-win** instalado no Windows

#### Instalar usbipd-win (PowerShell como Admin):
```powershell
winget install usbipd
```

### Instalação do bkp-pendrive

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/bkp-pendrive.git
cd bkp-pendrive

# Execute o instalador
./scripts/install.sh
```

O instalador irá:
- ✅ Verificar ambiente WSL
- ✅ Validar instalação do usbipd-win
- ✅ Configurar mount point
- ✅ Criar symlink em `/usr/local/bin`

---

## 📖 Uso

### Comandos básicos

```bash
# Montar pendrive
bkp-pendrive up

# Desmontar pendrive
bkp-pendrive down

# Verificar status
bkp-pendrive status

# Ajuda
bkp-pendrive help
```

### Modo simulação (para testes)

```bash
bkp-pendrive --simulate up
bkp-pendrive --simulate down
```

### Primeiro uso de um novo pendrive

Na primeira vez que usar um pendrive novo, será necessário executar `usbipd bind` no Windows como Administrador. O script irá guiá-lo automaticamente:

```
[WARN] Dispositivo precisa ser registrado (bind) no Windows.

==========================================
  Execute no PowerShell como ADMIN:

    usbipd bind --busid 2-3

  Após executar, pressione ENTER...
==========================================
```

Depois do bind inicial, o pendrive funcionará automaticamente.

---

## ⚙️ Configuração

A configuração é salva em `~/.config/bkp-pendrive/config`:

```bash
MOUNT_POINT="/mnt/bkp-pendrive"
PENDRIVE_LABEL="MeuPendrive"
```

### Reinstalar/Reconfigurar

```bash
cd ~/projects/bkp-pendrive
./scripts/install.sh
```

---

## 🏗️ Estrutura do Projeto

```
bkp-pendrive/
├── bin/
│   └── bkp-pendrive      # CLI principal
├── lib/
│   ├── logging.sh        # Funções de log colorido
│   ├── tui.sh            # Helpers de interface
│   ├── checks.sh         # Validações de ambiente
│   ├── usbipd.sh         # Integração com usbipd-win
│   └── mount_ext4.sh     # Lógica de mount/unmount
├── scripts/
│   ├── install.sh        # Wizard de instalação
│   └── uninstall.sh      # Desinstalador
├── config/
│   └── bkp-pendrive.conf # Configuração padrão
└── docs/
    └── README.md
```

---

## 🔧 Requisitos Técnicos

| Componente | Versão Mínima |
|------------|---------------|
| Windows | 10 (build 19041+) ou 11 |
| WSL | 2.0 |
| usbipd-win | 4.0+ |
| Bash | 4.0+ |

### Ferramentas Linux utilizadas

- `lsblk`, `blkid`, `mount`, `umount`
- `findmnt`, `mountpoint`
- `powershell.exe` (para comunicação com Windows)

---

## 🐛 Troubleshooting

### "Device is not shared"

Execute no PowerShell como Admin:
```powershell
usbipd bind --busid <BUSID>
```

### Pendrive não aparece no WSL

1. Verifique se o pendrive está conectado: `usbipd list`
2. Anexe manualmente: `usbipd attach --wsl --busid <BUSID>`

### Erro de permissão ao montar

O comando `mount` requer sudo. Certifique-se de que seu usuário está no grupo `sudo`.

---

## 🤝 Contribuindo

Contribuições são bem-vindas! 

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 👤 Autor

<p align="left">
  <img src="img/nando-dev-logo.png" alt="NandoDev" width="50" style="vertical-align:middle"/>
  <strong>Desenvolvido por NandoDev</strong>
</p>

Desenvolvido com ❤️ para a comunidade WSL/Linux.

---

<p align="center">
  <sub>⭐ Se este projeto te ajudou, deixe uma estrela!</sub>
</p>
