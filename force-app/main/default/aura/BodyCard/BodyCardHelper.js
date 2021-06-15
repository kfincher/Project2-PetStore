({
    contentStart : 1,
    contentEnd : 4,
    
	getPageContent : function(pageName) {
        const pageMap = new Map([
            ["gather_supplies", 0],
            ["pre_bath", 1],
            ["bath", 2],
            ["post_bath", 3],
        ]);
        var content = [	"Be sure to gather all the supplies you will need for the grroming session. You will "
            				+"likely need:<br/><ul><li>A Brush,</li><li>A Comb(for long haired breeds),</li>"
            				+"<li>Scissors(for trimming and haircuts),</li><li>Electric Razor(for any shaving "
            				+"sessions),</li><li>Shampoo,</li><li>Conditioner,</li><li>Towels,</li>"
            				+"<li>Blow Dryer,</li><li>Nail Clippers,</li><li>Tooth Brush,</li>"
            				+"<li>Tooth Cleaner</li></ul>",
                        "Check for Parasites<br/><ul><li>Check for fleas and ticks all over the body paying "
            				+"close attention to:</li><ul><li>In and around the ears</li><li>Around the eyelids</li>"
            				+"<li>Under the collar</li><li>Under the front legs</li><li>Between the back legs</li>"
                    		+"<li>Between the toes</li><li>Around the tail</li></ul><li>Check for mites in the "
            				+"ear</li></ul>Remove Matts and Tangles<br/><ul>"
                			+"<li>Gently attempt to brush out tangles and matts, trimming them out if "
            				+"necessary</li></ul>Trimming/Clipping/Shaving<br/><ul>"
            				+"<li>Trim, Clip, or Shave as necessary for the particular style for grooming session"
            				+"</li></ul>Brush/Comb<br/><ul><li>Gently brush or comb the fur out once more</li></ul>",
						"PreRinse<br/><ul><li>Gently rinse the animal</li></ul>Shampoo<br/><ul><li>"
                       		+"Lather the animal with shampoo</li></ul>Rinse<br/><ul><li>Rinse the shampoo</li>"
                       		+"</ul>Conditioner<br/><ul><li>Apply conditioner</li></ul>Rinse<br/><ul><li>Gently "
                       		+"rinse the animal</li></ul>Dry<br/><ul><li>Gently dry with towel and blow dryer "
                       		+"(for longer coated animals)</li></ul>",
            			"Check for Parasites<br/><ul><li>Check once more for any parasites</li>"
            				+"<li>Check for fleas and ticks all over the body paying close attention to:</li>"
            				+"<ul><li>In and around the ears</li><li>Around the eyelids</li><li>Under the collar</li>"
            				+"<li>Under the front legs</li><li>Between the back legs</li><li>Between the toes</li>"
            				+"<li>Around the tail</li></ul><li>Check for mites in the ear</li></ul>"
            				+"Brush/Comb<br/><ul><li>Gently brush and comb out the coat</li></ul>"
            				+"Clean Ears<br/><ul><li>Gently clean the ears with a cotton pad</li></ul>"
            				+"Trim Nails<br/><ul>"
            				+"<li>Carefully trim the animal's nails, making sure not to injure the animal</li>"
            				+"</ul>Brush Teeth<br/><ul><li></li></ul>"];
        return content[pageMap.get(pageName)];
	},
    
    setPageContent : function(pageNum) {
    
		var content = [	"An unknown error has occurred.",
                       	"table of contents:",
            			"Be sure to gather all the supplies you will need for the grroming session. You will "
            				+"likely need:<br/><ul><li>A Brush,</li><li>A Comb(for long haired breeds),</li>"
            				+"<li>Scissors(for trimming and haircuts),</li><li>Electric Razor(for any shaving "
            				+"sessions),</li><li>Shampoo,</li><li>Conditioner,</li><li>Towels,</li>"
            				+"<li>Blow Dryer,</li><li>Nail Clippers,</li><li>Tooth Brush,</li>"
            				+"<li>Tooth Cleaner</li></ul>",
                        "Check for Parasites<br/><ul><li>Check for fleas and ticks all over the body paying "
            				+"close attention to:</li><ul><li>In and around the ears</li><li>Around the eyelids</li>"
            				+"<li>Under the collar</li><li>Under the front legs</li><li>Between the back legs</li>"
                    		+"<li>Between the toes</li><li>Around the tail</li></ul><li>Check for mites in the "
            				+"ear</li></ul>Remove Matts and Tangles<br/><ul>"
                			+"<li>Gently attempt to brush out tangles and matts, trimming them out if "
            				+"necessary</li></ul>Trimming/Clipping/Shaving<br/><ul>"
            				+"<li>Trim, Clip, or Shave as necessary for the particular style for grooming session"
            				+"</li></ul>Brush/Comb<br/><ul><li>Gently brush or comb the fur out once more</li></ul>",
						"PreRinse<br/><ul><li>Gently rinse the animal</li></ul>Shampoo<br/><ul><li>"
                       		+"Lather the animal with shampoo</li></ul>Rinse<br/><ul><li>Rinse the shampoo</li>"
                       		+"</ul>Conditioner<br/><ul><li>Apply conditioner</li></ul>Rinse<br/><ul><li>Gently "
                       		+"rinse the animal</li></ul>Dry<br/><ul><li>Gently dry with towel and blow dryer "
                       		+"(for longer coated animals)</li></ul>",
            			"Check for Parasites<br/><ul><li>Check once more for any parasites</li>"
            				+"<li>Check for fleas and ticks all over the body paying close attention to:</li>"
            				+"<ul><li>In and around the ears</li><li>Around the eyelids</li><li>Under the collar</li>"
            				+"<li>Under the front legs</li><li>Between the back legs</li><li>Between the toes</li>"
            				+"<li>Around the tail</li></ul><li>Check for mites in the ear</li></ul>"
            				+"Brush/Comb<br/><ul><li>Gently brush and comb out the coat</li></ul>"
            				+"Clean Ears<br/><ul><li>Gently clean the ears with a cotton pad</li></ul>"
            				+"Trim Nails<br/><ul>"
            				+"<li>Carefully trim the animal's nails, making sure not to injure the animal</li>"
            				+"</ul>Brush Teeth<br/><ul><li></li></ul>"];
        
        return content[pageNum];
	}
})