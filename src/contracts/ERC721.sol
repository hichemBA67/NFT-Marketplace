// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
    event Transfer(address indexed _from, address indexed _to, uint indexed _tokenId);

    mapping(uint => address) private tokenOwner;
    mapping(address => uint) private ownedTokensCount;

    function _mint(address _to, uint _tokenId) internal {
        require(_to != address(0), "ERC721: Minting to the zero address");
        require(!exists(_tokenId), "ERC721: Token already minted");
        tokenOwner[_tokenId] = _to;
   
        ownedTokensCount[_to] += 1;

        emit Transfer(address(0), _to, _tokenId);
    }

    function exists(uint _tokenId) internal view returns(bool){
        address owner = tokenOwner[_tokenId];
        return owner != address(0);
    }
}