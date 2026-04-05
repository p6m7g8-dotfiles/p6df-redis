# shellcheck shell=bash
_redis_iam_build() {

  jenv local 17
  jenv enable-plugin maven
  jenv rehash

  mvn clean
  mvn verify

  p6_return_void
}
