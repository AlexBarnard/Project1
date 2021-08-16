public with sharing class PartOrderEdit_CX {
    private static List<Parts_Order_List__c> Parts = new List<Parts_Order_List__c> ([SELECT Id, Name, Part_Type__c, Quantity__c, 
                                                        Supplier__c, Date_Ordered__c, Expected_Arrival_Date__c
                                                        FROM Parts_Order_List__c]);
    public static ApexPages.StandardSetController stdController {
        get {
            if(stdController == null) {
                stdController = new ApexPages.StandardSetController(Parts);
            }
            return stdController;
        }
        set;
    }

    public PartOrderEdit_CX(ApexPages.StandardSetController Controller) {
        stdController = Controller;
    }
    public PageReference save() {
        update parts;
        PageReference partPage = new PageReference('/'+Schema.SObjectType.Parts_Order_List__c.getKeyPrefix());
        partPage.setRedirect(true);
        return partPage;
    }
    public PageReference cancel() {
        PageReference partPage = new PageReference('/'+Schema.SObjectType.Parts_Order_List__c.getKeyPrefix());
        partPage.setRedirect(true);
        return partPage;
    }
}

