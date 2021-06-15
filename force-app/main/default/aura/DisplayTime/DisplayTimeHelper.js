({
	timeFormat : function(component) {
		var time = component.get("v.time");
        
        component.set("v.formattedTime", $A.localizationService.formatDateTime(time));
	}
})