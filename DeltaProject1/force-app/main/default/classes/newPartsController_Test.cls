@isTest
private class newPartsController_Test {
    @IsTest 
    static void partSaveTest() {
        Parts_Order_List__c part = new Parts_Order_List__c();
        newPartsController ControllerObj = new newPartsController();
        Test.startTest();
            ControllerObj.getParts();
            ControllerObj.step1();
            ControllerObj.step2();
            ControllerObj.step3();
            ControllerObj.cancel();
            ControllerObj.parts.Name = 'Deck';
            ControllerObj.parts.Part_Type__c = 'Decking';
            ControllerObj.save();
            apexPages.Currentpage().getParameters().put('Id',part.id);
        Test.stopTest();      
    }
}