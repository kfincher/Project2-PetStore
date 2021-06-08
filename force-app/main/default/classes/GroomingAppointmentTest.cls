@isTest(seealldata=true)
private class GroomingAppointmentTest {
	@isTest
    private static void myFakeAppointment(){
        Date d = date.newInstance(2021, 05, 26);
        Time t = time.newInstance(12, 00, 00, 00);
        /*
        Grooming__c fakeowner = new Grooming__c(Name='Joe Clams', Animal_Type__c='Dog', Animal_Age__c='Puppy (5-8 months old)');
        insert fakeowner;
		*/
        /*
        Grooming_Appointment__c fake = new Grooming_Appointment__c(Name='Jerry', Grooming__c=fakeowner.ID, Client_Phone__c='2342342345',
                                                                   Appointment_Time__c=DateTime.newInstance(d, t));
		*/
        Grooming_Appointment__c fake = new Grooming_Appointment__c(Name='Jerry', Client_Phone__c='2342342345',
                                                                   Appointment_Time__c=DateTime.newInstance(d, t));
        //database.SaveResult is a list of errors the databse throws when fake falses to insert.
        database.SaveResult result = database.insert(fake, false);
        List<Grooming_Appointment__c> testing = [SELECT Name FROM Grooming_Appointment__c];
        system.debug(testing.size());
        //Fakes the system out to assert the new data into the "database"
        system.assertEquals('Please pick another date/time! Time slot is already taken!', result.getErrors()[0].getMessage());
    }
}