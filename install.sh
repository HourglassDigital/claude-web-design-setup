#!/usr/bin/env bash
# Installs the five free tools from the Hourglass Claude web design setup into the current project.
# Usage: bash install.sh [brand]   e.g. bash install.sh stripe   (brand is optional, for awesome-design-md)
# Needs: Node.js 18+ (npx, npm) and Claude Code. Run it from your project folder.
set -euo pipefail
BRAND="${1:-}"
command -v npx >/dev/null || { echo "Node.js 18+ is needed (it gives you npx and npm): https://nodejs.org"; exit 1; }
node -e 'process.exit(parseInt(process.versions.node) >= 18 ? 0 : 1)' || { echo "Node.js 18 or newer is needed."; exit 1; }

step() { printf '\n==> %s\n' "$1"; }

step "1/5 Impeccable (design vocabulary + checks)"
npx -y impeccable install --yes --project

step "2/5 Taste Skill (layout, type, spacing, motion)"
npx -y skills add https://github.com/Leonxlnx/taste-skill --skill "*" --agent claude-code --yes

step "3/5 Emil Kowalski's skills (animation + UI rules)"
npx -y skills@latest add emilkowalski/skills --skill "*" --agent claude-code --yes

step "4/5 awesome-design-md (a real brand's DESIGN.md)"
if [ -n "$BRAND" ]; then
  npx -y getdesign@latest add "$BRAND"
else
  echo "Skipped: pass a brand to add its DESIGN.md, e.g. bash install.sh stripe"
  echo "Brands: https://github.com/VoltAgent/awesome-design-md"
fi

step "5/5 Playwright CLI (Claude screenshots and checks its own work)"
npm install -g @playwright/cli@latest
playwright-cli install --skills

cat <<'DONE'

Done. Open Claude Code in this folder and paste:

  Build a one-page website for a local coffee roaster.
  Read DESIGN.md and follow it.
  Use the design-taste-frontend skill for layout and type.
  When it's built, use playwright-cli to screenshot it on desktop and mobile.
  Then run /impeccable critique and fix the top three issues it finds.

DONE
