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
# Function: p6df::modules::redis::external::brews()
#
#>
######################################################################
p6df::modules::redis::external::brews() {

  p6df::core::homebrew::cli::brew::install redis

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

  p6_run_dir "$P6_DFZ_SRC_DIR/aws-samples/elasticache-iam-auth-demo-app" "_redis_iam_build"

  p6_return_void
}

######################################################################
#<
#
# Function: words redis = p6df::modules::redis::prompt::env()
#
#  Returns:
#	words - redis
#
#  Environment:	 REDIS_URL
#>
######################################################################
p6df::modules::redis::prompt::env() {

  p6_return_words "redis" '$REDIS_URL'
}
