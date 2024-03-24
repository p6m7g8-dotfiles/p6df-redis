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
    p6m7g8-dotfiles/p6df-aws
    p6m7g8-dotfiles/p6df-java
    aws-samples/elasticache-iam-auth-demo-app
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

  p6df::modules::homebrew::cli::brew::install redis

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::redis::langs()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::redis::langs() {

  p6_run_dir "$P6_DFZ_SRC_DIR/aws-samples/elasticache-iam-auth-demo-app" "mvn clean"
  p6_run_dir "$P6_DFZ_SRC_DIR/aws-samples/elasticache-iam-auth-demo-app" "mvn verify"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::redis::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::redis::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}
