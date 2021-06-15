@isTest
private class InventoryTest {
    
    @testSetup
    private static void loadTestData() {
        List<Product2> testInv = new List<Product2>();
        for(Integer i=0;i<4;i++) {
            testInv.add(new Product2(Name = 'testInvName'+i, Family = 'Food'));
        }
        insert testInv;    
    }
    
    @isTest
    private static void testSearchText() {
        List<Product2> pResults = Inventory_CX_Aura.search('testInv');
        System.debug(pResults.size());
        System.assertEquals(pResults.size(), 4);     
    }
    
    /*
     @isTest
    private static void testMatches() {
        Inventory_CX inventory = new Inventory_CX();
        inventory.matches = false;
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
    */

}