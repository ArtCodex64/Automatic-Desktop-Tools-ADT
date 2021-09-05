# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#FIX JAVA PROBLME cuando lazamos burpsuite
export _JAVA_AWT_WM_NONREPARENTING=1

#Functions mkt CREATE-DIRECTORIES
function mkt(){
    mkdir {nmap,content,exploits,scripts}
}

#EXTRACT NMAP INFORMATION
function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address" >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n" >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipbloard\n" >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
 }
 #CUSTOM ALIAS
 userName="$(logname)"

 #CUSTOM ALIAS
 alias cat='/bin/bat'
 alias catnl='/bin/bat --paging=never'
 alias ll='lsd -lh --group-dirs=first'
 alias la='lsd -a --group-dirs=first'
 alias l='lsd --group-dirs=first'
 alias lla='lsd -lha --group-dirs=first'
 alias ls='lsd --group-dirs=first'

source /home/h4ck-debian-htb/powerlevel10k/powerlevel10k.zsh-theme > /dev/null 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
