-- Debug Adapter Protocol client
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "jay-babu/mason-nvim-dap.nvim", lazy = true },
    },
    event = "VeryLazy",
    config = function()
        local mason_nvim_dap = require("mason-nvim-dap")

        mason_nvim_dap.setup({
            automatic_setup = true,
            handlers = {}, -- Can provide additional configuration to handlers
            ensure_installed = { -- Update debuggers here based on the language being used
                "codelldb", -- Rust debugger
                "delve", -- Go debugger
                "python", -- Python debugger
            },
        })

        local dap = require("dap")
        local map = require("core.utils").map

        map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
        map("n", "<F7>", dap.step_into, { desc = "Debug: Step Into" })
        map("n", "<F8>", dap.step_over, { desc = "Debug: Step Over" })
        map("n", "<S-F8>", dap.step_out, { desc = "Debug: Step Out" })
        map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        map("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Debug: Set Breakpoint" })
    end,
}
