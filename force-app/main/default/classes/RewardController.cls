public class RewardController {
@AuraEnabled
    public static Reward_Points__c getRewardPoints(String email){
        return [SELECT Points__c, Email__c, id FROM Reward_Points__c WHERE Email__c = :Email LIMIT 1];
    }
    
    @AuraEnabled
    public static Reward_Points__c updatePoints(Integer points, String pid){
        Reward_Points__c UpdatePoints = [SELECT Points__c FROM Reward_Points__c WHERE id = :pid LIMIT 1];
		UpdatePoints.Points__c = points;
        update UpdatePoints;
        return UpdatePoints; 
    }
    
    
}