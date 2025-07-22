return {
  -- https://github.com/folke/lazydev.nvim
  'folke/lazydev.nvim',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
