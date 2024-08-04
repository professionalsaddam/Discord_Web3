// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract Dappcord is ERC721 {

    address public owner;

    uint256 public totalChannels;

    mapping(uint256 => Channel) public channels; 

    struct Channel{
        uint256 id;
        string name;
        uint256 cost;
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"Only Owner can access this");
        _;
    }

    constructor(string memory _name, string memory _symbol)
    ERC721(_name, _symbol)
    {
        owner = msg.sender;
    }

    function createChannel(
        string memory _name,
        uint256 _cost
    )
    public onlyOwner
    {

        totalChannels++;
        channels[totalChannels] = Channel(totalChannels, _name, _cost);

    }   

    function getChannel(uint256 _id) public view returns (Channel memory ) {
        return channels[_id];
    }

}
