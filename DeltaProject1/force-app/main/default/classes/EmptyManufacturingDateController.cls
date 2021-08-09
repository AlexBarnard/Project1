public with sharing class EmptyManufacturingDateController {
    public List<Boat_Manufacturing__c> boats{get; set;}
    public Boat_Manufacturing__c boat{get; set;}

    public EmptyManufacturingDateController(){
        List<Boat_Manufacturing__c> manufacturingList = Database.query(
            'SELECT Id, Name, Manufacturing_Start_Date__c '+
            'FROM Boat_Manufacturing__c '+
            'WHERE Manufacturing_Start_Date__c = null '
        );
        boats = manufacturingList;
    }

    public PageReference saveAll(){
        update boats;
        return null;
    }
}
