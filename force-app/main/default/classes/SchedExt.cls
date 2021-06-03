public class SchedExt {
    public Grooming_Appointment__c g{get;set;}
    public List<Grooming_Appointment__c> timeslots{get;set;}
    public SchedExt(){
        g = new Grooming_Appointment__c();
    }
    public void FilteredAllTimeSlots(){
        timeslots = new List<Grooming_Appointment__c>();
        if(g.Grooming_Types__c != NULL || g.Grooming_Types__c != g.Grooming_Types__c){
            timeslots = [SELECT Appointment_Time__c, Name, Grooming__c,  
                         Client_Phone__c, Grooming_Types__c  
                         FROM Grooming_Appointment__c WHERE Grooming_Types__c =:g.Grooming_Types__c
                         ORDER BY Appointment_Time__c ASC];
        }else{
            timeslots = [SELECT Appointment_Time__c, Name, Grooming__c,  
                         Client_Phone__c, Grooming_Types__c  
                         FROM Grooming_Appointment__c
                         ORDER BY Appointment_Time__c ASC];
        }
    }
    public void clear(){
        timeslots.clear();
        g.clear();
    }
}