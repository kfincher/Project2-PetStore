({
	apptEventFire : function(apptList, component) {
		var apptEvent = component.getEvent("apptListChange");
        apptEvent.setParams({"AppointmentsList" : apptList});
        
        apptEvent.fire();
	},
    
    findAppts : function(component, dateRange){
        
        var selectedApptTypes = component.get("v.selectedApptTypes");
        var getAppts = component.get("c.getAppts");
        
        getAppts.setParams({dateRange : dateRange, selectedApptTypes : component.get("v.selectedApptTypes")});
        getAppts.setCallback(this, function(response){
            
            var state = response.getState();
            var result = response.getReturnValue();
            
            if (state == "SUCCESS"){
                console.log("STATE: " + state);
				this.apptEventFire(result, component);
            }
            else if (state == "INCOMPLETE"){
                console.log("STATE: " + state);
            }
            else if (state == "ERROR"){
                console.log("STATE: " + state);
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message){
                        console.log("Error message: " + errors[0].message);
                    }
                }
                else{
                    console.log("Unknown error");
                }
            }
        })
        
        $A.enqueueAction(getAppts);
    }
})