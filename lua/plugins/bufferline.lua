-- using lazy.nvim
return
-- using lazy.nvim
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
        mode = "buffers",
        separator_style = "none",
    },
  },
}
