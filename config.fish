if status is-interactive


    # Commands to run in interactive sessions can go here
end
alias ls='exa -l'
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kickstart="NVIM_APPNAME=Kickstart nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims
    set items "Kickstart" "LazyVim" "AstroNvim"
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    
    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = "default"
        set config ""
    end
    
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca 'nvims\n'



