({
    onRender : function(component, event, helper) {
        var divCard = document.getElementById("CARD");
        divCard.innerHTML=component.get("v.currentContent");
	}
})