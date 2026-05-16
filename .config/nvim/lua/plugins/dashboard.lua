return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = [[
        ______     _                     
       |  ____|   (_)                    
       | |__ _ __  _  ___ _ __ ___ _ __  
       |  __| '__|| |/ _ \ '__/ _ \ '_ \ 
       | |  | |   | |  __/ | |  __/ | | |
       |_|  |_|   |_|\___|_|  \___|_| |_|

            flowers, spells, and small commits
      ]]
    end,
  },
}
