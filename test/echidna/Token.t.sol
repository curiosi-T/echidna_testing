// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

import "../../src/Token.sol";

contract TokenTest is Token {
    constructor() public {
        //is_paused = true;
        mint(address(0x20000), 1 ether);
        mint(address(0x30000), 1 ether);
    }

    // property test system invariant
    function echidna_test_pause() public view returns (bool) {
        return applyFee == false;
    }

    // assertion test 
    function test_transfer(address to, uint value) public {
        //require(0 > 1, "FOUNDRY::ASSUME");
        uint256 initial_balance_from = balances[msg.sender];
        uint256 initial_balance_to = balances[to];

        transfer(to, value);
        
        assert(balances[msg.sender] <= initial_balance_from);
        assert(balances[to] >= initial_balance_to);
    }

    // dapp/foundry test

    // function echidna_balance_of_total_supply() public returns(bool) {
    //     return balanceOf(msg.sender) <= totalSupply;
    // }

    // function test_commutative(uint a, uint b) public {
    //     assert(add(a,b) == add(b,a));
    // }
}