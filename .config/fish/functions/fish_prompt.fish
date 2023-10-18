function fish_prompt
  # Git
  set last_status $status
  echo -n (set_color cyan)(pwd)(set_color green)(__fish_git_prompt)(set_color normal)'❯ '
end