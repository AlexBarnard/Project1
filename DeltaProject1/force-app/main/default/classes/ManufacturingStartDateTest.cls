@isTest
public class ManufacturingStartDateTest {
    @TestSetup
    static void makeData(){
        List<Boat_Manufacturing__c> boats = new List<Boat_Manufacturing__c>();
        boats.add(new Boat_Manufacturing__c(Name = 'Test1', Manufacturing_Start_Date__c = Null));
        boats.add(new Boat_Manufacturing__c(Name = 'Test2', Manufacturing_Start_Date__c = Null));
        boats.add(new Boat_Manufacturing__c(Name = 'Test3', Manufacturing_Start_Date__c = Null));
        boats.add(new Boat_Manufacturing__c(Name = 'Test4', Manufacturing_Start_Date__c = System.today()));
        insert boats;
    }
    @isTest
    static void testSOQL(){
        Test.startTest();
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        System.assertEquals(emdc.boats.size(), 3);
        emdc.setAllToday();
        emdc.saveAll();
        System.assertEquals(emdc.boats[0].Manufacturing_Start_Date__c, System.today());
        Test.stopTest();
    }

    @isTest
    static void testSetAllToday(){
        Test.startTest();
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        emdc.setAllToday();
        for(Boat_Manufacturing__c boat:emdc.boats){
            System.assertEquals(boat.Manufacturing_Start_Date__c, System.today());
        }
        Test.stopTest();
    }

    @isTest
    static void testValidationErrorSaveAll(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        Double randomNumber = Math.random(); 
        Integer arrayLength = emdc.boats.size(); 
        Integer randomIndex = (randomNumber *(arrayLength-1)).intValue(); 
        emdc.boats[randomIndex].Manufacturing_Start_Date__c = Date.newInstance(2021, 12, 25);
        List<Apexpages.Message> msgs;
        Test.startTest();
        emdc.saveAll();
        msgs = ApexPages.getMessages();
        System.assert(ApexPages.hasMessages());
        boolean b = false;
        for(Apexpages.Message msg:msgs){
            if (msg.getDetail().contains('Boat manufacturing start date cannot be scheduled on a holiday')) b = true;
        }
        system.assert(b);//Assert the Page Message was Properly Displayed
        Test.stopTest();
    }

    @isTest
    static void testValidationErrorSave(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        Double randomNumber = Math.random(); 
        Integer arrayLength = emdc.boats.size(); 
        Integer randomIndex = (randomNumber *(arrayLength-1)).intValue(); 
        emdc.boats[randomIndex].Manufacturing_Start_Date__c = Date.newInstance(2021, 12, 25);
        List<Apexpages.Message> msgs;
        Test.startTest();
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c != NULL){
                emdc.boatId = boat.id;
            }
        }
        emdc.save();
        msgs = ApexPages.getMessages();
        System.assert(ApexPages.hasMessages());
        boolean b = false;
        for(Apexpages.Message msg:msgs){
            if (msg.getDetail().contains('Boat manufacturing start date cannot be scheduled on a holiday')) b = true;
        }
        system.assert(b);//Assert the Page Message was Properly Displayed
        Test.stopTest();
    }

    @isTest
    static void testClearMethods(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        emdc.setAllToday();
        Double randomNumber = Math.random(); 
        Integer arrayLength = emdc.boats.size(); 
        Integer randomIndex = (randomNumber *(arrayLength-1)).intValue(); 
        emdc.boatId = emdc.boats[randomIndex].id;
        emdc.clear();
        Integer count = 0;
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c == NULL){
                count++;
            }
        }
        system.assertEquals(1, count);
        emdc.clearAll();
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c != NULL){
                count++;
            }
        }
        system.assertEquals(1, count);
    }
}
