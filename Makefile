# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update   :; forge update
install  :; forge install

# Build & test
build    :; forge clean && forge build --optimize --optimizer-runs 1000000
test     :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} $(call compute_test_verbosity,${V}) # Usage: make test [optional](V=<{1,2,3,4,5}>)
match    :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} -m ${MATCH} $(call compute_test_verbosity,${V}) # Usage: make match MATCH=<TEST_FUNCTION_NAME> [optional](V=<{1,2,3,4,5}>)
report   :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} --gas-report | sed -e/╭/\{ -e:1 -en\;b1 -e\} -ed | cat > .gas-report
clean    :; forge clean
lint     :; npx prettier --write src/**/*.sol

# Defaults to -v if no V=<{1,2,3,4,5} specified
define compute_test_verbosity
$(strip \
$(if $(filter 1,$(1)),-v,\
$(if $(filter 2,$(1)),-vv,\
$(if $(filter 3,$(1)),-vvv,\
$(if $(filter 4,$(1)),-vvvv,\
$(if $(filter 5,$(1)),-vvvvv,\
-v
))))))
endef
