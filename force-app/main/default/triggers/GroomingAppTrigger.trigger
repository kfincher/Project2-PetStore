trigger GroomingAppTrigger on Grooming_Appointment__c (before insert) {
    if(trigger.isInsert){
        if(trigger.isBefore){
            GroomingAppHandler.BarkBark(trigger.new);
        }
    }
    
}