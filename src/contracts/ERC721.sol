// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    mapping(uint256 => address) private tokenOwner;
    mapping(address => uint256) private ownedTokensCount;

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) public view returns(uint256) {
        require(_owner != address(0), "ERC721: Zero address entered");
       return ownedTokensCount[_owner];
    }

    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view returns (address){
        address owner = tokenOwner[_tokenId];
        require(owner != address(0), "ERC721: NFT assigned to zero address");
        return owner;
    }

    function exists(uint256 _tokenId) internal view returns(bool){
        address owner = tokenOwner[_tokenId];
        return owner != address(0);
    }

    function _mint(address _to, uint256 _tokenId) internal virtual {
        require(_to != address(0), "ERC721: Minting to the zero address");
        require(!exists(_tokenId), "ERC721: Token already minted");
        tokenOwner[_tokenId] = _to;
        ownedTokensCount[_to] += 1;

        emit Transfer(address(0), _to, _tokenId);
    }
}
