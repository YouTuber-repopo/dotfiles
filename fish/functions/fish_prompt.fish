function __user_host
  set -l content
  if [ (id -u) = '0' ]
    echo -n (set_color --bold red)
  else
    echo -n (set_color --bold green)
  end
  echo -n $USER@(hostname | cut -d . -f 1) (set_color normal)
end

function __current_path
  set pwd_result (pwd)
  echo -n (set_color --bold blue)
  if test (string length $pwd_result) -gt (math $COLUMNS - 10)
    echo -n (prompt_pwd)
  else
    echo -n $pwd_result
  end
  echo -n (set_color normal)
end

function fish_prompt
  set -l last_pipestatus $pipestatus
  set -lx __fish_last_status $status

  if [ $status -eq 0 ]
    set status_face (set_color green) "(*^-^) <"
  else
    set status_face (set_color blue) "(*;-;) <"
  end

  echo -n (set_color white) '/' (set_color normal)
    __user_host
    __current_path
    echo -e ''
  echo -n (set_color white) '\\' $status_face  (set_color normal)
end

function fish_right_prompt
  echo -n (set_color --bold blue)
  date "+%H:%M:%S"
  echo -n (set_color normal)
end

