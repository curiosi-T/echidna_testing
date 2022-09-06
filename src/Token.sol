// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;


contract Pausable {
    bool is_paused;
    address owner = msg.sender;

    function paused() isOwner public {
        is_paused = true;
    }

    function resume() public {
        is_paused = false;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}

contract Token is Pausable {
    mapping(address => uint256) public balances;
    bool applyFee;

    constructor() {
        is_paused = true;
    }

    function transfer(address to, uint256 amount) public {
        require(!is_paused);

        uint256 initial_balance_from = balances[msg.sender];
        uint256 initial_balance_to = balances[to];

        balances[msg.sender] -= amount;
        balances[to] += amount;

        //assert(balances[msg.sender] <= initial_balance_from);
        //assert(balances[to] >= initial_balance_to);
    }

    function mint(address to, uint amount) isOwner public {
        balances[to] += amount;
    } 

    function toggleFee() public {
        require(!is_paused);
        applyFee = !applyFee;
    }
}