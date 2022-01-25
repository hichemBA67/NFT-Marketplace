// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract NFTMarketplace is ERC721Connector {

    string[] public nfts;
    mapping(string => bool) nftsExist;

    constructor() ERC721Connector("NFTMarketplace", "NTFMRKTPLC") {}

    function mint(string memory _nft) public {
        require(!nftsExist[_nft], "NFTMarketplace: Kryptobird already exists");
        nfts.push(_nft);
        // .push does not return length of array anymore
        uint256 id = nfts.length - 1;
        _mint(msg.sender, id);
        nftsExist[_nft] = true;
    }


}