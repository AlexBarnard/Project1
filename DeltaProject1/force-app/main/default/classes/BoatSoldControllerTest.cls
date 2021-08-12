@isTest
public class BoatSoldControllerTest {

    //  Boat_Sold__c b = new Boat_Sold__c(Name= 'Boat1', Source__c='Web',  
    //   Works__c='Gen Repairs', S);
    //   insert b;
       
 //    Test.StartTest();
 //       pageRef.getParameters().put('Id', String.valueOf(b.Id));
  //System.assertEquals(null, pg); //assertion
    
    @isTest public static void BayBoat1Test(){
       
     PageReference pageRef = Page.Bayinshore;
     //   Test.setCurrentPage(pageRef);
              
     BoatSoldController cntr = new BoatSoldController();
     PageReference pg = cntr.Bayinshore();
     System.assertNotEquals(null, pg); 
    }

    @isTest public static void CenterinshoreBoat1test(){
       
        PageReference pageRef = Page.Centerinshore;
        //   Test.setCurrentPage(pageRef);
                 
        BoatSoldController cntr = new BoatSoldController();
          PageReference pg = cntr.Centerinshore();
          System.assertNotEquals(null, pg); //assertion
       }

       @isTest public static void FlatinshoreBoat1test(){
       
         PageReference pageRef = Page.Flatinshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Flatinshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void CenteroffshoreBoat1test(){
       
         PageReference pageRef = Page.Centeroffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Centeroffshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void ConvertibleoffshoreBoat1test(){
       
         PageReference pageRef = Page.Convertibleoffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Convertibleoffshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void WalkaroundoffshoreBoat1test(){
       
         PageReference pageRef = Page.Walkaroundoffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Walkaroundoffshore();
           System.assertNotEquals(null, pg); //assertion
        }

}