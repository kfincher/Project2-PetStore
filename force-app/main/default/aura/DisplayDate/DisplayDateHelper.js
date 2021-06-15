({
	dateFormat : function(component) {
		var date = component.get("v.date");
        if (date.search("T")){
            date = date.substring(0,date.search("T"));
        }
        
        component.set("v.formattedDate", $A.localizationService.formatDate(date, "YYYY-MM-DD"));
	}
})