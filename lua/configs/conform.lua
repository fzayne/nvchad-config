local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    php={"php-cs-fixer"},
   -- php = { "php" },
    blade={"blade-formatter"}
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    -- timeout_ms = 500,
    lsp_fallback = true,
  },
 formatters = {
                php = {
                    command = "php-cs-fixer",
                    args = {
                        "fix",
                        "$FILENAME",
                        "--config=/your/path/to/config/file/[filename].php",
                        "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
                    },
                    stdin = false,
                }
            }
}

require("conform").setup(options)
