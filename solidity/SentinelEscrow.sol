pragma solidity ^0.4.19;

contract SentinelEscrow {

    address public buyer;
    address public seller;
    address public arbiter;
    address owner;

    function SentinelEscrow(address _seller, address _arbiter) {
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function payoutToSeller() {
        if(msg.sender == buyer || msg.sender == arbiter) {
            seller.transfer(this.balance);
        }
    }

    function refundToBuyer() {
        if(msg.sender == seller || msg.sender == arbiter) {
            buyer.transfer(this.balance);
        }
    }

    function getBalance() constant returns (uint) {
        return this.balance;
    }

    function setSeller(address _seller) public {
        seller = _seller;
    }

    function setArbiter(address _arbiter) public {
        arbiter = _arbiter;
    }

    function getSeller() public constant returns (address) {
        return seller;
    }

    function getArbiter() public constant returns (address) {
        return arbiter;
    }

}
