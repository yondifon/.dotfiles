return {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
        palette = {
            main = {
                -- backgrounds (cooler, zinc-like)
                base = "#0b0b10", -- was #191724
                surface = "#121218", -- was #1f1d2e
                overlay = "#1a1a22", -- was #26233a
                highlight_low = "#17171f", -- was #21202e
                highlight_med = "#2a2a35", -- was #403d52
                highlight_high = "#353543", -- was #524f67
                -- yellowish accent → zinc
                gold = "#a1a1aa", -- zinc 400
            },
            moon = {
                base = "#11131a", -- was #232136
                surface = "#171a22", -- was #2a273f
                overlay = "#222534", -- was #393552
                highlight_low = "#191c25", -- was #2a283e
                highlight_med = "#2c2f3d", -- was #44415a
                highlight_high = "#3a3d4a", -- was #56526e
                gold = "#a1a1aa", -- zinc 400
            },
            dawn = {
                base = "#f5f6f8", -- was #faf4ed (remove warm tint)
                surface = "#f7f8fa", -- was #fffaf3
                overlay = "#eef0f3", -- was #f2e9e1
                highlight_low = "#f1f2f5", -- was #f4ede8
                highlight_med = "#e7e9ee", -- was #dfdad9
                highlight_high = "#d9dce2", -- was #cecacd
                gold = "#71717a", -- zinc 500 (slightly darker for light bg)
            },
        },
    },
}
