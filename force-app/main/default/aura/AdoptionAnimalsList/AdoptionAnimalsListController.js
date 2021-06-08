({
	myAction : function(component, event, helper) {
		var action = component.get("c.testerClassThing");
        action.setParams({
            recordId: component.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            component.set("v.heyStore", data.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})