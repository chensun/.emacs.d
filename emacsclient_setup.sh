#!/bin/bash

echo "Creating ~/.config/systemd/user/emacsd.service"
mkdir -p ~/.config/systemd/user

cat <<EOF > ~/.config/systemd/user/emacsd.service
[Unit]
Description=Emacs: the extensible, self-documenting text editor
Documentation=man:emacs(1) info:Emacs

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(progn (setq kill-emacs-hook nil) (kill-emacs))"
Restart=on-failure
Environment=DISPLAY=:%i
TimeoutStartSec=0

[Install]
WantedBy=default.target
EOF

echo "Starting emacsd.service"
systemctl --user enable emacsd --now

echo "Creating ~/.local/share/applications/emacsclient.desktop"
mkdir -p ~/.local/share/applications

cat <<EOF > ~/.local/share/applications/emacsclient.desktop
[Desktop Entry]
Version=1.0
Name=Emacsclient
GenericName=Text Editor
Comment=View and edit files
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
Exec=/usr/bin/emacsclient -c %F
Icon=/usr/share/icons/hicolor/scalable/apps/emacs26.svg
Type=Application
Terminal=false
Categories=Utility;Development;TextEditor;
StartupWMClass=Emacs
EOF


echo "Updating ~/.bashrc"
cat <<EOF >> ~/.bashrc

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t -a emacs"
export VISUAL="emacsclient -c -a emacs"
EOF

source ~/.bashrc


echo "Updating ~/.bash_aliases"
cat <<-EOF >> ~/.bash_aliases

alias em="emacsclient -t -a emacs"
alias ec="emacsclient -c -a emacs"
EOF

source ~/.bash_aliases


echo "Done!"
