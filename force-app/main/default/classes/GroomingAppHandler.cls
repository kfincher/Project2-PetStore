public class GroomingAppHandler {
    public static void BarkBark(List<Grooming_Appointment__c> b){
        List<Grooming_Appointment__c> record = [SELECT Name, Appointment_Time__c FROM Grooming_Appointment__c];
        for(Grooming_Appointment__c f:b){
            for(Grooming_Appointment__c g:record){
                if(f.Appointment_Time__c == g.Appointment_Time__c){
                    f.Appointment_Time__c.addError('Please pick another date/time! Time slot is already taken!');
                }
            }  
        }
    }
}