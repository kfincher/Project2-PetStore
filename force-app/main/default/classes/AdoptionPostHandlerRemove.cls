public class AdoptionPostHandlerRemove {
    public static void AnimalAway(List<Adoption__c> p){
        List<Adoption__c> release = [Select Status__c, Vaccination__c, Shelter_Start_Time__c FROM Adoption__c WHERE Status__c='Adopted' AND Vaccination__c=FALSE];
        if(release.size()>0){
            system.debug(release.size());
        	for(Adoption__c b:p){
            	for(Adoption__c w:release){
                    if(b.Id==w.Id){
                		b.Vaccination__c.addError('This animal has not received it\'s vaccinations yet!');
                    }
            	}
            }
        }
    }
}