({
	myAction : function(component, event, helper) {
        component.find('field').forEach(function(f) {
            f.reset();
        });
        var divCard = document.getElementById("resultsTag");
        divCard.innerHTML='Successfully submitted record...';
        setTimeout(() => { divCard.innerHTML='<br/>'; }, 4000);
	},
                          load : function(component, event, helper){
                              window.open("https://universalcontainers-5c8.lightning.force.com/c/PetHotelBookingsListHarnessApp.app",'_blank');
                          }
})