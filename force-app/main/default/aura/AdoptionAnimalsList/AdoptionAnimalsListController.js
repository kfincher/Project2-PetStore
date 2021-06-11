({
    myAction : function(component, event, helper) {
        component.set("v.Columns", [
            {label:"Name", fieldName:"Pet__c", type:"text"},
            {label:"Animal Type", fieldName:"Animal_Type__c", type:"text"},
            {label:"Animal Age", fieldName:"Animal_Age__c", type:"text"},
            {label:"Status", fieldName:"Status__c", type:"text"},
            {label:"Id", fieldName:"Id", type:"text"}
        ]); 
		var action = component.get("c.Search");
        action.setParams({
            pet: component.get("v.Pet")
        });
        
        
        action.setCallback(this, function(data) {
            if(data.getState() === "SUCCESS") {
                //Method for getting parent fields
                var rows = data.getReturnValue();
                for ( var i = 0; i < rows.length; i++ ) {
                    var row = rows[i];
                    if ( row.Pet__c ) {
                        row.Pet__c = row.Pet__r.Name;
                    }    
                }
               
                component.set( "v.Adoptions", rows );
                
               
            	/*component.set("v.Adoptions", data.getReturnValue());
                console.log("set data");*/
            }
        });
        console.log(component.get("v.Adoptions"));
        $A.enqueueAction(action);
	}
    
})