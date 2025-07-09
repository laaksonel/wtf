# WTF

A command-line assistant that transforms natural language descriptions into Linux commands using AI.

## What it does

`wtf` is a zsh integration tool that helps you convert plain English descriptions into appropriate Linux commands. Type what you want to do, press Ctrl+G, and get the right command instantly.

## Prerequisites

- The `claude` CLI tool must be installed and available in your PATH
- zsh shell

## Installation

1. Install the wtf tool:
   ```bash
   cabal install
   ```

2. Source the zsh integration (add the line to your .zshrc):
   ```bash
   source wtf.zsh
   ```

## Usage

1. Type a natural language description in your zsh prompt
2. Press `Ctrl+G` to invoke the wtf widget
3. The tool will replace your input with the appropriate Linux command but does not run it automatically

### Examples

```bash
# Type this:
list all files including hidden ones

# Press Ctrl+G, get this:
ls -la

# Type this:
find all python files in current directory

# Press Ctrl+G, get this:
find . -name "*.py"

# Type this:
show disk usage of current directory

# Press Ctrl+G, get this:
du -sh .
```

## How it works

The tool sends your natural language input to Claude AI with a specialized prompt that generates Linux commands suitable for your system. The zsh widget seamlessly replaces your input with the generated command, ready to execute.
