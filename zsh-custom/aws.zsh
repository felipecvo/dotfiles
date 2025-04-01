aws-use() {
  aws-sso-util login --profile $1
  awsume $1
  export TS_ENV=$1
}
