public class RewardsPageController {
    private Reward_Points__c int_rewardPoint = new Reward_Points__c();
    private Integer rewardPoints = 0;
    public String emailEntry { get; set;}
    public String value { get; set;}
    public String response { get; set;}
    
    
    public RewardsPageController(){
        value = ' No Email Entered';
        emailEntry = '';
		response = '';
    }
    
    public Integer getRewardPoints(){
        return rewardPoints;
    }
    
    public String rewardsReturnString(){
        return ' Points Balance ' + rewardPoints;
    }
    
    public PageReference redirectPurchase(){
        PageReference rPost = Page.RewardsPage_Confirmation;
        rPost.setRedirect(false);
        return rPost;
    }

	public PageReference returnToMain(){
		value = ' No Email Entered';
        emailEntry = '';
		response = '';
		rewardPoints = 0;
		int_rewardPoint = new Reward_Points__c();
		
        PageReference rPost = Page.RewardsPage;
        rPost.setRedirect(false);
        return rPost;
    }

	public PageReference generatePDF(){
        PageReference rPost = Page.RewardsPage_ConfirmationPDF;
        rPost.setRedirect(false);
        return rPost;
    }

    private void generateResponse(){
        response = int_rewardPoint.Customer_Name__c + ' you have ' + int_rewardPoint.Points__c + ' remaining reward points, and your order will be shipped to ' + int_rewardPoint.Address__c;      
    }

    private void updateRewardRecord(){
        try {
            update int_rewardPoint;
            
        } catch (DmlException e) {
            System.debug('Transaction failed ' + e );
        }
    }
    
    public PageReference purchase_100(){
        
        int_rewardPoint.Points__c = rewardPoints - 100;
        if (rewardPoints < 100){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Not Enough Points');
            ApexPages.addMessage(msg);
            return null;
        }
		generateResponse();

        updateRewardRecord();
        
        return redirectPurchase();
    }
    
    public PageReference purchase_200(){
        
        int_rewardPoint.Points__c = rewardPoints - 200;
        if (rewardPoints < 200){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Not Enough Points');
            ApexPages.addMessage(msg);
            return null;
        }
		generateResponse();

        updateRewardRecord();
        
        return redirectPurchase();
    }
    
    public PageReference purchase_300(){
        
        int_rewardPoint.Points__c = rewardPoints - 300;
        
        if (rewardPoints < 300){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Not Enough Points');
            ApexPages.addMessage(msg);
            return null;
        }        
        generateResponse();

        updateRewardRecord();
        
        return redirectPurchase();
    }
    
    public PageReference purchase_400(){
        
        int_rewardPoint.Points__c = rewardPoints - 400;
        
        if (rewardPoints < 400){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Not Enough Points');
            ApexPages.addMessage(msg);
            return null;
        }
        generateResponse();

        updateRewardRecord();
        
        return redirectPurchase();
    }
    
    public void RemovePoints(){
        
        int_rewardPoint.Points__c = rewardPoints - 50;
        
        try {
            update int_rewardPoint;
            
        } catch (DmlException e) {
            System.debug('Transaction failed ' + e );
        }   
    }

    public void PointsDisplayTest(){
        system.debug(rewardPoints);
    }
    
    public void testdirect(){
        system.debug(value);
    }

    
    public void testinput(){
        Boolean CheckCheck = true;
        value = apexpages.currentPage().getParameters().get('inpval');
        system.debug('Inpval ' + value);
        
        
        
        try{
            int_rewardPoint = [select Points__c, Customer_Name__c, Email__c, Address__c from Reward_Points__c WHERE Email__c = :value][0];
            rewardPoints = Integer.valueOf(int_rewardPoint.Points__c);
        }
        catch (Exception e){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, 'Error');
            ApexPages.addMessage(msg);
            response = 'Please make sure you have entered in a proper email address';
            CheckCheck = false;
            
        }
        if (CheckCheck){
            response = 'Hello ' + int_rewardPoint.Customer_Name__c +' you have ' + rewardPoints + ' reward points';
        }
        apexpages.currentPage().getParameters().put('inpval', response);	
    }
}