// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Enumerable is ERC721 {

    uint256[] private allTokens;
    // Mapping from tokenIdto position in allToken[]
    mapping(uint256 => uint256) private allTokensIndex;
    // Mapping from owner to list of all owner tokenIds
    mapping(address => uint256[]) private ownedTokens;
    // Mapping from tokenId to index of the owner tokens list
    mapping(uint256 => uint256) private ownedTokensIndex;

    function totalSupply() external view returns (uint256) {
        return allTokens.length;
    }

    //function tokenByIndex(uint256 _index) external view returns (uint256);

    //function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);

    function _mint(address _to, uint256 _tokenId) internal override(ERC721) {
        super._mint(_to, _tokenId);
        _addTokensToTotalSupply(_tokenId);
    }

    function _addTokensToTotalSupply(uint256 _tokenId) private {
        allTokens.push(_tokenId);
    }
}