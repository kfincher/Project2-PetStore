({
    searchHelper : function(component) {
        var searching = component.get("c.search");
        searching.setParams({
            searchText : component.get("v.searchText")
        });
        
        searching.setCallback(this, function(response){
            try{
                if(response.getState = "SUCCCESS"){
                    var found = response.getReturnValue();
                    component.set("v.inventory" , found);
                    console.log(found);
                }
            } catch(error){
                //logMyErrors(error);
                console.log(error + 'In the Inventory.cmp');
            }
        });
        $A.enqueueAction(searching);	
    }
})