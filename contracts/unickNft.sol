// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-solidity/contracts/utils/Counters.sol";


contract unickNft is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs;
    struct item {
        uint256 id;
        address creator ;
        string url;
    }
    mapping ( uint256 => item) public _items;
    
    constructor() ERC721("Unick", "UNK") {
        
    }
    
    function CreateNft(string memory url) public returns (uint256){
        _tokenIDs.increment();
        uint256 tokenId  = _tokenIDs.current();
        _safeMint(msg.sender , tokenId);
        
        _items[tokenId] = item(tokenId, msg.sender , url);
        
        return tokenId;
        
    } 
      function tokenURI(uint256 tokenId) public view  override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        return _items[tokenId].url;
        
    }
}