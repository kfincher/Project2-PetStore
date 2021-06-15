public class GroomingScheduleController {
    
	@auraEnabled
    public static List<Grooming_Appointment__c> getAppts(String dateRange, List<String> selectedApptTypes){
        
        String baseQuery = 'SELECT Id, Name, Appointment_Time__c, Client_Phone__c, Current_Appointment__c, Employee__c, '
        				+ 'Grooming_Types__c, Pet__c, Satisfaction_Rating__c, Status__c FROM Grooming_Appointment__c '
                    	+ 'WHERE Grooming_Types__c includes ';
        
        //buildQuery.mplOr method builds a properly formatted string for multi-picklist value queries
		String qry = baseQuery + buildQuery.mplOr(selectedApptTypes);
        
        
        //Determine which range of dates to search
        if (dateRange=='All'){
        }
        else if (dateRange=='Today'){
        	qry += ' AND Appointment_Time__c = TODAY';
        }
        else if (dateRange=='Upcoming'){
            qry += ' AND Appointment_Time__c >= TODAY';
        }

        qry += ' ORDER BY Appointment_Time__c ASC';
        
        return Database.query(qry);
    }
}