# Basic

## 0x01 Start

> code
>
> https://github.com/fivge/web3/tree/master/01.basic/01

### 1、部署合约

> ```js
> new web3.eth.Contract(abi).deploy;
> web3.eth.accounts.signTransaction;
> web3.eth.sendSignedTransaction;
> ```

#### a、编译合约

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

#### b、构造 web3 对象

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

#### c、获取账户地址

在区块链上, 每个用户都有一个对应的账户地址, 而这个账户地址可以通过私钥进行获取. 这里, 我们调用 web3.eth.accounts.privateKeyToAccount 接口, 传入对应的私钥, 就可以获取对应的账户地址

```js
const account = web3.eth.accounts.privateKeyToAccount(privatekey);
const account_from = {
  privateKey: privatekey,
  accountAddress: account.address,
};
```

#### d、部署合约

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

使用发送签名后的交易到区块链网络, 同时会去返回的交易回执. 从返回的交易回执中可以得到此次部署的**合约的地址**

`https://sepolia.etherscan.io/address/${deployReceipt.contractAddress}`

```js
const deployReceipt = await web3.eth.sendSignedTransaction(deployTransaction.rawTransaction);

// Your deployed contrac can be viewed at: https://sepolia.etherscan.io/address/${deployReceipt.contractAddress}
console.log(`Contract deployed at address: ${deployReceipt.contractAddress}`);
```

### 2、交易和事件

> 对交易进行签名，发送，接收交易回执，验证交易执行结果

> 对一个事件进行一次或多次监听

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Incrementer {
    uint256 public number;

    event Increment(uint256 value);
    event Reset();

    constructor(uint256 _initialNumber) {
        number = _initialNumber;
    }

    function increment(uint256 _value) public {
        require(_value > 0, "increment value should be positive number");
        number = number + _value;
        emit Increment(_value);
    }

    function reset() public {
        number = 0;
        emit Reset();
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
```

#### a、加载合约实例

> 通过已经部署的合约地址加载合约实例

```js
let incrementer = new web3.eth.Contract(abi, createReceipt.contractAddress);
```

#### b、与合约交互

在拥有一个已经上链的合约实例后, 就可以和合约进行交互

合约接口分为只读和交易接口, 其中**只读接口**不会产生区块, 而**交易接口**调用会在区块链网络上产生相应的区块数据

交易接口：
构造交易 -> 发送交易并获取回执
交易的构造, 即编码合约接口及相应的传入参数
调用 sendSignedTransaction 接口, 发送上一步变码好的交易, 同时获取交易回执用户检查交易的处理结果

```js
// 只读
let number = await incrementer.methods.getNumber().call();
console.log(`The current number stored is: ${number}`);

// 交易
let incrementTx = incrementer.methods.increment(5);
let incrementTransaction = await web3.eth.accounts.signTransaction(
  {
    to: createReceipt.contractAddress,
    data: incrementTx.encodeABI(),
    gas: 8000000,
  },
  account_from.privateKey
);
const incrementReceipt = await web3.eth.sendSignedTransaction(incrementTransaction.rawTransaction);
```

#### c、监听事件

在合约接口调用中, 除了接口返回的结果外, 唯一能获取接口处理中间信息的方法便是 "事件"
在接口中, 通过触发一个事件, 然后在外部捕获区块产生的事件, 就可以获取相应的内部信息

- 一次性事件监听器 once
- 持续性事件监听器 events subscribe

```js
incrementer.once('Increment', (error, event) => {
  console.log('I am a onetime event listner, I am going to die now');
});
```

```js
// TODO 待验证
incrementer.events.Increment(() => {
  console.log('I am a longlive event listener, I get a event now');
});
```

```js
const web3Socket = new Web3('wss://sepolia.infura.io/ws/v3/' + process.env.INFURA_ID);

web3Socket.eth
  .subscribe(
    'logs',
    {
      address: createReceipt.contractAddress,
      topics: [],
    },
    (error, result) => {
      if (error) {
        console.error(error);
      }
    }
  )
  .on('data', event => {
    console.log('New event: ', event);
  })
  .on('error', error => {
    console.error('Error: ', error);
  });

web3Socket.eth.clearSubscriptions();
```

#### d、其他

```js
const pastEvents = await incrementer.getPastEvents('Increment', {
  fromBlock: deployedBlockNumber,
  toBlock: 'latest',
});

pastEvents.map(event => {
  console.log(event);
});
```

- 错误处理

```js
incrementTx = incrementer.methods.increment(0);
incrementTransaction = await web3.eth.accounts.signTransaction(
  {
    to: createReceipt.contractAddress,
    data: incrementTx.encodeABI(),
    gas: 8000000,
  },
  account_from.privateKey
);
await web3.eth.sendSignedTransaction(incrementTransaction.rawTransaction).on('error', console.error);
```

---

## FAQ

##### Error: Returned error: replacement transaction underpriced

```
Error: Returned error: replacement transaction underpriced
```
