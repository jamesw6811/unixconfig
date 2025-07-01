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
