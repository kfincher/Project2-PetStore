@isTest
private class GuideControllerTest {
    
    @isTest
    private static void dataRetrievalSingleTest(){
		Guide__c guide = new Guide__c(Name='name', Instructions__c='instructions', Page_Title__c='title', Active__c=true, 
                                          Instructions_HTML__c='html', Order__c = 0, For_Guides__c='Grooming');
        insert guide;
        
        List<Guide__c> singlePageGuideTest = new List<Guide__c>();
        singlePageGuideTest = GuideController.getGuides();
        
        System.assertEquals(1, singlePageGuideTest.size());
    }
    

    @isTest
    private static void dataRetrievalBulkTest(){
        List<Guide__c> testGuides = new List<Guide__c>();
        for (integer iii=0; iii<300; ++iii){
            String num = String.valueOf(iii);
            Guide__c guide = new Guide__c(Name=num, Instructions__c='instructions '+num, Page_Title__c='title '+num, Active__c=true, 
                                          Instructions_HTML__c='html '+num, Order__c = iii, For_Guides__c='Grooming');
            testGuides.add(guide);
        }
        insert testGuides;
        
        List<Guide__c> guideTest = new List<Guide__c>();
        guideTest = GuideController.getGuides();
        
        System.assertEquals(300, guideTest.size());
    }
}