// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title GM - the simplest possible app on Limonata.
/// @notice Every `gm()` call is a real transaction. On Limonata the protocol
/// pays the gas (written into consensus), so the caller spends nothing.
contract GM {
    uint256 public total;
    mapping(address => uint256) public gms;

    event Gm(address indexed from, uint256 total);

    /// @notice Say gm. Costs the caller zero gas on Limonata.
    function gm() external {
        unchecked {
            total += 1;
            gms[msg.sender] += 1;
        }
        emit Gm(msg.sender, total);
    }
}
