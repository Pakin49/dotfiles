#! /bin/zsh

# get the current package in the system
my_packages=$(mktemp)
echo "Temp file: $my_packages"
yay -Qqe | grep -vE "yay|nvidia|pipewire|wireplumber" > "$my_packages"

echo "========== Installing package ========="
while read -r pkg; do
  if ! grep -Fxq "$pkg" "$my_packages"; then
      echo "Installing $pkg"
      yay -S --needed --noconfirm "$pkg"
  fi
done < "$HOME/packagelist.txt"

echo "========== Removing package ========="
while read -r pkg; do
  if ! grep -Fxq "$pkg" "$HOME/packagelist.txt"; then 
    echo "Removing $pkg"
    yay -Rs --noconfirm "$pkg"
  fi
done < "$my_packages"
