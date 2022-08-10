# Steps to Compile and Deploy

## Pre-requisites 
- starknet cli
- (testnet funds on goerli)[https://faucet.goerli.starknet.io/]
- python3.8+ and pip
- package `openzeppelin-cairo-contracts` installed via pip in current env (required for ownable and base ERC721)[https://github.com/OpenZeppelin/cairo-contracts/tree/v0.2.1#install-the-library]

## Steps to Compile Contract
- Compile Contract - `starknet-compile src/ERC721.cairo --output compiled/ERC721-compiled.json`
- Deploy Contract `starknet deploy --contract compiled/ERC721-compiled.json --inputs 71942470984044 4279881 1326931092425890470889725858687666342583300938305667082129866117334595168554 --network alpha-goerli --no_wallet`
    - Here three ints as input are argument "Animal", "Ani", and Address for owner "0x343..."
    - You can make use of utils.py to convert string to starknet ints. `python -i utils/utils.py` , and then use it as `hex_to_felt("0x074a4A866E2D5C9f0A91Ef0EF2eC92c4268ad170da78d79BadbD7064468E8806")` or `str_to_felt("ANI")`
    - Make sure to wait a little before txn gets added to L2 as tx_hashes are precomputed, so you will have to wait.