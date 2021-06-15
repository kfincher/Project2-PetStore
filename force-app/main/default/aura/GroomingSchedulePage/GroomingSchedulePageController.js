({
    
    updateApptTypes : function(component, event, helper){
        component.set("v.selectedApptTypes", event.getParam("value"));
    },
    
	getApptHelper : function(component, event, helper) {
        let dateRange = event.getSource().get("v.label");
		helper.findAppts(component, dateRange);
	}
})