function fish_prompt
  set_color cyan
  printf '%s' (pwd)
  # Git
  set last_status $status
  set_color green
  printf '%s' (__fish_git_prompt)
  
  set_color normal
  printf '❯ '
end