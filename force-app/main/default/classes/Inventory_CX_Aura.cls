public with sharing class Inventory_CX_Aura {
    @AuraEnabled
    public static String searchText {
        get {
            return searchText;
        }
        set {
            searchtext = value;
        }
    }

    public Boolean matches {
        get {
            return ( (inventories != null) && (inventories.size() != 0) );
        }
        set;
    }

    public static Boolean searched {get; set;}                             
    public ApexPages.StandardSetController setCon { get; set; }     

    
    public Inventory_CX_Aura() {
        searched=false;
    }

    public List<Inventory__c> inventories {
        get {
            if (setCon != null ) {
                return (List<Inventory__c>)setCon.getRecords();
            } else {
                return null;
            }
        }
        set;
    }

    @AuraEnabled
    public static List<sObject> search(String searchText) {

        if(String.isBlank(searchText)){
            List<sObject> inventories = [SELECT Name, Family, Stock_Count__c, Currency__c 
                                         FROM Product2 WHERE Is_A_Service__c = false];
            return inventories;
        }
        if (String.isNotBlank(searchText) && searchtext.length() > 1) {
            
            List<sObject> inventories = [FIND :searchText
                                    IN ALL FIELDS
                                    RETURNING Product2 (Name, Family, Stock_Count__c, Currency__c WHERE Is_A_Service__c = false)][0];

            //setCon = new ApexPages.StandardSetController(inventories);
            //setCon.setPageNumber(1);
            //setCon.setPageSize(10);

            searched = true;
            return inventories;
        } /*else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                                    'Please enter search text at least one characters long'));
                                                    
        }*/
        return null;
        
        
    }
}