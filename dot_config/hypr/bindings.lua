-- utility functions
local function layout_bind(bind_table)
	return function()
		local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
		if not workspace then
			return
		end
		local layout = workspace.tiled_layout
		if bind_table[layout] then
			hl.dispatch(bind_table[layout])
		end
	end
end

-- unbindings
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + F")
hl.unbind("SUPER + CTRL + F")
hl.unbind("SUPER + RETURN")
hl.unbind("SUPER + SHIFT + RETURN")
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + SHIFT + ALT + F")
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + ALT + B")
hl.unbind("SUPER + SHIFT + N")

-- window state
o.bind("SUPER + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SUPER + SHIFT + F", "Tiled full screen", "omarchy-hyprland-window-tiled-fullscreen-toggle")

-- focus
o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))

-- move windows
o.bind(
	"SUPER + SHIFT + H",
	"Swap window to the left",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol l"),
		dwindle = hl.dsp.window.swap({ direction = "l" }),
	})
)
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind(
	"SUPER + SHIFT + L",
	"Swap window to the right",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol r"),
		dwindle = hl.dsp.window.swap({ direction = "r" }),
	})
)

o.bind(
	"SUPER + SHIFT + + ALT + H",
	"Split window to the left",
	layout_bind({
		scrolling = hl.dsp.layout("consume_or_expel prev"),
		dwindle = hl.dsp.layout("togglesplit"),
	})
)
o.bind(
	"SUPER + SHIFT + ALT + L",
	"Split window to the right",
	layout_bind({
		scrolling = hl.dsp.layout("consume_or_expel next"),
		dwindle = hl.dsp.layout("swapsplit"),
	})
)

-- layout
o.bind("SUPER + D", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- application bindings
o.bind("SUPER + RETURN", "Terminal", { omarchy = "terminal" })
o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })
o.bind("SUPER + A", "Anki", "anki")
o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })
o.bind("SUPER + SHIFT + N", "Editor", { omarchy = "editor" })
o.bind("SUPER + SHIFT + SLASH", "Passwords", { omarchy = "1password" })

-- Japanese + English OCR
o.bind(
	"SUPER + SHIFT + PRINT",
	"Extract Japanese text (OCR)",
	"omarchy-capture-text-japanese"
)
