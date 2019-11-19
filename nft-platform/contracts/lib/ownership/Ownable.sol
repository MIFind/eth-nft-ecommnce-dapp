pragma solidity ^0.4.24;


/**
 * @dev The contract has an owner address, and provides basic authorization control which
 * simplifies the implementation of user permissions.
 * @title Ownable
 */
contract Ownable {
    address public owner;

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
     * @dev The constructor sets the original `owner` of the contract to the sender account.
     */
    constructor()
        public
    {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(
        address _newOwner
    )
        onlyOwner
        public
    {
        require(_newOwner != address(0));
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
}
