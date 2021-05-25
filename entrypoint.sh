#!/bin/bash

set -e

export AWS_ACCESS_KEY_ID="$INPUT_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$INPUT_AWS_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="$INPUT_AWS_REGION"
export REGION="$INPUT_AWS_REGION"
export CLUSTER_NAME="$INPUT_CLUSTER_NAME"

echo "aws version"

aws --version

echo "env"
echo "$AWS_ACCESS_KEY_ID" | sed 's/./& /g'
echo "$REGION" | sed 's/./& /g'
echo "$CLUSTER_NAME" | sed 's/./& /g'

bash -c "$*"
