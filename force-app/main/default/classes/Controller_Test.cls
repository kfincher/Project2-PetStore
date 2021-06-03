@isTest
private class Controller_Test {
    @isTest
    private static void searchNameTestHotel(){
        DisplayPetHotel_CC display = new DisplayPetHotel_CC();
        display.searchName = 'Dash';
        System.assertEquals('Dash', display.searchName);
    }
    
    @isTest
    private static void matchTestFalseHotel(){
        DateTime checkIn = DateTime.newInstance(2021, 5, 27, 08, 30, 0);
        DateTime checkOut = DateTime.newInstance(2021, 5, 28, 15, 30, 0);
        String petName = 'Dash';
        String diffPetName = 'Bud';
        Decimal roomNum = 101;
        Pet_Hotel__c p = new Pet_Hotel__c(Name=petName, Type_of_Pet__c='Dog',
                                                            Pet_Owner__c='Test Smith', Check_In__c = checkIn, 
                                                            Check_Out__c=checkOut, Room_Type__c='Standard', 
                                                           Room_Number__c= roomNum);
        List<Pet_Hotel__c> bookings = new List<Pet_Hotel__c>();
        bookings.add(p);
        insert bookings;
        DisplayPetHotel_CC display = new DisplayPetHotel_CC();
        display.searchName = diffPetname;
        display.Search();
        System.assertEquals(false, display.matches);
    }
    
    @isTest
    private static void matchTestTrueHotel(){
        DateTime checkIn = DateTime.newInstance(2021, 5, 27, 08, 30, 0);
        DateTime checkOut = DateTime.newInstance(2021, 5, 28, 15, 30, 0);
        String petName = 'Dash';
        Decimal roomNum = 101;
        Pet_Hotel__c p = new Pet_Hotel__c(Name=petName, Type_of_Pet__c='Dog',
                                                            Pet_Owner__c='Test Smith', Check_In__c = checkIn, 
                                                            Check_Out__c=checkOut, Room_Type__c='Standard', 
                                                           Room_Number__c= roomNum);
        List<Pet_Hotel__c> bookings = new List<Pet_Hotel__c>();
        bookings.add(p);
        insert bookings;
        DisplayPetHotel_CC display = new DisplayPetHotel_CC();
        display.searchName = petname;
        display.Search();
        System.assertEquals(true, display.matches);
    }
    
    @isTest
    private static void searchTestErrorHotel(){
        DisplayPetHotel_CC display = new DisplayPetHotel_CC();
        display.searchName = '';
        display.Search();
        System.assertEquals(true,ApexPages.hasMessages(ApexPages.severity.ERROR));
        System.assertEquals(false,display.searched);
    }
    @isTest
    private static void searchTestSuccessHotel(){
        DateTime checkIn = DateTime.newInstance(2021, 5, 27, 08, 30, 0);
        DateTime checkOut = DateTime.newInstance(2021, 5, 28, 15, 30, 0);
        String petName = 'Dash';
        Decimal roomNum = 101;
        Pet_Hotel__c p = new Pet_Hotel__c(Name=petName, Type_of_Pet__c='Dog',
                                                            Pet_Owner__c='Test Smith', Check_In__c = checkIn, 
                                                            Check_Out__c=checkOut, Room_Type__c='Standard', 
                                                           Room_Number__c= roomNum);
        DisplayPetHotel_CC display = new DisplayPetHotel_CC();
        display.searchName = petname;
        display.Search();
        System.assertEquals(true,display.searched);
        System.assertEquals(false,ApexPages.hasMessages(ApexPages.severity.ERROR));
    }
    ////stop here
    @isTest
    private static void searchNameTestAdopt(){
        DisplayAdoptions_CC display = new DisplayAdoptions_CC();
        display.pet = 'Dash';
        System.assertEquals('Dash', display.pet);
    }
    
    @isTest
    private static void matchTestFalseAdopt(){
        String petName = 'Dash';
        Date startDate = Date.newInstance(2021, 5, 27);
        String diffPetName = 'Bud';
        Adoption__c a = new Adoption__c(Name=petName, Animal_Type__c='Dog', Animal_Age__c='Adult', Status__c='New', 
                                       Shelter_Start_Time__c = startDate);
        List<Adoption__c> pets = new List<Adoption__c>();
        pets.add(a);
        insert pets;
        DisplayAdoptions_CC display = new DisplayAdoptions_CC();
        display.pet = diffPetname;
        display.Search();
        System.assertEquals(false, display.matches);
    }
    
    @isTest
    private static void matchTestTrueAdopt(){
        String petName = 'Dash';
        Date startDate = Date.newInstance(2021, 5, 27);
        Adoption__c a = new Adoption__c(Name=petName, Animal_Type__c='Dog', Animal_Age__c='Adult', Status__c='New', 
                                       Shelter_Start_Time__c = startDate);
        List<Adoption__c> pets = new List<Adoption__c>();
        pets.add(a);
        insert pets;
        DisplayAdoptions_CC display = new DisplayAdoptions_CC();
        display.pet = petname;
        display.Search();
        System.assertEquals(true, display.matches);
    }
    
    @isTest
    private static void searchTestErrorAdopt(){
        DisplayAdoptions_CC display = new DisplayAdoptions_CC();
        display.pet = '';
        display.Search();
        System.assertEquals(true,ApexPages.hasMessages(ApexPages.severity.ERROR));
        System.assertEquals(false,display.searched);
    }
    @isTest
    private static void searchTestSuccessAdopt(){
        String petName = 'Dash';
        Date startDate = Date.newInstance(2021, 5, 27);
        Adoption__c a = new Adoption__c(Name=petName, Animal_Type__c='Dog', Animal_Age__c='Adult', Status__c='New', 
                                       Shelter_Start_Time__c = startDate);
        List<Adoption__c> pets = new List<Adoption__c>();
        pets.add(a);
        insert pets;
        DisplayAdoptions_CC display = new DisplayAdoptions_CC();
        display.pet = petname;
        display.Search();
        System.assertEquals(true,display.searched);
        System.assertEquals(false,ApexPages.hasMessages(ApexPages.severity.ERROR));
    }
}