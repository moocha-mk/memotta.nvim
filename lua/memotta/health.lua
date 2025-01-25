local memotta = require("memotta")

local M = {}

M.check = function()
    local memotta_state = memotta._get_state()

    if not memotta_state.health_data.is_setup then
        vim.health.report_error("memotta.nvim setup() was never run")
        return
    end

    local is_ok = true
    if not memotta_state.health_data.plenary_found then
        vim.health.report_error("could not find plenary.nvim")
        is_ok = false
    end

    if not memotta_state.health_data.telescope_found then
        vim.health.report_error("could not find telescope.nvim")
        is_ok = false
    end

    if memotta_state.health_data.dir_err ~= nil then
        vim.health.report_error(memotta_state.health_data.dir_err)
        is_ok = false
    end

    if memotta_state.health_data.config_err ~= nil then
        vim.health.report_error(memotta_state.health_data.config_err)
        is_ok = false
    end
    if is_ok then
        vim.health.ok("memotta.nvim setup is ok!")
    end
end

return M
