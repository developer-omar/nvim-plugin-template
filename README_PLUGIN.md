# plugin-name

## Overview

plugin-description

## Requirements

- Neovim >= 0.8.0

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "username/plugin-name",
  dependencies = {
    -- Add dependencies here
  },
  config = function()
    require("plugin-name").setup({
      -- Your configuration
    })
  end
}
```

## Usage

After installation, you can use the plugin with the following commands:

```vim
:PluginNameCommand    " Execute the plugin's main function
:PluginNameToggle     " Toggle the plugin on/off
```

Key mappings (if using which-key):

- `<leader>pf` - Execute the plugin's main function
- `<leader>pt` - Toggle the plugin on/off
