```javascript
const express = require('express');
const Web3 = require('web3');
const contract = require('@truffle/contract');
const tokenContractJSON = require('./build/contracts/TokenContract.json');

const app = express();
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545')); // Replace with your Ethereum node RPC URL

const TokenContract = contract(tokenContractJSON);
TokenContract.setProvider(web3.currentProvider);

app.use(express.json());

app.post('/mint', async (req, res) => {
    const { to, amount } = req.body;
    try {
        const accounts = await web3.eth.getAccounts();
        const tokenContract = await TokenContract.deployed();
        await tokenContract.mint(to, amount, { from: accounts[0] });
        res.send({ message: 'Tokens minted successfully' });
    } catch (error) {
        res.status(500).send({ error: 'Error minting tokens' });
    }
});

app.post('/burn', async (req, res) => {
    const { from, amount } = req.body;
    try {
        const accounts = await web3.eth.getAccounts();
        const tokenContract = await TokenContract.deployed();
        await tokenContract.burn(from, amount, { from: accounts[0] });
        res.send({ message: 'Tokens burned successfully' });
    } catch (error) {
        res.status(500).send({ error: 'Error burning tokens' });
    }
});

app.post('/transfer', async (req, res) => {
    const { from, to, amount } = req.body;
    try {
        const accounts = await web3.eth.getAccounts();
        const tokenContract = await TokenContract.deployed();
        await tokenContract.transfer(to, amount, { from });
        res.send({ message: 'Tokens transferred successfully' });
    } catch (error) {
        res.status(500).send({ error: 'Error transferring tokens' });
    }
});

app.listen(3000, () => console.log('Server running on port 3000'));
```
