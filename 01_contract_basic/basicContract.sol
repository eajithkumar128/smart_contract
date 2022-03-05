// SPDX-License-Identifier: MIT

/*

Always add the version of solidity
The other ways of adding version
     >=0.8.1 <0.8.7
     ^0.8.0 -> So a pragma for a file which will not compile earlier than version 0.8.0 and it will also not work on a compiler starting from version 0.9.0 
*/
pragma solidity >=0.8.1 <0.8.7;


//Initialising the contract
contract Storage{

    /*  Types of declaring variables
        uint256, int256, bool, string, address, bytes32
        Variables can be public, private, memory, storage, internal
        If it is not explicitly mentioned it is taken as internal
    */
    uint256 favouriteNum;

    /*
        Basic function like in javascript. Since solidity is statically typed means we need to give
        variable datatype.
    */
    function setFavouriteNum(uint256 _favNum) public{
        favouriteNum = _favNum;
    }

    /* View and pure functions will not create transaction it is just to view the data from blockchain
        view and pure function will not modify the state and it is read only
        view can read state from blockchian but pure cant
    
    */
    function viewFavouriteNum() public view returns(uint256){
        return favouriteNum;
    }

    //pure function example
    function addNum(uint32 x, uint32 y)public pure returns(uint32){
        return x + y;
    }


    //Array in solidity
    struct Players{
        string name;
        uint256 playerNum;
    }

    // Initialising a dynamic array of players
    Players[] public player;

    // Adding players to the array
    function addPlayers(string memory name, uint256 playerNum) public{
        //Players({name: name, playerNum: playerNum}) it can be given in this format too
        player.push(Players(name, playerNum));
        numToPlayerMap[playerNum] = name;
    }

    //Mapping acts like hash tables with key value pair
    mapping(uint256 => string) public  numToPlayerMap;


}