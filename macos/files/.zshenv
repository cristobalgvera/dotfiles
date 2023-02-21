. "$HOME/.cargo/env"

export EDITOR="lvim"
export LOCALPATH=$HOME/.local
export PYENVPATH=$HOME/.pyenv
export VOLTA_HOME="$HOME/.volta"
export PATH="${PYENVPATH}/shims:${VOLTA_HOME}/bin:${LOCALPATH}/bin:$PATH"

if aws_loc="$(type -p "aws")" || [[ -z $aws_loc ]]; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
  export AWS_DEFAULT_REGION=$(aws configure get region)
fi
