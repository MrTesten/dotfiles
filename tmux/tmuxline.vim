# This tmux statusbar config was created by tmuxline.vim
# on Sun, 25 Jan 2015

set -g status-bg "colour238"
set -g message-command-fg "colour251"
set -g status-justify "centre"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour116"
set -g message-bg "colour241"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour251"
set -g message-command-bg "colour241"
set -g status-attr "none"
set -g status-utf8 "on"
set -g pane-border-fg "colour241"
set -g status-left-attr "none"
setw -g window-status-fg "colour246"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour238"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour116"
setw -g window-status-separator ""
setw -g window-status-bg "colour238"
set -g status-left "#[fg=colour236,bg=colour116] #S #[fg=colour116,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour246,bg=colour238] #(~/.scripts/bin/uptime-pretty.sh) #[fg=colour238,bg=colour238,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour241,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour248,bg=colour241] %l:%M %p  %a %d #[fg=colour246,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour238,bg=colour246] #h "
setw -g window-status-format "#[fg=colour238,bg=colour238,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=colour238,bg=colour238,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour238,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour251,bg=colour241] #I  #W  #F #[fg=colour241,bg=colour238,nobold,nounderscore,noitalics]"
