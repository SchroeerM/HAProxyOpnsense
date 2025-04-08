#!/bin/sh

log() {
  logger "[bridgepatch] $1"
  echo "[bridgepatch] $1"
}

log "Starte Bridge-Konfiguration (VXLAN + Edge-Modus aktivieren)"

# --- Mgmt Bridge (bridge0) ---
log "🛠️  Konfiguriere bridge0 (Mgmt)"
ifconfig bridge0 delm vxlan_mgmt_pve0
ifconfig bridge0 delm vxlan_mgmt_pve1
ifconfig bridge0 addm vxlan_mgmt_pve0 addm vxlan_mgmt_pve1 \
  edge vxlan_mgmt_pve0 edge vxlan_mgmt_pve1 \
  autoedge vxlan_mgmt_pve0 autoedge vxlan_mgmt_pve1 \
  autoptp vxlan_mgmt_pve0 autoptp vxlan_mgmt_pve1
ifconfig bridge0 up

# --- Website Bridge (bridge1) ---
log "🛠️  Konfiguriere bridge1 (Websites)"
ifconfig bridge1 delm vxlan_websites_pve0
ifconfig bridge1 delm vxlan_websites_pve1
ifconfig bridge1 addm vxlan_websites_pve0 addm vxlan_websites_pve1 \
  edge vxlan_websites_pve0 edge vxlan_websites_pve1 \
  autoedge vxlan_websites_pve0 autoedge vxlan_websites_pve1 \
  autoptp vxlan_websites_pve0 autoptp vxlan_websites_pve1
ifconfig bridge1 up

# --- Mail Bridge (bridge2) ---
log "🛠️  Konfiguriere bridge2 (Mail)"
ifconfig bridge2 delm vxlan_mail_pve0
ifconfig bridge2 delm vxlan_mail_pve1
ifconfig bridge2 addm vxlan_mail_pve0 addm vxlan_mail_pve1 \
  edge vxlan_mail_pve0 edge vxlan_mail_pve1 \
  autoedge vxlan_mail_pve0 autoedge vxlan_mail_pve1 \
  autoptp vxlan_mail_pve0 autoptp vxlan_mail_pve1
ifconfig bridge2 up

# --- Bellhub Bridge (bridge3) ---
log "🛠️  Konfiguriere bridge3 (Bellhub)"
ifconfig bridge3 delm vxlan_bellhub_pve0
ifconfig bridge3 delm vxlan_bellhub_pve1
ifconfig bridge3 addm vxlan_bellhub_pve0 addm vxlan_bellhub_pve1 \
  edge vxlan_bellhub_pve0 edge vxlan_bellhub_pve1 \
  autoedge vxlan_bellhub_pve0 autoedge vxlan_bellhub_pve1 \
  autoptp vxlan_bellhub_pve0 autoptp vxlan_bellhub_pve1
ifconfig bridge3 up

# --- Laboratory Bridge (bridge4) ---
log "🛠️  Konfiguriere bridge4 (Laboratory)"
ifconfig bridge4 delm vxlan_laboratory_pve0
ifconfig bridge4 delm vxlan_laboratory_pve1
ifconfig bridge4 addm vxlan_laboratory_pve0 addm vxlan_laboratory_pve1 \
  edge vxlan_laboratory_pve0 edge vxlan_laboratory_pve1 \
  autoedge vxlan_laboratory_pve0 autoedge vxlan_laboratory_pve1 \
  autoptp vxlan_laboratory_pve0 autoptp vxlan_laboratory_pve1
ifconfig bridge4 up

log "✅ Bridge-Konfiguration abgeschlossen"
