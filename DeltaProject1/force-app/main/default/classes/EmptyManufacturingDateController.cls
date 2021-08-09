public with sharing class EmptyManufacturingDateController {
    public List<Boat_Manufacturing__c> boats{get; set;}
    public string boatId{get; set;}

    public EmptyManufacturingDateController(){
        List<Boat_Manufacturing__c> manufacturingList = Database.query(
            'SELECT Id, Name, Manufacturing_Start_Date__c '+
            'FROM Boat_Manufacturing__c '+
            'WHERE Manufacturing_Start_Date__c = null '
        );
        boats = manufacturingList;
    }

    public PageReference save(){
        for(Boat_Manufacturing__c boat:boats){
            if(boat.id == boatId){
                update boat;
            }
        }
        return null;
    }

    public PageReference saveAll(){
        update boats;
        return null;
    }
}
