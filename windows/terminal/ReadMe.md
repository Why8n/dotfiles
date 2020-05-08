Configuration
--------
>Windows Terminal is a new, modern, feature-rich, productive terminal application for command-line users.

When [terminal] has been installed,using `wt.exe` to launch it.

[terminal]'s configuration file path: `$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`\
specifically,the concrete path is:`C:\Users\<yourname>\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

another way to open `settings.json`` is:
1. In the tab bar, click the `⌵` button to view the available shells.
2. Click *Settings* from the dropdown list.

For an introduction to the various settings, see [Using Json Settings][UsingJsonSettings]. The list of valid settings can be found in the [settings.json documentation][SettingsSchema] section.

**Notice**: actually,there are two configuration files for [terminal]:`default.json` and `settings.json`.Users should only be concerned with the content of the `settings.json`,which contains their customizations.The `default.json` file is only provided as a reference of what the default settings are.To view the default settings file, click on the "Settings" button while holding the `Alt` key.

Others
------
- remove background when using `ls`:
    1. copy windows default colors:
    ```bash
    dircolors -p > $HOME/.dircolors
    ```
    2. modify `STICKY_OTHER_WRITABLE` and `OTHER_WRITABLE`:
    ```bash
    STICKY_OTHER_WRITABLE 02;32 
    OTHER_WRITABLE 01;34 
    ```
    3. add below to `$HOME/.bashrc`(or `$HOME/.zshrc` if using zsh):
    ```bash
    # reset ls background for directory
    [ -f $HOME/.dircolors  ] && eval $(dircolors -b $HOME/.dircolors)
    ```

- launch `*.exe` within `wsl`: so in **wsl**,we actually can launch `.exe`,for example:
```bash
> /mnt/c/Windows/System32/cmd.exe # launch cmd.exe
```
the above command will launch `cmd.exe`,noticed that we do have to input the complete executable program path so that the launch can be done,so to simplify this,setting below to `.bashrc`(or `.zshrc`):
```bash
export PATH=$PATH:/mnt/c/Windows/System32
```
and then,to launch `cmd.exe`,just input below:
```bash
> cmd.exe
```

[terminal]:https://github.com/microsoft/terminal
[UsingJsonSettings]:https://github.com/microsoft/terminal/blob/master/doc/user-docs/UsingJsonSettings.md
[SettingsSchema]:https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md
