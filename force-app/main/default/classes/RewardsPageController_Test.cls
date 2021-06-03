@isTest
public class RewardsPageController_Test {
    
    @testSetup static void setup() {
        // Create common test accounts
        List<Reward_Points__c> testRewards = new List<Reward_Points__c>();
        for(Integer i=0;i<5;i++) {
            testRewards.add(new Reward_Points__c(Email__c = 'Test'+i+'@email.com' , Address__c = 'Something Street '+i+' St.' , Customer_Name__c = 'Bill The '+i , Points__c = i*100));
        }
        insert testRewards;        
    }
    
    @isTest
    static void MasterTest(){
        RewardsPageController rwd = new RewardsPageController();
        
        rwd.getRewardPoints();
        
        rwd.rewardsReturnString();
        
        rwd.RemovePoints();
        
        rwd.PointsDisplayTest();
        
        rwd.testdirect();
        
        rwd.testinput();
        
        PageReference pr = rwd.redirectPurchase();
        
        pr = rwd.purchase_100();
        
        pr = rwd.purchase_200();
        
        pr = rwd.purchase_300();
        
        pr = rwd.purchase_400();
        Test.StartTest();
        List<Reward_Points__c> testRewardPoints = [SELECT Id, Name, Address__c, Customer_Name__c, Email__c, Phone_Number__c, Points__c FROM Reward_Points__c];
        
        for(Reward_Points__c rwps : testRewardPoints){
            
            System.debug('Test Start');
            PageReference pageRef = Page.RewardsPage;
            Test.setCurrentPage(pageRef);
            
            ApexPages.currentPage().getParameters().put('inpval', rwps.Email__c);
            
            RewardsPageController ewr = new RewardsPageController();
            
            ewr.testinput();
            
            System.debug(ewr.getRewardPoints());
            
            
            pageRef = ewr.purchase_400();
			pageRef = ewr.purchase_300();
			pageRef = ewr.purchase_200();
            pageRef = ewr.purchase_100();
            
            
        }Test.StopTest();	
    }
    
}