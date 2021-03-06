pragma solidity ^0.4.24;


import "./Ownable.sol";


/**
 * @dev The contract has an owner address, and provides basic authorization control whitch
 * simplifies the implementation of user permissions. This contract upgrades Ownable contracts with additional claim step which makes ownership
 * transfers less prone to errors.
 * @title Claimable
 */
contract Claimable is Ownable {
    address public pendingOwner;

    /**
     * @dev An event which is triggered when the owner is changed.
     * @param previousOwner The address of the previous owner.
     * @param newOwner The address of the new owner.
     */
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Allows the current owner to give new owner ability to claim the ownership of the contract.
     * This differs from the Owner's function in that it allows setting pedingOwner address to 0x0,
     * which effectively cancels an active claim.
     * @param _newOwner The address which can claim ownership of the contract.
     */
    function transferOwnership(
        address _newOwner
    )
        onlyOwner
        public
    {
        pendingOwner = _newOwner;
    }

    /**
     * @dev Allows the current pending owner to claim the ownership of the contract. It emits
     * OwnershipTransferred event and resets pending owner to 0.
     */
    function claimOwnership()
        public
    {
        require(msg.sender == pendingOwner);
        address previousOwner = owner;
        owner = pendingOwner;
        pendingOwner = 0;
        emit OwnershipTransferred(previousOwner, owner);
    }
}
