#!/usr/bin/env bash
#  ---------------------------------------------------------------------------

# Directory Listing aliases
alias dir='ls -hFx'
alias l.='ls -d .* --color=tty' # short listing, only hidden files - .*
alias l='ls -lathF'             # long, sort by newest to oldest
alias L='ls -latrhF'            # long, sort by oldest to newest
alias la='ls -Al'               # show hidden files
alias lc='ls -lcr'              # sort by change time
alias lk='ls -lSr'              # sort by size
alias lh='ls -lSrh'             # sort by size human readable
alias lm='ls -al | more'        # pipe through 'more'
alias lo='ls -laSFh'            # sort by size largest to smallest
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lu='ls -lur'              # sort by access time


#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias dud='du -d 1 -h'                      # Short and human-readable file listing
alias duf='du -sh *'                        # Short and human-readable directory listing

#!/usr/bin/env bash
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all general BASH aliases
#
#  For your own benefit, we won't load all aliases in the general, we will
#  keep the very generic command here and enough for daily basis tasks.
#
#  If you are looking for the more sexier aliases, we suggest you take a look
#  into other core alias files which installed by default.
#
#  ---------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -lAFh'                         # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias nano='nano -W'                        # Preferred 'nano' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'            # fix_term:     Reset the conosle.  Similar to the reset command
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias src='source ~/.bashrc'                # src:          Reload .bashrc file
alias vi=vim                                # use vim when typing vi
