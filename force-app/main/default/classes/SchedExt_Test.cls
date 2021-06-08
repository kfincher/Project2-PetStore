@isTest
public class SchedExt_Test {
	@isTest
    static void FilteredTimeTest(){
        /*
        Grooming__c fakeowner = new Grooming__c(Name='Jeff Hardy', Animal_Type__c='Dog', 
                                                Animal_Age__c='Puppy (5-8 months old)');
        insert fakeowner;
		*/
        List<Grooming_Appointment__c> testAppoints = new List<Grooming_Appointment__c>();
        DateTime appoint = DateTime.newInstance(2021, 7, 23, 10, 00, 0);
        String testpet = 'Johnson';
        String phone = '2584586985';
        String picklist = 'Bathing';
        /*
        Grooming_Appointment__c test = new Grooming_Appointment__c(Name=testpet, Grooming__c=fakeowner.ID, Client_Phone__c=phone,
                                                                   Appointment_Time__c=appoint, Grooming_Types__c=picklist);
		*/
        Grooming_Appointment__c test = new Grooming_Appointment__c(Name=testpet, Client_Phone__c=phone,
                                                                   Appointment_Time__c=appoint, Grooming_Types__c=picklist);
        List<Grooming_Appointment__c> testList = new List<Grooming_Appointment__c>();
        testList.add(test);
        SchedExt contTest = new SchedExt();
        contTest.FilteredAllTimeSlots();
        for(Grooming_Appointment__c contTests: testList){
            System.debug('Test Start');          
        }
        contTest.clear();
    }
}