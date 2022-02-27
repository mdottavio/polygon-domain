//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    mapping(string => address) public domains;

    // Checkout our new mapping! This will store values
    mapping(string => string) public records;

    event NewDomain(string domain, address sender);

    constructor() {
        console.log("Domain contract,on");
    }

    // A register function that adds their names to our mapping
    function register(string calldata name) public {
        // Check that the name is unregistered (explained in notes)
        require(domains[name] == address(0), "Domain already registered");
        domains[name] = msg.sender;
        emit NewDomain(name, msg.sender);
        console.log("%s has registered a domain!", msg.sender);
    }

    // This will give us the domain owners' address
    function getAddress(string calldata name) public view returns (address) {
        return domains[name];
    }

    function setRecord(string calldata name, string calldata record) public {
        // Check that the owner is the transaction sender
        require(domains[name] == msg.sender, "not the ownser of the domain");
        records[name] = record;
    }
}
