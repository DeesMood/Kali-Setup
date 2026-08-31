**1. Wallpaper**
* Move "kali-wallpaper-2.png" to "/usr/share/backgrounds/kali/"
* Desktop (Settings) > "Choose the wallpaper", also "Apply to all workspaces" if you want that.


**2. Restore Panel Backup**
* Download "Panel.tar.bz2"
* Panel Profiles > Import > Apply "Backup\_..."


**3. Use a GTK theme**
* Download and move "Orchis-Teal-Dark-Compact (GTK).tar.xz" to "/usr/share/themes/"
* Apperance > Style > Select "Orchis-Teal-Dark-Compact (GTK)"


**4. Icons: YAMIS + WhiteSur, merged**

> NOT UPDATED

I like YAMIS's monochrome look for app/folder/file icons, but it doesn't cover everything (nav/action icons, some app icons) — so I merged it with WhiteSur as a fallback rather than picking just one.

```bash
cd ~/Rice
git clone https://bitbucket.org/dirn-typo/yet-another-monochrome-icon-set.git YAMIS
mkdir -p ~/.local/share/icons
cp -r ~/Rice/YAMIS ~/.local/share/icons/YAMIS-mac
```

**Merge via inheritance** (cleanest option, fully reversible — nothing destructive) — edit `~/.local/share/icons/YAMIS-mac/index.theme`:

```ini
Inherits=WhiteSur-dark,hicolor,breeze
```

**Three more things I ended up needing:**

- Deleted `~/.local/share/icons/YAMIS-mac/places/16/` — this size variant was showing the wrong/broken places icons in Thunar's sidebar, so removing it lets it fall through to WhiteSur at that size instead.
    
    ```bash
    rm -rf ~/.local/share/icons/YAMIS-mac/places/16/
    ```
    
- Firefox isn't in YAMIS at all, so its icon was falling all the way back to hicolor (colorful default). Fixed by copying an existing YAMIS icon in and renaming it to the exact name Firefox's `.desktop` file requests:
    
    ```bash
    cat /usr/share/applications/firefox-esr.desktop | grep -i "^Icon"   # confirms it wants "firefox-esr"cp ~/.local/share/icons/YAMIS-mac/apps/scalable/firefox.svg ~/.local/share/icons/YAMIS-mac/apps/scalable/firefox-esr.svggtk-update-icon-cache -f -t ~/.local/share/icons/YAMIS-mac
    ```
    
    (adjust the source filename/path to whatever browser icon actually exists in YAMIS on your system — check with `find ~/.local/share/icons/YAMIS-mac -iname "*firefox*"` first)

- Deleted `~/.local/share/icons/YAMIS-mac/apps/scalable/system-help.svg`

> To check which file _any_ icon is actually resolving to (useful for tracing other gaps like this one):
> 
> ```bash
> python3 -c "
> import gi
> gi.require_version('Gtk', '3.0')
> from gi.repository import Gtk
> theme = Gtk.IconTheme.get_default()
> icon = theme.lookup_icon('firefox-esr', 48, 0)
> print(icon.get_filename() if icon else 'Not found')
> "
> ```

**5. Add a GTK .css for the user**
* Download and move "gtk.css" to "~/.config/gtk-3.0/gtk.css"


**6. Edit a keyboard shortcut**
* Keyboard > Application Shortcuts > Select Command "xfce4-appfinder"
* Change it to "bash -c 'pgrep xfce4-appfinder && pkill xfce4-appfinder || xfce4-appfinder'"


**7. Configure Application Finder**
* Disable "Keep running instance in the background"
* Enable "Single-click selects and launches items"


**8. Add a xcape super key bind**
* Session and Startup > Application Autostart > Add
* Name "Xcape Super Key Bind 2", Description "Bind Super Key to Alt F3", Comamnd ""


**9. Configure Window Manager Tweaks**
* Disable "Show shadows under dock windows"

### Optionals
Didn't do any of these because it will consume a bit more resource which I don't want or it just doesn't fit with my current setup.


**1. Use powerlevel10k or spaceship framework**
* You can add the framework with themes to get a more appealing visual such as icons and more features


**2. Modify your fastfetch to make it pretty**
* Lots of people modify their fastfetch output to make it more aesthetic which you can do, but I don't because you'll only see it when someone asks for it or when your sharing your rice somewhere.


**3. Use a template for your terminal emulator**
* You can use more templates for the terminal UI which you get in the internet usually named like "\[FILENAME\].color.scheme"


**3. Vim**
**Dependencies:**

```bash
sudo apt install npm pipx vim-gtk3
mkdir ~/.npm-global
npm config set prefix ~/.npm-global
```

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/Downloads/.vimrc ~/.vimrc
sudo apt install shellcheck
pipx install flake8
npm install -g eslint
vim +PlugInstall +qall
```


**4. TMUX**

```bash
sudo apt install tmux xclip
```

Then verify:

```bash
tmux -V
```

After that, the steps from before apply as-is:

```bash
cp ~/Downloads/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Launch tmux, then press `prefix + I` (default prefix is `Ctrl+b`, so `Ctrl+b` then `I`) to install the plugins.
