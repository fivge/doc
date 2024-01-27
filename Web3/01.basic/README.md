# Basic

## 0x01 Start

### a、基本流程

##### 编译合约

.sol 文件，编译为 bin 文件（二进制文件）

其中包含很多的属性/值，我们需要其中合约对象的二进制、abi 属性值

```js
// Load contract
const source = fs.readFileSync('./Incrementer.sol', 'utf8');

// compile solidity
const input = {
  language: 'Solidity',
  sources: {
    'Incrementer.sol': {
      content: source,
    },
  },
  settings: {
    outputSelection: {
      '*': {
        '*': ['*'],
      },
    },
  },
};

const tempFile = JSON.parse(solc.compile(JSON.stringify(input)));
const contractFile = tempFile.contracts['Incrementer.sol']['Incrementer'];

// Get bin & abi
const bytecode = contractFile.evm.bytecode.object;
const abi = contractFile.abi;
```

##### 构造 web3 对象

```js
// Create web3
const web3Api = 'https://sepolia.infura.io/v3/' + process.env.INFURA_ID;

const web3 = new Web3(web3Api);
```

通过 web3 对象可以很方便的发送相应的交易到区块链网络, 同时获取区块链的处理结果.

构造 web3 对象时, 主要需要传入一个参数, 就是对应的区块链网络, 包括 sepolia 等测试网络 testnet, 或是 mainnet 主网.

使用 `goerli`网络

```js
const web3Api = 'https://goerli.infura.io/v3/' + process.env.INFURA_ID;

const web3 = new Web3(web3Api);
```

##### 获取账户地址

在区块链上, 每个用户都有一个对应的账户地址, 而这个账户地址可以通过私钥进行获取. 这里, 我们调用 web3.eth.accounts.privateKeyToAccount 接口, 传入对应的私钥, 就可以获取对应的账户地址

```js
const account = web3.eth.accounts.privateKeyToAccount(privatekey);
const account_from = {
  privateKey: privatekey,
  accountAddress: account.address,
};
```

##### 部署合约

> 构造相应的合约实例

使用对应的 abi 构造相应的合约实例, 以便在后续中通过合约实例进行交易的发送

```js
// Create contract instance
const deployContract = new web3.eth.Contract(abi);
```

> 创建合约交易

调用 deployContract.deploy 接口, 创建部署合约的二进制交易

这里, 此交易还没有发送到区块链网络, 即合约还没有被创建

```js
// Create Tx
const deployTx = deployContract.deploy({
  data: bytecode,
  arguments: [0], // Pass arguments to the contract constructor on deployment(_initialNumber in Incremental.sol)
});
```

> 交易签名

使用私钥对交易进行签名

```js
// Sign Tx
const deployTransaction = await web3.eth.accounts.signTransaction(
  {
    data: deployTx.encodeABI(),
    gas: 0xf4240,
  },
  account_from.privateKey
);
```

> 部署合约

使用发送签名后的交易到区块链网络, 同时会去返回的交易回执. 从返回的交易回执中可以得到此次部署的合约的地址

`https://sepolia.etherscan.io/address/${deployReceipt.contractAddress}`

```js
const deployReceipt = await web3.eth.sendSignedTransaction(deployTransaction.rawTransaction);

// Your deployed contrac can be viewed at: https://sepolia.etherscan.io/address/${deployReceipt.contractAddress}
console.log(`Contract deployed at address: ${deployReceipt.contractAddress}`);
```

---

## TODO

- web3js
  https://web3js.org/
- web3js 4.x
- sol 语法
