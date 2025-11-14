local M = {}

local uuid = vim.fn.sha256

---------------------------------------------------------------------
-- SELECT SCRATCH
---------------------------------------------------------------------
function M.select_scratch()
  local items = Snacks.scratch.list()

  Snacks.picker.pick({
    source = "scratch",
    items = items,
    format = "text",
    transform = function(item)
      item.text = string.format(item.text, item.icon or "", item.ft or "", vim.fn.fnamemodify(item.file, ":t"))
    end,
    confirm = function(picker, item)
      if not item then
        return
      end
      picker:close()
      Snacks.scratch.open(item)
    end,
    actions = {
      delete = function(picker, item)
        os.remove(item.file)
        picker:close()
        vim.schedule(function()
          M.select_scratch()
        end)
      end,
    },
  })
end

---------------------------------------------------------------------
-- NEW SCRATCH
---------------------------------------------------------------------
function M.new_scratch()
  local types = {
    "css",
    "txt",
    "go",
    "html",
    "javascript",
    "javascriptreact",
    "lua",
    "markdown",
    "python",
    "rust",
    "typescript",
    "typescriptreact",
    "zig",
  }

  Snacks.picker.pick({
    source = "scratch-ft",
    items = types,
    format = "text",
    transform = function(ft)
      return { text = ft }
    end,
    confirm = function(picker, item)
      picker:close()
      Snacks.scratch({
        ft = item.text,
        name = uuid(item.text .. vim.loop.now()),
      })
    end,
  })
end

return M
