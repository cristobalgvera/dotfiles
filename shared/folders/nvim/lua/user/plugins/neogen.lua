local util = require("user.util")
local neogen = util.require("neogen")

local function generate_annotation_conventions()
	local conventions = {
		lua = "emmylua",
		rust = "rustdoc",
	}

	local languages = {}

	for language, convention in pairs(conventions) do
		languages[language] = {
			template = {
				annotation_convention = convention,
			},
		}
	end

	return languages
end

neogen.setup({
	enabled = true,
	languages = generate_annotation_conventions(),
})
