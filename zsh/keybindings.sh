# up a dir
function up_widget() {
   BUFFER="cd .."
   zle accept-line
}
zle -N up_widget
bindkey -r "^l"
bindkey "^l" up_widget

# git add ci and push
function git_prepare() {
   if [ -n "$BUFFER" ]; then
	BUFFER="git add -u && git commit -m \"$BUFFER\" && git push"
   fi

   if [ -z "$BUFFER" ]; then
	BUFFER="git add -u && git commit -v && git push"
   fi
		
   zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# Edit and rerun
function edit_and_run() {
   BUFFER="fc"
   zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# Enter
function enter_line() {
   zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
   BUFFER="sudo "$BUFFER
   zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

bindkey "^k" expand-or-complete
