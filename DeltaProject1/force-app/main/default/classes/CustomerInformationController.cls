public with sharing class CustomerInformationController {
    
    Customer__c cust;
   
    
    Public Customer__c getCustomer(){
        if (cust == null) cust = new Customer__c();
        return cust;
    }
   
    
    Public PageReference Begin(){
        return Page.PreApproval;
    }
    
    public PageReference Step1(){
        return Page.PreApproval1;
    }
    
    public PageReference Step2(){
        return Page.PreApproval2;
    }
    public PageReference Step3(){
        return Page.PreApproval3;
    }
    // cancel button
    public PageReference cancel(){
       PageReference customerDetailPage = page.PreApproval;
       customerDetailPage.setRedirect(true);
        return customerDetailPage;
    } 
    
    // Save Button
    Public pageReference save(){
      PageReference CustomerPage = page.CustomerPage;
      CustomerPage.setRedirect(true);  
        
        insert Cust;
        return CustomerPage;
        
        
        
     
        
    }
}