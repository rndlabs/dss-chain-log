all        :; forge build --optimize --optimizer-runs 200
clean      :; forge clean
test       :; forge test -vvv
deploy     :; forge build && forge create ChainLog --optimize --optimizer-runs 200 -i
list       :; ./scripts/keys2ascii.sh
chainlog   :; ./scripts/chainlog.sh $(entry)
