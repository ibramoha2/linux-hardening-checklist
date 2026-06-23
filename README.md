# ✅ Linux Hardening Checklist

> Complete Linux security hardening guide & automation scripts — inspired by CIS Benchmark & ANSSI guidelines.

![Platform](https://img.shields.io/badge/Platform-Linux-FCC624?style=flat-square&logo=linux&logoColor=black)
![Language](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Author](https://img.shields.io/badge/Author-ibramoha2-CC0000?style=flat-square)

---

## 📋 Checklist

### 🔐 1. Authentification & Accès
- [ ] Désactiver le login root SSH
- [ ] Utiliser l'authentification par clé SSH uniquement
- [ ] Configurer un timeout de session (TMOUT=300)
- [ ] Activer PAM avec politique de mot de passe forte
- [ ] Installer & configurer `fail2ban`

### 🔥 2. Firewall & Réseau
- [ ] Activer UFW / iptables
- [ ] Bloquer tous les ports entrants par défaut
- [ ] Autoriser uniquement SSH (port custom), HTTP/HTTPS si nécessaire
- [ ] Désactiver IPv6 si non utilisé
- [ ] Désactiver les services réseau inutiles (Avahi, Cups...)

### 📦 3. Système & Services
- [ ] Mettre à jour le système (`apt upgrade -y`)
- [ ] Désactiver les services inutiles (`systemctl disable`)
- [ ] Configurer les mises à jour automatiques de sécurité
- [ ] Supprimer les paquets non nécessaires
- [ ] Restreindre les permissions SUID/SGID

### 📁 4. Système de fichiers
- [ ] Configurer `/tmp` en `noexec,nosuid`
- [ ] Séparer `/home`, `/var`, `/tmp` en partitions distinctes
- [ ] Vérifier les fichiers world-writable
- [ ] Auditer les permissions des fichiers sensibles (`/etc/passwd`, `/etc/shadow`)
- [ ] Activer le chiffrement du disque (LUKS)

### 🔍 5. Audit & Monitoring
- [ ] Installer & configurer `auditd`
- [ ] Configurer la rotation des logs (`logrotate`)
- [ ] Surveiller `/var/log/auth.log`
- [ ] Installer `rkhunter` ou `chkrootkit`
- [ ] Configurer des alertes email sur les connexions SSH

### 🛡️ 6. Kernel & Sysctl
- [ ] Désactiver IP forwarding
- [ ] Activer SYN cookies
- [ ] Désactiver les redirections ICMP
- [ ] Activer ASLR (`kernel.randomize_va_space = 2`)
- [ ] Restreindre `dmesg` aux root uniquement

---

## 🚀 Script d'automatisation

```bash
# Cloner le repo
git clone https://github.com/ibramoha2/linux-hardening-checklist
cd linux-hardening-checklist

# Lancer le script de durcissement
sudo bash scripts/harden.sh
```

---

## 📁 Structure

```
linux-hardening-checklist/
├── README.md
├── scripts/
│   ├── harden.sh          # Script principal
│   ├── audit.sh           # Audit de sécurité
│   └── check_suid.sh      # Vérification SUID/SGID
├── configs/
│   ├── sshd_config        # Config SSH sécurisée
│   ├── sysctl.conf        # Paramètres kernel
│   └── fail2ban.conf      # Config fail2ban
└── docs/
    └── GUIDE.md           # Guide détaillé
```

---

## ⚠️ Disclaimer

Ces scripts sont fournis à des fins éducatives et d'administration système légitime. Toujours tester dans un environnement de développement avant la production.

---

**Auteur :** [@ibramoha2](https://github.com/ibramoha2) — Cybersecurity Student | Niger 🇳🇪
