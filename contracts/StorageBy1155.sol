// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC1155/ERC1155.sol)

pragma solidity ^0.8.0;

import "./libraries/ERC1155.sol";
import "./libraries/SafeMath.sol";

/**
 * @dev Implementation of the basic standard multi-token.
 * See https://eips.ethereum.org/EIPS/eip-1155
 * Originally based on code by Enjin: https://github.com/enjin/erc-1155
 *
 * _Available since v3.1._
 */
contract StorageBy1155 is ERC1155 {
    using SafeMath for uint256;

    uint256 private _currentTokenID = 0;
    mapping (uint256 => address) public creators;
    mapping (uint256 => uint256) public tokenSupply;

    modifier creatorOnly(uint256 _id) {
        require(creators[_id] == _msgSender(), "1155Storage: ONLY_CREATOR_ALLOWED");
        _;
    }
    

    function create(address to, uint256 amount, string calldata uri, bytes calldata data) public onlyWhilte {
        uint256 id = _getNextTokenID();
        _incrementTokenTypeId();
        creators[id] = _msgSender();
        _mint(to, id, amount, data);
        if (bytes(uri).length > 0) _setURI(id, uri);
        tokenSupply[id] = amount;
    }

    function mint(address to, uint256 _id, uint256 quantity, bytes calldata data) public creatorOnly(_id) {

    }

    function _getNextTokenID() private view returns(uint256) {
        return _currentTokenID.add(1);
    }

    function _incrementTokenTypeId() private {
        _currentTokenID++;
    }

    function _exists(uint256 tokenID) internal view returns(bool) {
        return creators[tokenID] != address(0);
    }
}
