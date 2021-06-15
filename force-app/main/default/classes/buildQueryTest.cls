@isTest
private class buildQueryTest {
    
    @isTest
    private static void singleMPLOrTest(){
        List<String> mplValue1 = new List<String> {'value'};
        System.assertEquals('(\'value\')', buildQuery.mplOr(mplValue1));
    }
    
    @isTest
    private static void multiMPLOrTest(){
        List<String> mplValue2 = new List<String> {'value1', 'value2'};
        System.assertEquals('(\'value1\',\'value2\')', buildQuery.mplOr(mplValue2));
    }
    
}