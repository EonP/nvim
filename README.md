# My Neovim Config

This is my personal Neovim configuration, tailored to my workflow and preferences. It’s a work in progress, and I'm always exploring ways to improve it.

---

### Preview

![](greeter.png)

---

### Project Structure

Here's a general overview of the config layout:

```text
lua
├── core
│   ├── keymaps.lua
│   ├── options.lua
│   └── ...
├── plugins
│   ├── telescope.lua
│   ├── treesitter.lua
│   └── ...
│   └── lsp
│       ├── lsp.lua
│       └── mason.lua
init.lua
```


### Requirements (MacOS - Homebrew)
Before using this config, install the following tools with [Homebrew](https://brew.sh/):
```bash
# Core tools
brew install neovim 
brew install git
```

```bash
# Fonts (for icons)
brew install --cask font-hack-nerd-font
```

```bash
# Telescope dependencies
brew install ripgrep fd
```

```bash 
# LazyGit integration
brew install lazygit
```

```bash 
# LaTeX (for compiling .tex files)
brew install --cask mactex

# Skim (for viewing PDFs with SyncTeX)
brew install --cask skim
```

```bash
# Node.js (needed for copilot, markdown preview, LSPs, etc.)
brew install node
```
---

### Set up
1. Navigate to your config directory
```bash
cd ~/.config/
```

2. Clone this repo: 
```bash
git clone https://github.com/EonP/nvim.git
```

3. Launch Neovim - all plugins will install automatically 
```bash
nvim
```

---

### To Keep in Mind

- Some language servers require full SDKs to be installed and properly configured.
  - For example, `java.lua` (Java LSP) requires the full JDK path for proper functionality.  
    Make sure to set your `JAVA_HOME` environment variable appropriately.
  - You can hardcode the JDK path, or set `JAVA_HOME` and use `os.getenv("JAVA_HOME")` in your config:
    ```lua
    local jdk_path = os.getenv("JAVA_HOME") or "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
    ```
- All plugins are declared in `init.lua` and are organized into the `lua/plugins/` directory.

- You can enable/disable features easily:
  - Just **comment or uncomment** the relevant `require("plugins/...")`

### Contributing
Any kind of contribution is more than welcome—whether it's fixing bugs, adding plugins, or even just opening issues with suggestions!
