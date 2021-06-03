public with sharing class Inventory_CX {


    public String searchText {
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

    public Boolean searched {get; set;}                             
    public ApexPages.StandardSetController setCon { get; set; }     

    
    public Inventory_CX() {
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

    public void Search() {

        if(String.isBlank(searchText)){
            List<sObject> inventories = [SELECT Name, Item_Type__c, Item_Cost__c, Stock_Count__c FROM Inventory__c];
        }
        if (String.isNotBlank(searchText) && searchtext.length() > 1) {
            
            List<sObject> inventories = [FIND :searchText
                                      IN ALL FIELDS
                                      RETURNING Inventory__c  (Name, Item_Type__c, Item_Cost__c, Stock_Count__c)][0];

            setCon = new ApexPages.StandardSetController(inventories);
            setCon.setPageNumber(1);
            setCon.setPageSize(10);

            searched = true;
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                                      'Please enter search text at least one characters long'));
        }
    }
}