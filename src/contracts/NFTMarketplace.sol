// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract NFTMarketplace is ERC721Connector {

    string[] public kryptoBirdz;
    mapping(string => bool) kryptoBirdzExist;

    constructor() ERC721Connector("NFTMarketplace", "NTFMRKTPLC") {}

    function mint(string memory _kryptobird) public {
        require(!kryptoBirdzExist[_kryptobird], "NFTMarketplace: Kryptobird already exists");
        kryptoBirdz.push(_kryptobird);
        // .push does not return length of array anymore
        uint id = kryptoBirdz.length - 1;
        _mint(msg.sender, id);
        kryptoBirdzExist[_kryptobird] = true;
    }


}