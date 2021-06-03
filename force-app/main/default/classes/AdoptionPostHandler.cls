public class AdoptionPostHandler {
    public static void AnimalInsert(List<Adoption__c> i){
    	for(Adoption__c check:[SELECT Name, Animal_Age__c FROM Adoption__c]){
        	for(Adoption__c a:i){
            	if(a.Name==check.Name){
                	a.Name.addError('This animal already exists on Adoption Posts!');
            	}
        	}
    	}
    }
}