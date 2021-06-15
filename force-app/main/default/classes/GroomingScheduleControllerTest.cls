@isTest
private class GroomingScheduleControllerTest {
	

    @testSetup
    private static void buildTestData(){
        Employee__c testEmployee = new Employee__c(Name='Test');
        insert testEmployee;
        
        List<Grooming_Appointment__c> testAppts = new List<Grooming_Appointment__c>();
        
        for (integer iii=-100; iii<100; ++iii){
            Grooming_Appointment__c testAppt = new Grooming_Appointment__c(Employee__c = testEmployee.Id, 
                                                                           Appointment_Time__c = Date.today()+iii,
                                                                           Client_Phone__c = '5555555555');
            if ((iii==0) || (iii==1)){
                System.debug('TEST DATA: made new Teeth Cleaning appt.' + testAppt.Appointment_Time__c);
                testAppt.Grooming_Types__c = 'Teeth Cleaning';
            }
            else if (iii<0)
                testAppt.Grooming_Types__c = 'Bathing';
            else if (iii>1)
                testAppt.Grooming_Types__c = 'Bathing;Nail Trimming';
            
            testAppts.add(testAppt);
        }
        
        insert testAppts;
    }

    
    @isTest
    private static void testToday(){
        List<String> apptTypes = new List<String> {'Teeth Cleaning'};
        List<Grooming_Appointment__c> apptTest = GroomingScheduleController.getAppts('Today', apptTypes);
        System.assertEquals(1, apptTest.size());
        
        List<String> apptTypes2 = new List<String> {'Bathing'};
        List<Grooming_Appointment__c> apptTest2 = GroomingScheduleController.getAppts('Today', apptTypes2);
        System.assertEquals(0, apptTest2.size());
    }
    
    @isTest
    private static void testUpcoming(){
        List<String> apptTypes = new List<String> {'Bathing'};
        List<Grooming_Appointment__c> apptTest = GroomingScheduleController.getAppts('Upcoming', apptTypes);
        System.assertEquals(98, apptTest.size());
    }
    
    @isTest
    private static void testAll(){
        List<String> apptTypes = new List<String> {'Bathing','Teeth Cleaning'};
        List<Grooming_Appointment__c> apptTest = GroomingScheduleController.getAppts('All', apptTypes);
        System.assertEquals(200, apptTest.size());
    }
}