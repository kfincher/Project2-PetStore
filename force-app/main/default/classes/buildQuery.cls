public class buildQuery {
    
    public static String mplOr(List<String> mplValues){
    	// Create a set of picklist values, at least one of which is present
    	// in the queried multi-select picklist - for use in dynamic SOQL queries
        String queryValuesStrOr = '(';
        
        for (String value : mplValues){
            queryValuesStrOr += ('\'' + value + '\'' + ',');
        }
        
        queryValuesStrOr = queryValuesStrOr.removeEnd(',');
        queryValuesStrOr += ')';
        
        return queryValuesStrOr;
    }

}