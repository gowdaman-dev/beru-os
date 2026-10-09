-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Beru's bootstrap keeps path setup out of this user config.
dofile((os.getenv("BERU_PATH") or "/usr/share/beru") .. "/default/hypr/bootstrap.lua")

-- Disable all Beru default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Beru's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Beru defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Beru's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })
