// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyGame {
address payable[] public players;

function getRandomNumber (uint number) public view returns(uint) {
    uint CompChoice = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, number)))% 3;
    return CompChoice;
}
    
function Enter() public payable returns(uint) {
    require(msg.value > .001 ether, "Bet is too low!");
    players.push(payable(msg.sender));
  }   
    
 function Winner()  public  payable returns(string memory, uint, uint) {
    uint player1 = getRandomNumber(0);
    uint player2 = getRandomNumber(1);

    if (player1 ==0 && player2 == 1 || player1 ==0 && player2 ==2 || player1 ==1 && player2 == 2) {
      players[0].transfer(address(this).balance);
      return("Player 1  win!", player1, player2);
    }
    else if (player1 == 2 && player2 ==0 ||player1 == 2 && player2 ==1 || player1 == 1 && player2 ==0) {
      players[1].transfer(address(this).balance);
      return ("Player 2 win!", player1, player2);
    }
    else return ("draw", player1, player2);
  
}
}
