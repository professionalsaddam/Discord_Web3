// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract Dappcord is ERC721 {

    address public owner;

    uint256 public totalChannels;

    uint256 public totalSupply;

    mapping(uint256 => Channel) public channels; 

    mapping(uint256 => mapping(address => bool)) public  hasJoined; 

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


    function mint(
        uint256 _id
    )
    public payable
    {
        require(_id != 0, "Channel ID should not be 0");
        require(_id <= totalChannels, "Incorrect Channel ID");
        require(hasJoined[_id][msg.sender] == false, "User Already Joined");
        require(msg.value >= channels[_id].cost, "Insufficient Amount");


        hasJoined[_id][msg.sender] = true;
        totalSupply++;

        _safeMint(msg.sender, totalSupply);

    }


    function getChannel(uint256 _id) public view returns (Channel memory ) {
        return channels[_id];
    }


    function withdraw() public onlyOwner {
        (bool success, ) = owner.call{value : address(this).balance}(""); 
        require(success);
    }

}
