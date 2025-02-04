return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "filetype")
      table.remove(opts.sections.lualine_z)
    end,
  },
}
