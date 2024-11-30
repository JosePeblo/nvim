local function swaplines(n1,n2)
    local line1 = vim.fn.getline(n1)
    local line2 = vim.fn.getline(n2)
    vim.fn.setline(n1, line2)
    vim.fn.setline(n2, line1)
end

local function swapup()
    local n = vim.fn.line('.')
    if n == 1 then
        return 
    end

    swaplines(n, n - 1)
    vim.cmd(tostring(n - 1))
end

local function swapdown()
    local n = vim.fn.line('.')
    if n == vim.fn.line('$') then
        return
    end

    swaplines(n, n + 1)
    vim.cmd(tostring(n + 1))
end

vim.keymap.set('n', '<C-Down>', swapdown, { silent = true })
vim.keymap.set('n', '<C-Up>', swapup, { silent = true })

