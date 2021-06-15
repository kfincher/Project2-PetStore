({
	apptDetailsHandler : function(component, event, helper) {
        var apptId = event.getSource().get("v.label");
		helper.updateApptDetails(apptId, component);
	}
})