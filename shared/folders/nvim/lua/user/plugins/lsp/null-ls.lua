local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- Cloudformation diagnostics
-- local diagnostics_cfn_lint = require("user.plugins.lsp.null-ls.cfn-lint")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			-- extra_args = { "--single-quote", "--jsx-single-quote", "--trailing-comma all" },
			extra_filetypes = { "toml" },
			disabled_filetypes = { "json", "jsonc" },
			timeout = 1000,
		}), -- yarn global add prettier
		formatting.stylua, -- cargo install stylua
		formatting.rustfmt.with({
			extra_args = function(params)
				local Path = require("plenary.path")
				local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

				if cargo_toml:exists() and cargo_toml:is_file() then
					for _, line in ipairs(cargo_toml:readlines()) do
						local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
						if edition then
							return { "--edition=" .. edition }
						end
					end
				end
				-- default edition when we don't find `Cargo.toml` or the `edition` in it.
				return { "--edition=2021" }
			end,
		}), -- rustup component add rustfmt
		formatting.rustywind, --yarn global add rustywind
		formatting.shfmt.with({
			extra_args = { "-w", "." },
		}), -- go install mvdan.cc/sh/v3/cmd/shfmt@latest
		-- diagnostics.cspell, -- yarn global add cspell
		-- diagnostics.eslint_d, -- yarn global add eslint_d
		diagnostics.eslint, -- yarn global add eslint
		diagnostics.jsonlint, -- yarn global add jsonlint
		diagnostics.markdownlint, -- yarn global add markdownlint
		diagnostics.yamllint, -- pip install yamllint --user
		diagnostics.shellcheck, -- scoop/choco install shellcheck
		-- diagnostics_cfn_lint, -- pip install cfn-lint --user
		-- code_actions.eslint_d, -- yarn global add eslint_d
		code_actions.eslint, -- yarn global add eslint
		code_actions.gitsigns,
		code_actions.refactoring,
		code_actions.shellcheck, -- scoop/choco install shellcheck
	},
})
