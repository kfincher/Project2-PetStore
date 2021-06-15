public class GuideController {
@AuraEnabled
    public static List<Guide__c> getGuides(String guideType){
        
        System.debug(guideType);
        
        System.debug([SELECT Page_Title__c, Instructions_HTML__c, Order__c FROM Guide__c WHERE Active__c = true AND For_Guides__c includes (:guideType) ORDER BY Order__c]);
        
		//guideType = '\'' + guideType + '\'';
        
        //System.debug([SELECT Page_Title__c, Instructions_HTML__c, Order__c FROM Guide__c WHERE Active__c = true AND For_Guides__c includes (:guideType) ORDER BY Order__c]);
        
        return [SELECT Page_Title__c, Instructions_HTML__c, Order__c FROM Guide__c WHERE Active__c = true 
                AND For_Guides__c includes (:guideType) ORDER BY Order__c];
    }
}