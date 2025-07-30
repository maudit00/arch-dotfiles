config.load_autoconfig()
c.tabs.padding = {"top": 5, "bottom": 5, "left": 5, "right": 5}

# --- General Font Settings for Qutebrowser UI (Optional) ---
# If you want Monofur for UI elements, be careful with the 'size' part
# and ensure it's a string, e.g., '10pt Monofur'.
# c.fonts.default_family = 'Monofur' # This might be the equivalent for monospace UI
# c.fonts.default_size = '10pt'

# --- Web Page Font Settings ---
# These now need to be comma-separated strings, not Python lists.
# The order still matters: Qutebrowser will try the first, then the second, etc.
# Place Noto Color Emoji early in the list for better emoji display.

# Sans-serif font (most common for web pages)
c.fonts.web.family.sans_serif = "Noto Sans, Noto Color Emoji, Noto Sans CJK JP"

# Serif font
c.fonts.web.family.serif = "Noto Serif, Noto Color Emoji, Noto Sans CJK JP"

# For monospace web content (e.g., <pre>, <code>, some text areas)
# If 'fonts.web.family.monospace' truly doesn't exist,
# you'll have to rely on 'fonts.default_family' or hope fontconfig picks it up.
# However, many versions *do* have a 'fixed' or 'standard' option for this.
# Let's try 'fixed' first, as it's common for monospace.
# If 'c.fonts.web.family.monospace' *was* an option in a slightly different version,
# you'd use it like: c.fonts.web.family.monospace = "Monofur, Noto Sans Mono, Noto Color Emoji, Noto Sans CJK JP"
c.fonts.web.family.fixed = "Monofur, Noto Sans Mono, Noto Color Emoji, Noto Sans CJK JP"

# Cursive font
c.fonts.web.family.cursive = (
    "Comic Sans MS, Noto Color Emoji"  # Or a relevant cursive font
)

# Fantasy font
c.fonts.web.family.fantasy = "Impact, Noto Color Emoji"  # Or a relevant fantasy font

# You might also have a `c.fonts.web.family.standard` in older versions
# This often acts as a general fallback for the "standard" font on a page.
# If the above don't fully work, try adding this:
# c.fonts.web.family.standard = "Noto Sans, Noto Color Emoji, Noto Sans CJK JP"

# Ensure no other lines are using the list syntax for these specific settings.
config.source("qutewal.py")
