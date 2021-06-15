({	
    
    onInit : function(component, event, helper){
        helper.getGuide(component);
    },
    
    
    setCurrentContent : function(component, event, helper) {
        let contentNum = event.getSource().get("v.label")-1;
        let guide = component.get("v.guide");
        component.set("v.currentPage", guide[contentNum]);
    },

    
    prevContent : function(component, event, helper) {
        let guide = component.get("v.guide");
        let currentPageNum = component.get("v.currentPage.Order__c")-1;
        if (currentPageNum > helper.contentStart)
        	component.set("v.currentPage", guide[currentPageNum-1]);
    },
    
    nextContent : function(component, event, helper) {
        let guide = component.get("v.guide");
        let currentPageNum = component.get("v.currentPage.Order__c")-1;
        console.log(helper.contentEnd);
        if (currentPageNum < helper.contentEnd)
        	component.set("v.currentPage", guide[currentPageNum+1]);
    }
})