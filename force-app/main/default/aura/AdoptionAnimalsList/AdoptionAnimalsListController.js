({
    init : function(component, event, helper){
        component.set("v.Columns", [
            {label:"Name", fieldName:"Pet__c", type:"text"},
            {label:"Animal Type", fieldName:"Animal_Type__c", type:"text"},
            {label:"Animal Age", fieldName:"Animal_Age__c", type:"text"},
            {label:"Status", fieldName:"Status__c", type:"text"}
        ]); 
    },
    myAction : function(component, event, helper) {
		helper.myAction(component, event);
	},
    nextList : function(component, event, helper) {
        helper.nextList(component, event);
    },
    prevList : function(component, event, helper) {
        helper.prevList(component, event);
    }
    
})