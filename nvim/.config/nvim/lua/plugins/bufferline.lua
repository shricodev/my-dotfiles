return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      color_icons = true,
      show_buffer_icons = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = function()
            local cwd = vim.fn.getcwd()
            -- Split the path into components
            local path_components = vim.split(cwd, "/")

            -- Check if there are at least three components
            if #path_components < 3 then
              return cwd -- Return the entire path if there are less than three components
            end

            -- Get the last three components and join them in the correct order
            local last_three_paths = ""
            for i = #path_components - 2, #path_components do
              last_three_paths = last_three_paths .. "/" .. path_components[i]
            end

            last_three_paths = string.gsub(last_three_paths, "^//", "/")
            return last_three_paths
          end,
          highlight = "Directory",
          text_align = "left",
          separator = true,
        },
      },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = true,
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      show_close_icon = false,
      show_buffer_close_icons = false,
      separator_style = { "", "" },
    },
  },
}
