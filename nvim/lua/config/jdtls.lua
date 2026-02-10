-- Файл: ~/.config/nvim/after/lsp/jdtls.lua (рекомендуется)
local home = os.getenv("HOME")
local jdtls_dir = home .. "/.local/share/jdtls" -- Ваш путь к jdtls
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Основная конфигурация
vim.lsp.config("jdtls", {
	name = "jdtls",
	cmd = {
		"java", -- или полный путь, например '/usr/bin/java'
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		jdtls_dir .. "/config_linux", -- или _win, _mac
		"-data",
		workspace_dir,
	},
	root_markers = {
		".git",
		"build.gradle",
		"pom.xml",
		"settings.gradle",
		"gradlew",
	},
	settings = {
		java = {
			format = {
				enables = true,
				settings = {
					profile = "EclipseStyle",
				},
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
					{
						name = "JavaSE-24",
						path = "/usr/lib/jvm/java-24-openjdk/",
					},
				},
			},
		},
	},
	on_init = function(client)
		-- Опциональная базовая инициализация
		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
	end,
})

-- Включение LSP для Java файлов
vim.lsp.enable("jdtls")
