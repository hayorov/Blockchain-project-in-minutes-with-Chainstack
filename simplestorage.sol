pragma solidity >0.4.0;

contract simplestorage {

  int public familyBalance;
  address public otherParentAddr;
  address public balanceSetterAddr;

  constructor(address parentAddr) public {
    familyBalance = 0;
    balanceSetterAddr = msg.sender;
    otherParentAddr = parentAddr;
  }

  function makeRecord(int x) public {
    if (x <= 0) {
        familyBalance = familyBalance + x;
    }
    else {
        if (msg.sender == balanceSetterAddr || msg.sender == otherParentAddr) {
            familyBalance = familyBalance + x;
        }
    }
  }

  function getBalance() public view returns (int retVal) {
    return familyBalance;
  }

}