# Minimal zsh theme
# Requires Nerd Fonts for the icons

# Configuration
num_dirs=2 # Use 0 for full path
truncated_path="%F{white}%$num_dirs~%f"
decoration="%F{red}%F{magenta}%F{cyan}%f"
background_jobs="%(1j.%F{green} %f.)"
non_zero_return_value="%(0?..%F{yellow}  %f)"

# Left part of prompt
PROMPT='$truncated_path $decoration '
# Right part of prompt
RPROMPT='$background_jobs  $non_zero_return_value'
# Input in bold
zle_highlight=(default:bold)
