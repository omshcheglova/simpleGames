// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RLottery {
  struct player{
    uint Num;
  }
  mapping(uint => player) public players;

  function getTickets(uint Num) public payable {
    require(Num <=10, "10!");
    players[Num] = player(Num); 
  }
  function Winner() public view returns(string memory, uint) {
    uint Lenght = 10;
    uint index;
    uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, Lenght))) %9;
    randomNumber++;
    index = randomNumber % 10;
    return ("Number", index);
  }
}
