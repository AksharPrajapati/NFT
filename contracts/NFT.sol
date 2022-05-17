// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //version of solidity

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // various controls of ERC721
import "@openzeppelin/contracts/utils/Counters.sol"; // keep records of total tokens

contract NFT is ERC721 { //inherit NFT from ERC721
    using Counters for Counters.Counter; // track record of minted contracts
    Counters.Counter private currentTokenId;
    
    constructor() ERC721("NFTTutorial", "NFT") {} //define contructor with name and symbol
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }
}