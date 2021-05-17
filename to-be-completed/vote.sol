pragma solidity ^0.6.0;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping(uint256=>City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address=>bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added
    constructor() public {
        owner = msg.sender;
        addCity("Kathmandu");
        addCity("Pokhara");
        addCity("Birgunj");
        addCity("Biratnagar");
    
    //TODO set contract caller as owner
    //TODO set some intitial cities.
    }
 
 
    function addCity(string memory name) public {
      //  TODO: add city to the CityStruct
      cityCount++;
      cities[cityCount].cityName = name;
      cities[cityCount].vote = 0;
      

    }
    
    function vote(uint cityID) public {
         require(
            !hasVoted[owner],
            "You have already voted!"
        );
        cities[cityID].vote++;
        hasVoted[owner] = true;
        //TODO Vote the selected city through cityID

    }
    function getCity(uint256 cityID) public view returns (string memory name) {
         return cities[cityID].cityName;
     }
     // TODO get the city details through cityID
    function getVote(uint256 cityID) public view returns (uint256) {
    // TODO get the vote of the city with its ID
         return cities[cityID].vote;
    }
}
