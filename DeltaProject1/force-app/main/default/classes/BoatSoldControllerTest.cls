@isTest
public class BoatSoldControllerTest {

    //  Boat_Sold__c b = new Boat_Sold__c(Name= 'Boat1', Source__c='Web',  
    //   Works__c='Gen Repairs', S);
    //   insert b;
       
 //    Test.StartTest();
 //       pageRef.getParameters().put('Id', String.valueOf(b.Id));
    
    @isTest public static void BayBoat1Test(){
       
     PageReference pageRef = Page.Bayinshore;
     //   Test.setCurrentPage(pageRef);
              
     BoatSoldController cntr = new BoatSoldController();
       PageReference pg = cntr.Bayinshore();
       System.assertEquals(pageRef, pg); //assertion
    }

    @isTest public static void CenterinshoreBoat1test(){
       
        PageReference pageRef = Page.Bayinshore;
        //   Test.setCurrentPage(pageRef);
                 
        BoatSoldController cntr = new BoatSoldController();
          PageReference pg = cntr.Centerinshore();
          System.assertEquals(pageRef, pg); //assertion
       }


}