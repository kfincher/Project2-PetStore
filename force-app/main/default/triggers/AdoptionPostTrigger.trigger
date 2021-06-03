trigger AdoptionPostTrigger on Adoption__c (before insert, before delete) {
    if (trigger.isBefore){
        if (trigger.isInsert){
        	AdoptionPostHandler.AnimalInsert(trigger.new);
        }
        if (trigger.isDelete){
            AdoptionPostHandlerRemove.AnimalAway(trigger.new);
        }
    }
}