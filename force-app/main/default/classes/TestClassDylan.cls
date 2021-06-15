@isTest
private class TestClassDylan {
    @isTest static void myRewardPointsTest(){
        Reward_Points__c rp = new Reward_Points__c(
            Email__c='jake@gmail.com', Address__c='123 Tough Street',
            Customer_Name__c='jake', Points__c=5000);        
        insert rp;
        try{          
            RewardController.updatePoints(5000, rp.id);  
        }catch (exception e){
            System.debug(e.getMessage());            
        }
        System.debug('rp.Points__c: ' + rp.Points__c);
        Reward_Points__c results = RewardController.getRewardPoints(rp.Email__c);        
        System.assertEquals(5000, results.Points__c);
    }
}