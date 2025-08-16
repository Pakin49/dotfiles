#! /bin/zsh

# get the current package in the system
my_packages=$(mktemp)
echo "Temp file: $my_packages"
yay -Qqe | grep -vE "yay" > "$my_packages"

while read -r pkg; do
  if ! grep -Fxq "$pkg" "$my_packages"; then
      echo "Installing $pkg"
      #yay -S --noconfirm "$pkg"
  fi
done < "$HOME/packagelist.txt"

while read -r pkg; do
  if ! grep -Fxq "$pkg" "$HOME/packagelist.txt"; then 
    echo "Removing $pkg"
    #yay -Rs --noconfirm "$pkg"
  fi
done < "$my_packages"
