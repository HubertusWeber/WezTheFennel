# 🫖 WezTheFennel

My personal [WezTerm](https://wezfurlong.org/wezterm/) configuration written in [Fennel](https://fennel-lang.org/). 

## 🚀 Prerequisites

- [WezTerm](https://wezfurlong.org/wezterm/installation.html)
- [Hack Nerd Font](https://www.nerdfonts.com/)
- [Fennel](https://fennel-lang.org/) 

## ⚡️ Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/wezterm-config.git ~/.config/wezterm
   ```

2. Create Fennel symlink (required for Fennel configuration):
   ```bash
   ln -s /path/to/your/fennel.lua /usr/local/share/lua/5.4/fennel.lua
   ```

## ⌨️ Key Bindings

### 🪟 Pane Management
- `CMD + h`: Split pane horizontally
- `CMD + k`: Split pane vertically
- `CMD + d`: Close current pane
- `CMD + p`: Pane selection mode
- `CMD + r`: Rotate panes clockwise

### 🔄 Pane Navigation
- `CMD + m`: Move left
- `CMD + n`: Move down
- `CMD + e`: Move up
- `CMD + i`: Move right

### 📐 Pane Resizing
- `CMD + SHIFT + m`: Resize left
- `CMD + SHIFT + n`: Resize down
- `CMD + SHIFT + e`: Resize up
- `CMD + SHIFT + i`: Resize right

### 🖥️ Window Management
- `CMD + .`: Toggle fullscreen

## 📝 Customization

The configuration is written in Fennel with clear sections and detailed comments. To modify any aspect, edit `~/.config/wezterm/config.fnl`.

## 📜 License

Released under the BSD Zero-Clause License (see LICENSE.txt, or don't). Because terminal configurations, like ideas, don't need state-sanctioned permission slips to be shared. The bureaucrats who think they can regulate the flow of human creativity probably still use TERMCAP. 🦖
