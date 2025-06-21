return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "xdebug/vscode-php-debug",
    },
    keys = {
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
        },
        {
            "<leader>dn",
            function()
                require("dap").continue()
            end,
            desc = "Step Over",
        },
        {
            "<leader>dd",
            function()
                require("dapui").toggle()
            end,
            desc = "Toggle DAP UI",
        },
        {
            "<leader>dx",
            function()
                require("dap").terminate()
            end,
            desc = "Terminate Session",
        },
        {
            "<leader>dc",
            function()
                require("dap").clear_breakpoints()
            end,
            desc = "Clear All Breakpoints",
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- PHP
        dap.adapters.php = {
            type = "executable",
            command = "node",
            args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                pathMappings = {
                    ["/var/www/html"] = "${workspaceFolder}",
                },
            },
        }

        -- Java
        dap.configurations.java = {
            {
                type = "java",
                request = "launch",
                name = "Launch Java Program",
                mainClass = function()
                    return vim.fn.input("Main Class > ")
                end,
                projectName = function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
                end,
            },
        }
    end,
}
