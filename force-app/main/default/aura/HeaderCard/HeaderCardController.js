({
	injectHTML : function(component, event, helper) {
        console.log(component.get("v.body"));
        console.log("A NORMAL LOG TEST TEST TEST TEST");
        component.set("v.inject", "<br/>INJECTION TEST");
        var body = component.get("v.body");
        body.push("INJECTION TEST 5");
        component.set("v.body", body);
	}
})