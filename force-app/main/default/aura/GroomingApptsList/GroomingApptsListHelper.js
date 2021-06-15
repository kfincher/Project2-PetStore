({
	updateApptDetails : function(apptId, component) {
		var selectedAppt = component.getEvent("apptSelectedEvent");
        selectedAppt.setParams({"apptId" : apptId});
        console.log(apptId);
        
        selectedAppt.fire();
	}
})