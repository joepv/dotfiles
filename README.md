# dotfiles

Where configs become legendary

## Neovim notes

### Install bleeding edge on macOS

```shell
brew install --HEAD neovim
brew install wget
pip install neovim
```

### Clear Neovim cache

```
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## MacOS key remap

[hidutil key remapping generator for MacOS](https://hidutil-generator.netlify.app/)

Copy the configuration below to ` ~/Library/LaunchAgents/com.local.KeyRemapping.plist`

Map right CMD to ENTER

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x7000000E7,
              "HIDKeyboardModifierMappingDst": 0x700000028
            }
        ]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

```bash
hidutil property --set '{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x7000000E7,
              "HIDKeyboardModifierMappingDst": 0x700000028
            }
        ]}'
```
