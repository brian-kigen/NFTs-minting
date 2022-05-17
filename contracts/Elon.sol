// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

//ERC721 it is the standard for the NFTs which stands for (ETHEREUM REQUESTS FOR COMMENT.)
// NFTs have its own properties; name, description, url of the image, and attributes.

contract ElonNFT is ERC721URIStorage {
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;
 
   constructor() ERC721("ElonMusk", "ELON") {}
 
   function mintNFT()
       public
       returns (uint256)
       {
           _tokenIds.increment();
           uint256 newItemId = _tokenIds.current();

           _mint(msg.sender, newItemId);

           _setTokenURI(newItemId, "https://jsonkeeper.com/b/YKMF");

           console.log("The NFT ID %s has been minted to %s", newItemId, msg.sender);
          return newItemId;
       }
}