#!/bin/bash
# ============================================================
# Security Audit Script — by ibramoha2
# Génère un rapport de sécurité du système
# ============================================================

REPORT="/tmp/security_audit_$(date +%Y%m%d_%H%M%S).txt"

echo "🔍 Security Audit — $(date)" > $REPORT
echo "System: $(uname -a)" >> $REPORT
echo "========================================" >> $REPORT

echo "" >> $REPORT
echo "=== USERS WITH SUDO ===" >> $REPORT
getent group sudo >> $REPORT

echo "" >> $REPORT
echo "=== OPEN PORTS ===" >> $REPORT
ss -tlnp >> $REPORT

echo "" >> $REPORT
echo "=== FAILED LOGIN ATTEMPTS (last 20) ===" >> $REPORT
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -20 >> $REPORT

echo "" >> $REPORT
echo "=== SUID FILES ===" >> $REPORT
find / -perm /4000 -type f 2>/dev/null >> $REPORT

echo "" >> $REPORT
echo "=== WORLD WRITABLE FILES ===" >> $REPORT
find / -perm -0002 -type f 2>/dev/null | grep -v proc >> $REPORT

echo ""
echo "✅ Rapport généré: $REPORT"
