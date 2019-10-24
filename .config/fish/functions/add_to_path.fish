function add_to_path --description 'Persistently prepends paths to your PATH'
  set -x PATH $PATH $argv
end
