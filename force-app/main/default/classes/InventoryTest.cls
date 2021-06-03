@isTest
private class InventoryTest {
    
    @testSetup
    private static void loadTestData() {
        List<Inventory__c> testInv = new List<Inventory__c>();
        for(Integer i=0;i<4;i++) {
            testInv.add(new Inventory__c(Name = 'testInvName'+i, Item_Cost__c = 20 + i, Item_Type__c = 'Food', Stock_Count__c = 10 + i));
        }
        insert testInv;    
    }
    
    @isTest
    private static void testSearchText() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.searchText = 'testInvName';
        System.assertEquals('testInvName', inventory.searchText);     
    }

     @isTest
    private static void testMatches() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.matches =false;
        System.assertEquals(false, inventory.matches);    
    }

    @isTest
    private static void testSearched() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.searched =true;
        System.assertEquals(true, inventory.searched);    
    }

    @isTest
    private static void testInventories() {
        Inventory_CX inventory = new Inventory_CX();
        List<Inventory__c> testInv = [SELECT Name, Item_Cost__c, Item_Type__c, Stock_Count__c FROM Inventory__c];
        inventory.inventories =testInv;
        System.assertNotEquals(testInv, inventory.inventories);    
    }

    @isTest
    private static void testInventoryCX() {
        Inventory_CX inventory = new Inventory_CX();   
    }

    @isTest
    private static void testSearchMethod() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.searchText = 'testInvName';
        inventory.Search();
        System.assertEquals(true, inventory.searched);    
    }

    @isTest
    private static void testSearchMethodFalse() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.searchText = 't';
        inventory.Search();
        System.assertEquals(true, ApexPages.hasMessages(ApexPages.Severity.ERROR));    
    }

}