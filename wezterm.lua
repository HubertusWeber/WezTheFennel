-- NOTE: WezTerm looks for fennel.lua in /usr/local/share/lua/5.4/
-- You need to create a symlink to your fennel.lua installation there:
-- ln -s /path/to/your/fennel.lua /usr/local/share/lua/5.4/fennel.lua

debug = { traceback = function() end }

-- Get user's home directory
local home = os.getenv("HOME")
local config_path = string.format("%s/.config/wezterm/config.fnl", home)

-- Load and return the Fennel configuration
local config = require("fennel").install().dofile(config_path)
return config
