({
	myAction : function(component, event) {
		var action = component.get("c.Search");
        action.setParams({
            pet: component.get("v.Pet")
        });
        
        action.setCallback(this, function(data) {
            if(data.getState() === "SUCCESS") {
                //Method for getting parent fields
                var rows = data.getReturnValue();
                for ( var i = 0; i < rows.length; i++ ) {
                    var row = rows[i];
                    if ( row.Pet__c ) {
                        row.Pet__c = row.Pet__r.Name;
                    }    
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
				console.log("made it");
                component.set("v.listIndex", 0);
                component.set("v.rowCols",rowCols);
                this.setRow(component);
                console.log(rows.length+" "+listSize)
                if(rows.length>listSize){
                    component.set("v.nextOn",false);
                }
                
                var divCard = document.getElementById("resultsTag");
                if(rows.length<=0){
        			divCard.innerHTML='No results found...';
                }else{
                    divCard.innerHTML='';
                }
            }
        });
        console.log(component.get("v.Adoptions"));
        $A.enqueueAction(action);
	},
    setRow : function(component){
        var index = component.get("v.listIndex");
        var rowCols = component.get("v.rowCols");
        component.set( "v.Adoptions", rowCols[index] );
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
        component.set( "v.Adoptions", rowCols[index] );
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
        
    }
})