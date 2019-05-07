if ! status is-interactive
    exit 0
end

function _sub
  read -lca words
  set -l word "$words[2]"

  if [ (count $words) -eq 2 ]
    complete -c $word -a (sub commands)
  else
    for option in (sub completions "$word")
      complete -c $word --long-option=$option 
    end
  end
end
