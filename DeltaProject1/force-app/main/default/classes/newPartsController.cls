public class newPartsController {
    //whenever a user enters data, its stored in these variables.
    Parts_Order_List__c parts;

    public Parts_Order_List__c getParts() {
        if (parts == null) parts = new Parts_Order_List__c();
        return parts;
    }

    public PageReference step1() {
        return Page.partPage1;
    }

    public PageReference step2() {
        return Page.partPage2;
    }
    
    public PageReference step3() {
        return Page.partPage3;
    }

    public PageReference cancel() {
        PageReference refPage = new PageReference('/006');
        refPage.setRedirect(true);
        return refPage; 
    }


    public PageReference save() {

        insert parts;

        Pagereference partPage = new ApexPages.StandardController(parts).view();
        partPage.setRedirect(true);

        return partPage;
    }

}
