public with sharing class EmptyManufacturingDateController {
    public List<Boat_Manufacturing__c> getEmptyManufacturingDate(){
        List<Boat_Manufacturing__c> boats = Database.query(
            'SELECT Id, Name, Manufacturing_Start_Date__c '+
            'FROM Boat_Manufacturing__c '+
            'WHERE Manufacturing_Start_Date__c = null '
        );
        return boats;
    }
}
