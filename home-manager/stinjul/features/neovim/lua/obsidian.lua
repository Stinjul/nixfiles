require("obsidian").setup({
	dir = "~/Documents/Notes/",
	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "current_dir",
	},
	note_id_func = function(title)
		return title
	end,
	note_frontmatter_func = function(note)
		local out = { id = note.id, aliases = note.aliases, tags = note.tags }
		if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end
		return out
	end,
	use_advanced_uri = true,
})

vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })
