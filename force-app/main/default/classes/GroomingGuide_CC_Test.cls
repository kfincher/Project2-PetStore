@isTest
private class GroomingGuide_CC_Test {
    @isTest
    private static void GGCCMethodTest(){
        GroomingGuide_CC testCtrlr = new GroomingGuide_CC();
        System.assertEquals(Page.GroomingGuideHomePage.getURL(), testCtrlr.GroomingGuideHome().getURL());
        System.assertEquals(Page.GroomingGatherSuppliesPage.getURL(), testCtrlr.GatherSupplies().getURL());
        System.assertEquals(Page.GroomingPreBathPage.getURL(), testCtrlr.PreBath().getURL());
        System.assertEquals(Page.GroomingBathPage.getURL(), testCtrlr.Bath().getURL());
        System.assertEquals(Page.GroomingPostBathPage.getURL(), testCtrlr.PostBath().getURL());
    }
}