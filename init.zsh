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

  brew install redis

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
# Function: str token = p6df::modules::redis::aws::token::get(group_id, user_id, [region=$AWS_REGION])
#
#  Args:
#	group_id -
#	user_id -
#	OPTIONAL region - [$AWS_REGION]
#
#  Returns:
#	str - token
#
#  Environment:	 AWS_REGION IAMA P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::redis::aws::token::get() {
  local group_id="$1"
  local user_id="$2"
  local region="${3:-$AWS_REGION}"

  local token=$(
    p6_run_dir "$P6_DFZ_SRC_DIR/aws-samples/elasticache-iam-auth-demo-app" \
      "java -cp target/ElastiCacheIAMAuthDemoApp-1.0-SNAPSHOT.jar com.amazon.elasticache.IAMAuthTokenGeneratorApp \
      --region $region \
      --replication-group-id $group_id \
      --user-id $user_id \
      2>/dev/null"
  )

  p6_return_str "$token"
}
