@isTest(seealldata=true)
private class AdoptionPostTest {
    @isTest
    static void myFakeAnimal(){
        Adoption__c fakeDog = new Adoption__c(Name='Hamster', Animal_Type__c='Dog', Animal_Age__c='Puppy (5-8 months old)', Shelter_Start_Time__c=Date.today());
        insert fakeDog;
        List<Adoption__c> postListing = [SELECT Name FROM Adoption__c];
        system.debug(postListing.size());     //HI   
    }
    @isTest
    static void myFakeAnimal1(){
        List<Adoption__c> checkname = [SELECT Name FROM Adoption__c];
        Adoption__c dogFake = new Adoption__c(Name='Todd', Animal_Type__c='Dog', Animal_Age__c='Puppy (5-8 months old)', Shelter_Start_Time__c=Date.today());
        Database.SaveResult collection = Database.insert(dogFake, false);
        for(Adoption__c b:checkname){
        	if(dogFake.Name == b.Name){
            	system.assertEquals('This animal already exists on Adoption Posts!', collection.getErrors()[0].getMessage());
			}
        }
    }
    @isTest
    static void myFakeAdoption(){
        Adoption__c fakeVacc = new Adoption__c(Name='Mike', Animal_Type__c='Dog', Animal_Age__c='Adult', Shelter_Start_Time__C=Date.today(), 
                                               Status__c='Adopted', Vaccination__c=FALSE);
        insert fakeVacc;
        Database.DeleteResult gone = Database.delete(fakeVacc, false);
        system.assertEquals('This animal has not received it\'s vaccinations yet!', gone.getErrors()[0].getMessage());
    }
}