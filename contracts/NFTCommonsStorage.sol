// SPDX-License-Identifier: MIT
pragma solidity  >0.8.0 <0.9.0;

import "./ERC1155.sol";

contract NFTStorage is ERC1155 {
    mapping (address => uint256) private _id;
    
    function newToken(uint256 tokenID, string memory uri, uint256 amount_) public onlyWhilte {
        require(!isExists(_msgSender(), tokenID), "NFTStorage: is exists");
        _mint(_msgSender(), tokenID, amount_, bytes("0"));
        _setURI(tokenID, uri);
    }

    function isExists(address addr, uint256 tokenID) public view returns(bool) {
        return balanceOf(addr, tokenID) != 0;
    }

}