#!/bin/bash
cd mods/ || exit 1

# Client-only mods
CLIENT_MODS=(
  ambientsounds
  better-climbing
  creativecore
  do-a-barrel-roll
  entityculling
  exordium
  first-person-model
  iris
  jei
  modmenu
  mouse-tweaks
  mouse-wheelie
  not-enough-animations
  reeses-sodium-options
  sodium
  sodium-dynamic-lights
  sodium-options-api
  sound-physics-remastered
  yacl
  zoomify
)

for mod in "${CLIENT_MODS[@]}"; do
  file="${mod}.pw.toml"
  if [ -f "$file" ]; then
    sed -i 's/^side = "both"$/side = "client"/' "$file"
    echo "✓ $mod → client"
  else
    echo "✗ $file not found"
  fi
done

echo ""
echo "Done. Run 'packwiz refresh' next."
