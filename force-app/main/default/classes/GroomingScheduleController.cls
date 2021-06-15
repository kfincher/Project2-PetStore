public class GroomingScheduleController {
    
	@auraEnabled
    public static List<Grooming_Appointment__c> getAppts(String dateRange, List<String> selectedApptTypes){
        
        System.debug(dateRange);
        
        String baseQuery = 'SELECT Id, Name, Appointment_Time__c, Client_Phone__c, Current_Appointment__c, Employee__c, '
        				+ 'Grooming_Types__c, Pet__c, Satisfaction_Rating__c, Status__c FROM Grooming_Appointment__c '
                    	+ 'WHERE Grooming_Types__c includes ';
        
		String qry = baseQuery + buildQuery.mplOr(selectedApptTypes);
        
        if (dateRange=='All'){
        }
        else if (dateRange=='Today'){
        	qry += ' AND Appointment_Time__c = TODAY';
        }
        else if (dateRange=='Upcoming'){
            qry += ' AND Appointment_Time__c >= TODAY';
        }
        
        
        
        qry += ' ORDER BY Appointment_Time__c ASC';
        
        System.debug(qry);
        
        /*
		return [SELECT Id, Name, Appointment_Time__c, Client_Phone__c, Current_Appointment__c, Employee__c, 
                      Grooming_Types__c, Pet__c, Satisfaction_Rating__c, Status__c FROM Grooming_Appointment__c 
                      WHERE Grooming_Types__c = :selectedApptTypes];
		*/
        
        return Database.query(qry);
    }
}