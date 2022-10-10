// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract cityPoll {
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }

    mapping(uint256 => City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added

    constructor() {
        //TODO set contract caller as owner
        owner = msg.sender;
        //TODO set some intitial cities.
        cities[cityCount++] = City("Kathmandu", 0);
        cities[cityCount++] = City("Dharan", 0);
    }

    function addCity(string memory _cityName) public {
        //  TODO: add city to the CityStruct
        cities[cityCount++] = City(_cityName, 0);
    }

    function vote(uint256 _cityID) public {
        //TODO Vote the selected city through cityID
        require(!hasVoted[msg.sender]);
        hasVoted[msg.sender] = true;
        cities[_cityID].vote++;
    }

    function getCity(uint256 _cityID) public view returns (string memory) {
        // TODO get the city details through cityID
        return cities[_cityID].cityName;
    }

    function getVote(uint256 _cityID) public view returns (uint256) {
        // TODO get the vote of the city with its ID
        return cities[_cityID].vote;
    }
}
