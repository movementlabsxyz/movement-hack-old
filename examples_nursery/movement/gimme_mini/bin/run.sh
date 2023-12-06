#!/bin/bash -e

# Function to echo text as cyan with emoji
function begin() {
  echo -e "🔹 \033[36m$1\033[0m"
}

# Function to echo text as green with increased font-weight and emoji
function finish() {
  echo -e "✅ \033[1;32m$1\033[0m"
}

begin "Funding account for hello_blockchain deployment and call..."
movement aptos account fund-with-faucet --account default
finish "Funded account for hello_blockchain deployment and call!"

begin "Publishing hello_blockchain module..."
echo "y" | movement aptos move publish --named-addresses hello_blockchain=default
finish "Published hello_blockchain module!"

begin "Setting hello_blockchain message to 'hello!'..."
echo "y" | movement aptos move run --function-id default::message::set_message --args string:hello!
finish "Set hello_blockchain message to 'hello'!"

begin "Querying resources for account..."
movement aptos account list --query resources --account default
finish "Queryed resourced for account!"

begin "Setting hello_blockchain message to 'goodbye!'..."
echo "y" | movement aptos move run --function-id default::message::set_message --args string:goodbye!
finish "Set hello_blockchain message to 'goodbye'!"

begin "Querying resources for account..."
movement aptos account list --query resources --account default
finish "Queryed resourced for account!"