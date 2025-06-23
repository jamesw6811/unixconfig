# Claude AI System Instructions

This project contains the **tmux-control** tool - a powerful terminal session controller that enables Claude AI to interact with terminal programs, shells, editors, and development environments through tmux sessions.

## Available Tools

### tmux-control Script
**Location**: Available system-wide as `tmux-control` (installed in ~/bin/)
**Purpose**: Universal terminal program controller with visual feedback

**Key Capabilities for Claude**:
- Control any terminal program (vim, shells, REPLs, development servers, etc.)
- Send commands, keystrokes, and control sequences
- Capture and view program output in real-time
- Manage split-pane viewing for visual feedback
- Handle multiple concurrent sessions

### Quick Reference for Claude

#### Starting Programs
```bash
# Start any terminal program
tmux-control --init [command]           # Default: bash
tmux-control --init vim file.txt        # Start vim
tmux-control --init python3             # Start Python REPL
tmux-control --init "npm run dev"       # Start dev server

# Attach for visual feedback (if inside tmux)
tmux-control --attach
```

#### Sending Commands/Input
```bash
tmux-control "your text here"            # Send literal text
tmux-control ":command"                  # Send command + Enter
tmux-control "Enter"                     # Press Enter key
tmux-control "Escape"                    # Press Escape key
tmux-control "C-c"                       # Send Ctrl+C
tmux-control "C-d"                       # Send Ctrl+D
```

#### Monitoring & Status
```bash
tmux-control --screen                    # Capture current screen
tmux-control --status                    # Show session status
tmux-control --validate                  # Check prerequisites
```

#### Session Management
```bash
tmux-control --cleanup                   # Clean up when done
tmux-control --session name             # Use custom session name
tmux-control --window name              # Use custom window name
```

## Common Use Cases for Claude

### 1. Development Workflow
```bash
# Start development environment
tmux-control --init bash
tmux-control --attach
tmux-control "cd ~/projects/myapp"
tmux-control "npm run dev"
tmux-control --screen  # Monitor server output
```

### 2. File Editing with Vim
```bash
# Edit files with vim
tmux-control --init "vim src/main.js"
tmux-control --attach
tmux-control "i"                         # Enter insert mode
tmux-control "console.log('Hello');"     # Add code
tmux-control "Escape"                    # Exit insert mode
tmux-control ":wq"                       # Save and quit
```

### 3. Interactive Testing
```bash
# Start test environment
tmux-control --init python3
tmux-control --attach
tmux-control "import unittest"
tmux-control "Enter"
tmux-control --screen                    # Check output
```

### 4. System Administration
```bash
# Monitor system processes
tmux-control --init "htop"
tmux-control --attach
tmux-control --screen                    # View system status
tmux-control "q"                         # Quit htop
```

## Important Notes for Claude

1. **Always use --screen frequently** to monitor program state and output
2. **Use --attach when inside tmux** for split-pane visual feedback
3. **Clean up with --cleanup** when tasks are complete
4. **Check --status** if commands don't seem to be working
5. **Use --validate** to ensure environment is ready

## Environment Variables (Optional)
```bash
export CLAUDE_SESSION_NAME="custom-session"
export CLAUDE_WINDOW_NAME="custom-window"
export CLAUDE_KEY_DELAY="0.2"
```

## Multi-Session Support
```bash
# Handle multiple concurrent tasks
tmux-control --session task1 --init "npm run test"
tmux-control --session task2 --init "npm run dev"
tmux-control --session task1 --screen
tmux-control --session task2 --screen
```

This tool provides Claude with comprehensive terminal control capabilities for development, testing, system administration, and any interactive terminal work.

## Time Management Best Practices

**CRITICAL:** Always check current time when timing is important, especially if there are gaps between user messages.

- Use `date` command to get current time before making time-based recommendations
- Messages can be minutes or hours apart - never assume continuous conversation timing
- When scheduling or planning based on calendar events, always verify current time first
- Time-sensitive recommendations become invalid quickly - refresh timestamp for accuracy

## User Preferences & Environment

### Browser
- Uses Brave browser on Windows via WSL
- Command to open URLs: `cmd.exe /c 'start brave <URL>'`
- Example: `cmd.exe /c 'start brave https://mail.google.com/mail/u/0/#all/19797000babb4f56'`

### Email & Services
- Gmail: jamesw6811@gmail.com
- Google MCP setup: export GOOGLE_CLIENT_SECRETS=~/productivity/client_secret.json

### Development Environment
- Vim with extensive customizations at ~/.vimrc
- Git repo for configs at ~/unixconfig
- FZF search bindings under \s prefix
- Muted, italic CoC completion styling preferred

### Google Calendar API Notes
- The `summary` parameter in Google Calendar API is the event title/name that displays
- There is no separate "title" parameter in the API - `summary` is what shows as the event name
- The `description` parameter is for additional details that show up in event details

### Git Commit Preferences
- **NEVER include Claude attribution in commit messages**
- Do not add "Generated with Claude Code" or "Co-Authored-By: Claude" lines
- Keep commit messages clean and professional without AI attribution