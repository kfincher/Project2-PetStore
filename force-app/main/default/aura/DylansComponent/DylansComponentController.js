({
    handleSubmit : function(cmp, evt, hlp){
        let buttonClick = evt.getSource();
        let rewardPoints = cmp.get("v.data");
        let action = cmp.get("c.updatePoints");
		let pid = cmp.get("v.pid");
        console.log("PID: " + pid);
        console.log(buttonClick.getLocalId());
        if(buttonClick.getLocalId() == "ballPurchase"){   
                rewardPoints.Points__c = rewardPoints.Points__c - cmp.get("v.ballPurchase");
        }
        else if(buttonClick.getLocalId() == "leashPurchase"){
                rewardPoints.Points__c = rewardPoints.Points__c - cmp.get("v.leashPurchase");            
        }
            else if(buttonClick.getLocalId() == "bonePurchase"){
                    rewardPoints.Points__c = rewardPoints.Points__c - cmp.get("v.bonePurchase");                
            }
                else if(buttonClick.getLocalId() == "catBoxPurchase"){
                        rewardPoints.Points__c = rewardPoints.Points__c - cmp.get("v.catBoxPurchase");
                }
        action.setParams({pid: pid , points: rewardPoints.Points__c});
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                cmp.set("v.data", response.getReturnValue());
                cmp.set("v.pointTotal", response.getReturnValue().Points__c);

            }
            
        }); 
        console.log("Right before Enqueue Action: " + buttonClick);
        $A.enqueueAction(action);

    },
    handleClick : function(cmp, evt, hlp) {
        let email = cmp.find("emailInput").get("v.value");
        let action = cmp.get("c.getRewardPoints");
        action.setParams({email: email});
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                console.log(response.getReturnValue());
                cmp.set("v.data", response.getReturnValue());
                cmp.set("v.pointTotal", response.getReturnValue().Points__c);
                cmp.set("v.pid", response.getReturnValue().Id);
                
            }
            
        });
        $A.enqueueAction(action);
    }
})