```sh
curl -L 'https://github.com/ypconstante/fedora-gnome-setup/archive/refs/heads/main.zip' -o 'fedora-gnome-setup.zip'
unzip 'fedora-gnome-setup.zip'
find fedora-gnome-setup-main/. -name "*.sh" -exec chmod +x {} \;
sudo ./fedora-gnome-setup-main/shell/install.sh
```

Restart

Install updates

```sh
sudo dnf install -y git
git clone https://github.com/ypconstante/fedora-gnome-setup.git ~/projects/personal/fedora-gnome-setup
find ~/projects/personal/fedora-gnome-setup/. -name "*.sh" -exec chmod +x {} \;
./projects/personal/fedora-gnome-setup/shell/run-after-install.sh
```

Restart

```sh
./projects/personal/fedora-gnome-setup/shell/run.sh
```

Restart

Enable gnome extensions

Configure git:
- `git config --global user.email "you@example.com"`
- `git config --global user.name "Your Name"`
- [Create git ssh key](https://github.com/ypconstante/fedora-gnome-setup/wiki#create-ssh-key)
- Import GPG keys
- `cd ~/projects/personal/fedora-gnome-setup/ && git remote set-url origin git@github.com:ypconstante/fedora-gnome-setup.git`

Configure Firefox:
- Delete default bookmarks
- [Install and login into 1Password](https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager/)
- Sign in
- Change theme to dark compact
- Import extensions config
- Enable extensions on private window
- Enable H264 plugin
- Remove additional search engines
- Add cookie exception

Configure JetBrains Toolbox:
- Sign in
- Install IntelliJ
- Install IntelliJ plugins

Sign in or add license to:
- Sublime Merge
- Sublime Text

Configure Chromium and Chrome:
- Change search engine to DDG
- Install [Chromium Web Store](https://github.com/NeverDecaf/chromium-web-store)
- Install uBlock Origin

[Install Nvidia drivers](https://rpmfusion.org/Howto/NVIDIA)

Configure backup on Vorta

Optional - Gaming:
- Run `~/projects/personal/fedora-gnome-setup/shell/gaming.sh`
