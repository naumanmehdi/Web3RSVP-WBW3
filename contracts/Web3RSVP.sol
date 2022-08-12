//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// Defining events 
contract Web3RSVP {
    struct CreateEvent {
        bytes32 eventId;
        string eventDataCID;
        address eventOwner;
        uint256 eventTimestamp;
        uint256 deposit;
        uint256 maxCapacity;
        address[] confiremedRSVP;
        address[] claimedRSVP;
        bool paidOut;
    }
    // handling Multiple events 
    mapping(bytes32 => CreateEvent) public idToEvent;

    // Defining Functions 
    function CreateNewEvent(
        uint256 eventTimestamp,
        uint256 deposit,
        uint256 maxCapacity,
        string calldata eventDataCID
    ) external {
        // generate an eventID based on other things passed in to generate a hash
        bytes32 eventId = keccak256(
            abi.encodePacked(
                msg.sender,
                address(this),
                eventTimestamp,
                deposit,
                maxcapacity
            )
        );

       address[] memory confirmedRSVP;
       address[] memory claimedRSVP;

       // this creates a new CreateEvent struct and adds it to the idToEvent mapping
       idToEvent[eventId] = CreateEvent(
           eventId,
           eventDataCID,
           msg.sender,
           eventTimestamp,
           deposit,
           maxCapacity,
           confirmedRSVP,
           claimedRSVP,
           false
       ); 
    }
}
