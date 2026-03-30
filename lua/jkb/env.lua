local M = {
    is_nixos = vim.loop.fs_stat("/etc/nixos") ~= nil
}

return M
