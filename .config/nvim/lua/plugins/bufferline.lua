return {
  'akinsho/bufferline.nvim'
  , version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options={
      themable = true,
    },
    highlights = {
      fill = {
        bg = "#000000" ,
      },
      buffer_selected = {
        italic = false,
      }
    }
  },
}
