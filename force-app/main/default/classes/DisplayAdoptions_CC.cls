public with sharing class DisplayAdoptions_CC {
    public String pet {
        get {
            return pet;
        }
        set {
            pet = value;
        }
    }

    // Indicates whether records were found
    public Boolean matches {
        get {
            return ( (pets != null) && (pets.size() != 0) );
        }
        set;
    }

    public Boolean searched {get; set;}                             // Indicates whether search has been done
    public ApexPages.StandardSetController setStandCon { get; set; }     // Standard Set Controller

    // Constructor
    public DisplayAdoptions_CC() {
        searched=false;
    }

    // List of Contacts displayed on the page
    public List<Adoption__c> pets {
        get {
            if (setStandCon != null ) {
                return (List<Adoption__c>)setStandCon.getRecords();
            } else {
                return null;
            }
        }
        set;
    }

    // Action method initiated by user
    public void Search() {

        if (String.isNotBlank(pet)) {
            List<sObject> pets = [SELECT Id, Name, Animal_Type__C, Animal_Age__c, Status__c From Adoption__c 
                                  											WHERE Name LIKE :pet
                                 											OR Animal_Type__c LIKE :pet];

            setStandCon = new ApexPages.StandardSetController(pets);
            setStandCon.setPageNumber(1);
            setStandCon.setPageSize(10);

            searched = true;
        }else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Please enter search text'));
        } 
    }
}