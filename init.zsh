# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::redis::deps()
#
#>
######################################################################
p6df::modules::redis::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::redis::external::brew()
#
#>
######################################################################
p6df::modules::redis::external::brew() {

  brew install redis

  p6_return_void
}
