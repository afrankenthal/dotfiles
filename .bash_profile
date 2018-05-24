source /etc/bashrc

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/X11:$HOME/bin:/usr/bin:/usr/bin/X11:/bin:/usr/sbin:$PATH

export CVS_RSH=ssh

# Color ls
alias ls="ls -G"
# Color ll
alias ll="ls -lahG"

# Mosh alias to not ask for CLASSE password again and attach to tmux session after login. Note that mosh to CLASSE only works if you are inside the Cornell
# network or with the CLASSE VPN on
alias mosh_cu='mosh lnx231 --ssh="ssh -o GSSAPITrustDNS=no" -- tmux a'

# Mosh alias for FNAL's LPC
alias mosh_lpc='mosh lpc --server="env LD_LIBRARY_PATH=/uscms/home/as2872/local/lib /uscms/home/as2872/local/bin/mosh-server" --ssh="ssh -o GSSAPITrustDNS=no"'

# color prompt by paul
RED='\[\033[01;31m\]'
WHITE='\[\033[01;00m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
export PS1="${debian_chroot:+($debian_chroot)}$GREEN\u$WHITE@$BLUE\h$RED\w$WHITE\$ "

# Notify when a command is finished; just add growl("message") to end of command
function growl()
{
/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier -activate com.googlecode.iterm2 -title "iTerm2" -subtitle "New Message" -message "$@"
}

# iTerm2 Shell integration
[[ $TERM_PROGRAM == "iTerm.app" ]] && test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Obtain Kerberos ticket using a keytab file (no password)
function kinit-gen {
				if ! $(kswitch -p $1 &> /dev/null); then
								echo "[AF] No ticket for $1"
								kinit -fkt ~/Kerberos_stuff/keytab $1
								echo "[AF] Obtained Kerberos ticket for $1"
				else
								if [[ $( klist | grep Expired ) ]] ; then
												echo "[AF] Ticket expired for $1"
											 	kinit -fkt ~/Kerberos_stuff/keytab $1
												echo "[AF] Obtained Kerberos ticket for $1"
								else
												echo "[AF] Already had Kerberos ticket for $1"
												echo "[AF] Switched principal to requested realm"
								fi
				fi
}
function kinit-classe { 
				kinit-gen as2872@CLASSE.CORNELL.EDU
}
function kinit-fermi { 
				kinit-gen as2872@FNAL.GOV
}
function kinit-cern { 
				kinit-gen asterenb@CERN.CH
}

# Aliases for SSH'ing into common destinations
alias ssh-lnx231='kinit-classe; autossh -M 0 lnx231'
alias ssh-lpc='kinit-fermi; autossh -M 0 lpc'
alias ssh-lxplus='kinit-cern; autossh -M 0 lxplus'
alias ssh-tunnel231='kinit-classe; ssh tunnel231'

# Set up ROOT required env variables (Homebrew install)
. $(brew --prefix root6)/bin/thisroot.sh

# Specify the SSH binary location to autossh
export AUTOSSH_PATH=/usr/local/bin/ssh

# SSH tunnel to LNF
# Connect to padmeserv1 using lxgw tunnel below like so: "scp -P 1234
# daq@127.0.0.1:/path/to/file filename-to-be-copied"
alias ssh-tunnel-lnf="ssh -L 1234:padmesrv1:22 afranken@lxgw.lnf.infn.it" # can add 'cat -' to end

function cd() {
  if [ "$#" = "0" ]
  then
  pushd ${HOME} > /dev/null
  elif [ -f "${1}" ]
  then
    ${EDITOR} ${1}
  else
  pushd "$1" > /dev/null
  fi
}

function bd(){
  if [ "$#" = "0" ]
  then
    popd > /dev/null
  else
    for i in $(seq ${1})
    do
      popd > /dev/null
    done
  fi
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
