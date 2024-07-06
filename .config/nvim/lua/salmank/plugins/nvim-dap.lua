return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.go = function(callback)
			vim.defer_fn(function()
				callback({ type = "server", host = "127.0.0.1", port = "5000" })
			end, 100)
		end

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
		}

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.api.nvim_set_keymap("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"shift+<F5>",
			'<cmd>lua require"dap".terminate()<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<F10>",
			'<cmd>lua require"dap".step_over()<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<F11>",
			'<cmd>lua require"dap".step_into()<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<F4>",
			'<cmd>lua require"dap".toggle_breakpoint()<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>dT",
			'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>dp",
			'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>dr",
			'<cmd>lua require"dap".repl.open()<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>dll",
			'<cmd>lua require"dap".run_last()<CR>',
			{ noremap = true, silent = true }
		)

		dap.listeners.after.event_initialized.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
