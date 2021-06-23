pragma solidity =0.6.6;

import '@pancakeswap-libs/pancake-swap-core/contracts/interfaces/IPancakePair.sol';
import '@pancakeswap-libs/pancake-swap-core/contracts/interfaces/IPancakeFactory.sol';

contract Test1 {

    constructor() public {
    }

    function checkPairAddress(address factory, address token0, address token1) external pure returns (address pair) {
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'23e65c95865adff88333195bf94317521c15376ab98cd9872eaf19f50ea80495' // init code hash
            ))));
    }

    function createPairAddress(address factory, address token0, address token1, address param) external pure returns (address pair) {
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                param // init code hash
            ))));
    }

    function createPair(address factory, address token0, address token1) external returns (address pair) {
        pair = IPancakeFactory(factory).createPair(token0, token1);
    }

    function totalSupply(address factory, address token0, address token1, address param) external pure returns (string memory) {
        address pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                param // init code hash
            ))));
        return IPancakePair(pair).name();
    }
}
