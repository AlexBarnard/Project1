public class newPartsController {
    //whenever a user enters data, its stored in these variables.
    Parts_Order_List__c parts {get; set;}
    Supplier__c supplier {get; set;}

    public Parts_Order_List__c getParts() {
        if (parts == null) parts = new Parts_Order_List__c();
        return parts;
    }
    public Supplier__c getSupplier() {
        if(supplier == null) supplier = new Supplier__c();
        return supplier;
    }

    public PageReference step1() {
        return Page.partPage1;
    }

    public PageReference step2() {
        return Page.partPage2;
    }
    
    public PageReference cancel() {
        Pagereference partPage = new Pagereference('/006');
        partPage.setRedirect(true);
        return partPage;
    }

    public PageReference save() {

        insert parts;

        Pagereference partPage = new ApexPages.StandardController(parts).view();
        partPage.setRedirect(true);

        return partPage;
    }
    
}
