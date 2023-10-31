local mason = require("mason-lspconfig")
local lspconfig = require("lspconfig")

--------------------------------------------------

local jsonls_config = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Stylelint config",
		fileMatch = {
			".stylelintrc",
			".stylelintrc.json",
			"stylelint.config.json",
		},
		url = "https://json.schemastore.org/stylelintrc",
	},
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "https://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
}

--------------------------------------------------

local efm_config

do
    local efm_fs = require("efmls-configs.fs")

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local get_python_venv_exec = function(name)
        local local_bin_path = ".venv/bin"
        local path = string.format("%s/%s/%s", vim.loop.cwd(), local_bin_path, name)

        if vim.fn.filereadable(path) == 0 then
            path = efm_fs.executable(name)
        end

        return path
    end

    local black = require("efmls-configs.formatters.black")

    local flake8 = vim.tbl_extend("force", require("efmls-configs.linters.flake8"), {
        lintCommand = string.format("%s --max-line-length 88 --extend-ignore E203 -", get_python_venv_exec("flake8")),
    })

    local pylint = vim.tbl_extend("force", require("efmls-configs.linters.pylint"), {
        lintCommand = string.format(
        "% --score=no --max-line-length 88 --disable W1203 ${INPUT}",
        get_python_venv_exec("pylint")
        ),
    })

    efm_config = {
    	settings = {
    		rootMarkers = { ".git/" },
    		languages = {
    			python = {
    				black,
    				flake8,
    				pylint,
    			},
    		},
    	},
    	filetypes = { 'python' },
    	init_options = { documentFormatting = true },
    }
end

--------------------------------------------------

do
    local configs = require("lspconfig.configs")

    configs.templ = {
      default_config = {
        cmd = {  "templ", "lsp", "-log=/tmp/templ-lsp.log" },
        filetypes = { 'templ' },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        settings = {},
      };
    }
end

--------------------------------------------------

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

mason.setup({
	automatic_installation = true,
})

local servers = {
	lua_ls = {
		on_attach = function(client)
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
		end,
		settings = {
			Lua = {
				format = {
					enable = false,
				},
				workspace = {
					userThirdParty = { vim.fn.expand("$HOME/.config/nvim/sumneko_lua_envs") },
				},
			},
		},
	},
	pyright = {},
	cssls = {},
	elixirls = {},
	eslint = {},
	fsautocomplete = {},
	gopls = {},
    templ = {},
	groovyls = {},
	html = {},
	jdtls = {},
	jsonls = {
		settings = {
			json = {
				schemas = jsonls_config.schemas,
			},
		},
	},
	omnisharp = {},
	r_language_server = {},
	rnix = {},
	rust_analyzer = {},
	bashls = {},
	solargraph = {},
	sqlls = {},
	stylelint_lsp = {},
	terraformls = {},
	tsserver = {},
	lemminx = {},
	yamlls = {},
	vimls = {},
	powershell_es = {},
	efm = efm_config,
}

for server, options in pairs(servers) do
    local server_setup = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(
			vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), options.capabilities or {})
		),
		on_attach = function(client, bufnr)
			if options.on_attach then
				options.on_attach(client, bufnr)
			end

			on_attach(client, bufnr)
		end,
		settings = options.settings,
    }
    if options.filetypes then
        server_setup.filetypes = options.filetypes
    end
    if options.init_options then
        server_setup.init_options = options.init_options
    end
	lspconfig[server].setup(server_setup)
end
