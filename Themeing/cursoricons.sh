wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh

cd $HOME/.local/share/icons

curl -OJL "https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-latte-light-cursors.zip"
unzip -o "catppuccin-latte-light-cursors.zip"
rm "catppuccin-latte-light-cursors.zip"

curl -OJL "https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-latte-pink-cursors.zip"
unzip -o "catppuccin-latte-pink-cursors.zip"
rm "catppuccin-latte-pink-cursors.zip"

nwg-look