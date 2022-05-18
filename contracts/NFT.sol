// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //version of solidity

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // various controls of ERC721
import "@openzeppelin/contracts/utils/Counters.sol"; // keep records of total tokens

contract NFT is ERC721 { //inherit NFT from ERC721
    using Counters for Counters.Counter; // track record of minted contracts
    Counters.Counter private currentTokenId;

    /// @dev Base token URI used as a prefix by tokenURI().
    string public baseTokenURI;
    
    constructor() ERC721("NFTTutorial", "NFT") {  //define contructor with name and symbol
        baseTokenURI = "";
    }
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    /// @dev Returns an URI for a given token ID
    function _baseURI() internal view virtual override returns (string memory) {
      return baseTokenURI;
    }

    /// @dev Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public {
      baseTokenURI = _baseTokenURI;
    }
}