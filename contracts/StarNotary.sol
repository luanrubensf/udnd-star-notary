// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract StarNotary is ERC721 {

    constructor() ERC721("StarNotary", "STAR") {}

    struct Star {
        string name;
    }

    mapping(uint256 => Star) public tokenIdToStarInfo;

    mapping(uint256 => uint256) public starsForSale;

        
    function createStar(string memory _name, uint256 _tokenId) public {
        Star memory newStar = Star(_name);
        tokenIdToStarInfo[_tokenId] = newStar;
        _mint(msg.sender, _tokenId);
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You can't sale the Star you don't owned");
        starsForSale[_tokenId] = _price;
    }

    function _make_payable(address x) internal pure returns (address payable) {
        return payable(address(uint160(x)));
    }

    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");

        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);

        require(msg.value > starCost, "You need to have enough Ether");
        
        _transfer(ownerAddress, msg.sender, _tokenId);
        
        address payable ownerAddressPayable = _make_payable(ownerAddress);
        address payable senderAddressPayable = _make_payable(msg.sender);

        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            senderAddressPayable.transfer(msg.value - starCost);
        }
    }

    function lookUptokenIdToStarInfo (uint _tokenId) public view returns (string memory) {
        Star memory starInfo = tokenIdToStarInfo[_tokenId];
        return starInfo.name;
    }

    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        address ownerToken1 = ownerOf(_tokenId1);
        address ownerToken2 = ownerOf(_tokenId2);

        require(ownerToken1 == msg.sender || ownerToken2 == msg.sender,
            "The sender should be owner of one of the tokens");

        _transfer(ownerToken1, ownerToken2, _tokenId1);
        _transfer(ownerToken2, ownerToken1, _tokenId2);
    }

    function transferStar(address _to1, uint256 _tokenId) public {
        address owner = ownerOf(_tokenId);
        
        require(msg.sender == owner, "The sender is not the owner");

        transferFrom(msg.sender, _to1, _tokenId);
    }
}
