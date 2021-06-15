({
    myAction : function(component, event){
      var action = component.get("c.Search");
        action.setParams({
            searchName: component.get("v.SearchValue")
        });
        
        action.setCallback(this, function(data) {
            if(data.getState() === "SUCCESS") {
                //Method for getting parent fields
                var rows = data.getReturnValue();
                for ( var i = 0; i < rows.length; i++ ) {
                    var row = rows[i];
                    row.NameUrl = "https://universalcontainers-5c8.lightning.force.com/lightning/r/Pet_Hotel__c/"+row.Id+"/view";
                }
                var listSize = 5;
                var rowCols = new Array(Math.floor(rows.length/listSize)+1);
                for( var i = 0; i<rowCols.length;i++){
                    rowCols[i] = new Array();
                    for (var j = 0; j<listSize ;j++){
                        if((i*listSize)+j<rows.length)
                        	rowCols[i].push(rows[(i*listSize)+j]); 
                    }
                }

                component.set("v.listIndex", 0);
                component.set("v.rowCols",rowCols);
                this.setRow(component);
                console.log(rows.length+" "+listSize)
                if(rows.length>listSize){
                    component.set("v.nextOn",false);
                }
            	
                
                var divCard = document.getElementById("resultsTag");
                if(rows.length<=0){
                    console.log('hey');
        			//divCard.innerHTML='No results found... create a new booking <a href=\'https://universalcontainers-5c8.lightning.force.com/c/PetHotelBookingCreationHarnessApp.app\'>here</1>';
                    divCard.innerHTML= 'No results found...';
                }else{
                    divCard.innerHTML='';
                }
            }
        });
        console.log(component.get("v.PetHotel"));
        $A.enqueueAction(action);  
    },
    setRow : function(component){
        var index = component.get("v.listIndex");
        var rowCols = component.get("v.rowCols");
        component.set( "v.PetHotel", rowCols[index] );
    },
    nextList : function(component, event){
        this.listChange(component, 1);
    },
    prevList : function(component, event){
        this.listChange(component, -1);
    },
    listChange : function(component, intVar){
        var index = component.get("v.listIndex");
        var rowCols = component.get("v.rowCols");
        index += intVar;
        console.log(index);
        component.set( "v.PetHotel", rowCols[index] );
        component.set("v.listIndex", index);
        console.log(index+" "+rowCols.length);
        if(index>=rowCols.length-1)
            component.set("v.nextOn",true);
        else
            component.set("v.nextOn",false);
        
        if(index<=0)
            component.set("v.prevOn",true);
        else
            component.set("v.prevOn",false);
        
    },
	init : function(component, event) {
		component.set("v.Columns", [
            {label:"Name", fieldName:"NameUrl", type: 'url', 
                typeAttributes: { 
                    label: {
                        fieldName: 'Name'
                    } 
                },},
            {label:"TYPE OF PET", fieldName:"Type_of_Pet__c", type:"text"},
            {label:"PET OWNER", fieldName:"Pet_Owner__c", type:"text"},
            {label:"CHECK IN", fieldName:"Check_In__c", type:"date"},
            {label:"CHECK OUT", fieldName:"Check_Out__c", type:"date"}
        ]); 
	}
})