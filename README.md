# Template for a Neovim plugin

This is a template for a Neovim plugin. It includes the basic structure and
files needed to get started with plugin development.

## Requirements

- Neovim >= 0.11.0
- Git for version control
- (Optional) StyLua for code formatting
- (Optional) Luacheck for static analysis

## Installation

### Creating a New Plugin

1. Use this template to create a new repository:

   ```bash
   git clone https://github.com/developer-omar/nvim-plugin-template.git my-new-plugin
   cd my-new-plugin
   ```

2. Run the setup script to customize the template:

   ```bash
   ./scripts/setup.sh
   ```

3. Update the documentation files with your plugin-specific information

### Directory Structure

```
.
├── lua/
│   └── plugin-name/        # Plugin code
│       └── commands.lua    # Commands definitions
│       └── config.lua      # Configuration setup
│       └── init.lua        # Main entry point
│       └── keymaps.lua     # Key mappings
│       └── utils.lua       # Utility functions
├── plugin/
│   └── plugin-name.lua     # Plugin load script
├── doc/
│   └── plugin-name.txt     # Help documentation
├── tests/                  # Test files
├── .github/                # GitHub specific files
├── scripts/                # Development scripts
├── .stylua.toml            # StyLua configuration
├── .luacheckrc             # Luacheck configuration
└── README.md               # This file
└── README_PLUGIN.md        # Description of the plugin
```
