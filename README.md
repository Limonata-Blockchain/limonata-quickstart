<p align="center"><img src="https://limonata.xyz/assets/limonata-mark.png" alt="Limonata" width="120" /></p>

<h1 align="center">Limonata Quickstart</h1>
<p align="center"><b>Deploy a contract and send a gasless transaction in ~5 minutes.</b></p>

Limonata is an EVM Layer 1 where **the protocol pays the gas** — deploy your Solidity unchanged and your users transact for free.

| | |
|---|---|
| Chain ID | `10777` |
| RPC | `https://rpc.limonata.xyz` |
| Explorer | `https://explorer.limonata.xyz` |
| Faucet | `https://faucet.limonata.xyz` |

> Try it first with no setup at all: **[limonata.xyz/demo](https://limonata.xyz/demo)** — send a gasless tx in one click.

---

## 1. Install Foundry (skip if you have it)
```sh
curl -L https://foundry.paradigm.xyz | bash && foundryup
```

## 2. Clone + build
```sh
git clone https://github.com/Limonata-Blockchain/limonata-quickstart
cd limonata-quickstart
forge build
```

## 3. Make a throwaway key + get test LIMO
```sh
cast wallet new          # prints an Address and a Private Key — copy both
```
Paste your **address** at **https://faucet.limonata.xyz** to get test LIMO (this also creates your account on-chain). Then export your key + RPC:
```sh
export PK=0x<your-private-key>
export RPC=https://rpc.limonata.xyz
```

## 4. Deploy the contract
```sh
forge create src/GM.sol:GM --rpc-url $RPC --private-key $PK --broadcast
```
Copy the `Deployed to:` address:
```sh
export GM=0x<deployed-address>
```

## 5. Send a transaction — and pay zero gas
```sh
ME=$(cast wallet address --private-key $PK)

# balance BEFORE
cast balance $ME --rpc-url $RPC

# say gm — a real on-chain transaction
cast send $GM "gm()" --rpc-url $RPC --private-key $PK

# balance AFTER — it didn't move.
cast balance $ME --rpc-url $RPC
```

👀 **Your LIMO balance is unchanged.** You just sent a real transaction and paid nothing — gas sponsorship is written into Limonata's consensus (not a relayer, not an ERC-4337 paymaster contract). Read the receipt on the [explorer](https://explorer.limonata.xyz).

---

## That's the whole trick
Your users never pay for gas, and they never need to hold the coin to use your app. Build whatever you want on top — it's a normal EVM chain.

- **Hardhat / Viem / Ethers** all work too — just point them at `https://rpc.limonata.xyz` (chain `10777`).
- **Chain source** (Apache-2.0): https://github.com/Limonata-Blockchain/limonata
- **Live gasless demo**: https://limonata.xyz/demo

Built something? Open an issue or list it on the [Showcase](https://limonata.xyz). 🍋
