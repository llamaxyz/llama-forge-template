# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update   :; forge update
install  :; forge install

# Build & test
build    :; forge clean && forge build --optimize --optimize-runs 1000000
test     :; forge clean && forge test --fork-url ${RPC_URL} --fork-block-number ${BLOCK_NUMBER}
local    :; forge clean && forge test
report   :; forge clean && forge test --gas-report | sed -e/╭/\{ -e:1 -en\;b1 -e\} -ed | cat > .gas-report
match    :; forge clean && forge test --fork-url ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} -m ${MATCH} -vvv
trace    :; forge clean && forge test --fork-url ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} -vvv
clean    :; forge clean
snapshot :; forge snapshot
lint     :; npx prettier --write src/**/*.sol