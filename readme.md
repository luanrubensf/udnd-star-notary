# udnd-star-notary

Blockchain project from Udacity Nanodegree.

This project has an ERC-721 (NFT) smart contract to register stars on blockchain.

The base contract for this one is the @openzeppelin/contracts ERC-721.

In addition to the original features provided by the ERC-721 abstract contract, the 
following features were implemented:

- createStar: allow users to create a new star
- putStarUpForSale: allow an owner to put his star for sale
- buyStar: allow to buy stars that are for sale
- lookUptokenIdToStarInfo: get star details based on star id
- exchangeStars: allow users to exchange two stars
- transferStar: allow a user to transfer his star

This project has tests to cover all the functionalities.

**OBS:** this project is part of a Nanodegree course from Udacity, so it's not an official NFT.

## Running the project

### Contract

To run the contract locally you need to have truffle installed.

1. Run npm install on the project folder.
2. On the project folder, you can run `truffle develop`.
3. Then you can compile the project with `compile`.
4. Then you can run the tests using `test`.
5. Finally, you can run the migration using `migrate --reset`.

The project will be deployed in the local blockchain.

### front-end Dapp

To run the front-end app, you need to install all dependencies. Inside the app folder (`cd app`) run the command:

```
npm install
```

Then you can launch the app:

```
npm run dev
```

## Token name and symbol

ERC-721 Token Name: **StarNotary**

ERC-721 Token Symbol: **STAR**

## Versions

Versions of libs and tools:

- Truffle: v5.4.19
- OpenZeppelin: ^4.4.0
- @truffle/hdwallet-provider: ^2.0.0
- truffle-assertions: ^0.9.2
- Solidity: ^0.8.0
- Solidity compiler: 0.8.0

## Addresses

### Rinkeby

This contract is deployed in the Rinkeby test network.

Contract address: [0xefB08523fb2C148589dca8Dc2FB1677DB491548D](https://rinkeby.etherscan.io/address/0xefB08523fb2C148589dca8Dc2FB1677DB491548D)

It was created a star to test this contract:

First transaction: [0x32752cdb4d8a55104524ddb24308ca893c27d77a6508d7e9f2fafc737354363e**](https://rinkeby.etherscan.io/tx/0x32752cdb4d8a55104524ddb24308ca893c27d77a6508d7e9f2fafc737354363e)

Starname: **Atlas**

StarId: 1
