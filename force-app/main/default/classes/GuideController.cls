public class GuideController {
@AuraEnabled
    public static List<Guide__c> getGuides(){
        return [SELECT Page_Title__c, Instructions_HTML__c, Order__c FROM Guide__c WHERE Active__c = true ORDER BY Order__c];
    }
}