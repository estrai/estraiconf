# CRUNCH - created from Steve Eley's cat waxing.
# Initially hacked from the Dallas theme. Thanks, Dallas Reedy.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info.  Instead, only the 
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
# 
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

ESTRAI_TIME_COLOR="%{$fg[yellow]%}"
CRUNCH_RVM_COLOR="%{$fg[magenta]%}"
ESTRAI_HOSTNAME_COLOR="%{$fg[red]%}"
ESTRAI_USER_COLOR="%{$fg[yellow]%}"
CRUNCH_DIR_COLOR="%{$fg[cyan]%}"
CRUNCH_GIT_BRANCH_COLOR="%{$fg[green]%}"
CRUNCH_GIT_CLEAN_COLOR="%{$fg[green]%}"
CRUNCH_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX=" $CRUNCH_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $CRUNCH_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $CRUNCH_GIT_DIRTY_COLOR✗"

# Our elements:
ESTRAI_TIME="$CRUNCH_TIME_COLOR%T%{$reset_color%}"
if which rvm-prompt &> /dev/null; then
  CRUNCH_RVM_=["$CRUNCH_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    CRUNCH_RVM_=["$CRUNCH_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}"]"%{$reset_color%}"
  fi
fi
CRUNCH_DIR_="$CRUNCH_DIR_COLOR%~\$(git_prompt_info) "
ESTRAI_PROMPT="➭ "
ESTRAI_PERLBREW="$CRUNCH_RVM_COLOR\${\$( echo $PERLBREW_PERL | sed  -e 's/^perl-//')}""%{$reset_color%}"

ESTRAI_HOSTNAME="$ESTRAI_HOSTNAME_COLOR$(hostname -s)%{$reset_color%}"

# Put it all together!
#PROMPT="$USERNAME@$(hostname) $CRUNCH_TIME_$CRUNCH_RVM_$CRUNCH_DIR_$CRUNCH_PROMPT%{$reset_color%}"
PROMPT="$ESTRAI_USER_COLOR$USERNAME%{$reset_color%}@$ESTRAI_HOSTNAME $ESTRAI_TIME_COLOR%T %{$reset_color%}($ESTRAI_PERLBREW%{$reset_color%}) $CRUNCH_DIR_$ESTRAI_PROMPT%{$reset_color%}"
