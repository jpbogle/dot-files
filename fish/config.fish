fish_add_path /Users/jbogle/.local/share/solana/install/active_release/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Users/jbogle/.cargo/bin
fish_add_path /opt/homebrew/opt/openssl@3/bin
fish_add_path /opt/homebrew/opt/openssl@1.1/bin
fish_add_path /Users/jbogle/Code/solana/target/release

function ll --description "List contents of directory in long format with hidden files"
    command ls --color=auto -alhf $argv
end

function fish_prompt -d "Write out the prompt"
    set -l git_info
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        set git_branch (set_color -o blue)"$git_branch"
        set -l git_status
        if command git diff-index --quiet HEAD --
            if set -l count (command git rev-list --count --left-right $upstream...HEAD 2>/dev/null)
                echo $count | read -l ahead behind
                if test "$ahead" -gt 0
                    set git_status "$git_status"(set_color red)⬆
                end
                if test "$behind" -gt 0
                    set git_status "$git_status"(set_color red)⬇
                end
            end
            for i in (git status --porcelain | string sub -l 2 | uniq)
                switch $i
                    case "."
                        set git_status "$git_status"(set_color green)✚
                    case " D"
                        set git_status "$git_status"(set_color red)✖
                    case "*M*"
                        set git_status "$git_status"(set_color green)✱
                    case "*R*"
                        set git_status "$git_status"(set_color purple)➜
                    case "*U*"
                        set git_status "$git_status"(set_color brown)═
                    case "??"
                        set git_status "$git_status"(set_color red)≠
                end
            end
        else
            set git_status (set_color green):
        end
        set git_info " ($git_status$git_branch"(set_color white)")"
    end

    printf '%s%s%s%s%s%s%s%s%s%s%s%s%s' (set_color -o white) (set_color yellow) $USER '|' (set_color magenta) (prompt_hostname) (set_color green) (prompt_pwd) (set_color white) $git_info (set_color white) (set_color white)'> '
end
