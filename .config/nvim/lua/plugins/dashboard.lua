return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = [[
              .-""""-.
             /  .--.  \
            /  /    \  \
            | |  /\  | |
            | |  \/  | |
            \  \____/  /
             '._    _.'
                /`  `\
           _.-''  /\  ''-._
        .-'      /  \      '-.
       /   _    /____\    _   \
      /   / \    |  |    / \   \
      |  |   |   |  |   |   |  |
      |  |   |   |  |   |   |  |
      \  \__/    |  |    \__/  /
       '._    ___|  |___    _.'
          '-./___    ___\.-'
                |    |
              __|    |__
             /__|____|__\

          long-lived mage, short-lived bugs
      ]]
    end,
  },
}
