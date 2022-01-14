// SPDX-License-Identifier: MIT
pragma solidity  >0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract WhilteList is Ownable {
    /**
     * @dev Using EnumrableSet
     */
    using EnumerableSet for EnumerableSet.AddressSet;

    /**
     * @dev recoin accounts
     */
    EnumerableSet.AddressSet private _whilteAddress;

    modifier onlyWhilte {
        require(_whilteAddress.contains(_msgSender()), "WhilteList: not allow");
        _;
    }
    
    function addWhilte(address account) public onlyOwner {
        _whilteAddress.add(account);
    }
    
    function rmWhilte(address account) public onlyOwner {
        _whilteAddress.remove(account);
    }

    function whilteExists(address account) public view returns(bool) {
        return _whilteAddress.contains(account);
    }
}