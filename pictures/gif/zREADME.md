# Gifs for neovim<br>
I use these for snacks.nvim dashboard in neovim.<br>
<br>
### Snacks.nvim:
[folke/snacks github](https://github.com/folke/snacks.nvim)

### Dashboard plugin with image:
[dashboard.md github](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md)

### My implementation of terminal section in my dashboard.lua:
```lua
{
section = "terminal",
cmd =
"timg -I -p q -C ~/media/pictures/gif/cyber-spiral.gif",  -- seems to work better in foot terminal emulator
-- "chafa --clear ~/Pictures/gif/cyber-butt.gif --align=center --format=symbols --fill=block --symbols=block --size=60x17",
-- "viu ~/Pictures/gif/cyber-butt.gif -b -w 60 -h 16",
width = 50,
height = 13,
indent = 4,
padding = 1
},
```
