public with sharing class DisplayPetHotel_CC {
    public String searchName {
        get {
            return searchName;
        }
        set {
            searchName = value;
        }
    }

    // Indicates whether records were found
    public Boolean matches {
        get {
            return ( (bookings != null) && (bookings.size() != 0) );
        }
        set;
    }
    //search check
    public Boolean searched {get; set;} 
    // Standard Set Controller
    public ApexPages.StandardSetController setStandCon { get; set; }

    // Constructor
    public DisplayPetHotel_CC() {
        searched=false;
    }

    // List of Contacts displayed on the page
    public List<Pet_Hotel__c> bookings {
        get {
            if (setStandCon != null ) {
                return (List<Pet_Hotel__c>)setStandCon.getRecords();
            }else{
                return null;
            }
        }
        set;
    }

    // Search Method
    public void Search() {

        if (String.isNotBlank(searchName)) {
            
            List<sObject> bookings = [SELECT Id, Name, Type_of_Pet__c, Pet_Owner__c, Check_In__c, Check_Out__c From Pet_Hotel__c 
                                  											WHERE Name LIKE :searchName
                                 											OR Pet_Owner__c LIKE :searchName];

            setStandCon = new ApexPages.StandardSetController(bookings);
            setStandCon.setPageNumber(1);
            setStandCon.setPageSize(10);

            searched = true;
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Please enter search text'));
        }
    }
}