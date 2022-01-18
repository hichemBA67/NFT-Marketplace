// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721Metadata {

    string private name;
    string private symbol;

    constructor(string memory _named, string memory _symbolified) {
        name = _named;
        symbol = _symbolified;
    }

    function getName() external view returns(string memory){
        return name;
    }

    function getSymbol() external view returns(string memory) {
        return symbol;
    }
}