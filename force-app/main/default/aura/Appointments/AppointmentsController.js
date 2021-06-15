({
    
    updateApptList : function(component, event, helper){
        component.set("v.apptList", event.getParam("AppointmentsList"));
    },
    
    updateSelectedAppt : function(component, event, helper){
        component.set("v.selectedApptId", event.getParam("apptId"));
    },
    
    setGuideTrue : function(component, event, helper){
    	component.set("v.showGuide", "true");
	},
 
    setGuideFalse : function(component, event, helper){
    	component.set("v.showGuide", "false");        
    }
    
})