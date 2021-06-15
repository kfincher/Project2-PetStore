({
    
    contentStart : 0,
    contentEnd : 1,
    
    getGuide : function(component) {
        
        var guideRetrieve = component.get("c.getGuides");
        
        guideRetrieve.setCallback(this, function(response){
            
            let state = response.getState();
            let returnValue = response.getReturnValue();
            
            if (state == "SUCCESS"){
                console.log("STATE:" + state);
                component.set("v.guide", returnValue);
                component.set("v.currentPage", returnValue[0]);
                this.contentIndexInit(returnValue);
            }
            else if (state == "INCOMPLETE")
            	console.log("STATE:" + state);
            
            else if (state == "ERROR"){
            	console.log("STATE:" + state);
            	var errors = response.getError();
                
            	if (errors) {
                    if (errors[0] && errors[0].message){
                        console.log("Message: " + errors[0].message);
                    }
            	}
                else
                    console.log("unknown error");
            }
        });

        $A.enqueueAction(guideRetrieve);
    },
    
    contentIndexInit : function(guide) {
    //Set last page index
        this.contentEnd = guide.length-1;
    }

})