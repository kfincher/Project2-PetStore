({
    init : function(component, event, helper){
          component.set("v.columns",
                      [{label: "Item", fieldName : "Name", type : "text"},
                      {label: "Unit Price", fieldName : "Currency__c", type : "currency", typeAttributes: { currencyCode: 'USD'}},
                      {label: "Stock", fieldName :  "Stock_Count__c" , type : "integer"},
                      {label: "Family", fieldName : "Family", type : "text"}]
                     );
        var holder = component.get("v.columns");
        
    },
    handleClick : function(component, event, helper) {
        //console.log(holder);
        
        helper.searchHelper(component);
    }
})