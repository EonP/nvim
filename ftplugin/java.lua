local jdtls = require("jdtls")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
vim.fn.mkdir(workspace_dir, "p")

-- Use your full Oracle JDK 21 path
local jdk_path = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"

-- Project root detection
local root_dir = require("jdtls.setup").find_root({
    ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.xml"
})

if not root_dir then return end

local config = {
    cmd = {
        vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls",
        "-data", workspace_dir,
    },
    root_dir = root_dir,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                -- classpath = { }, -- jar files
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = jdk_path,
                        sources = jdk_path .. "/lib/src.zip",
                    },
                },
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                },
            },
        },
    },
    init_options = {
        bundles = {},
    },
}

jdtls.start_or_attach(config)
