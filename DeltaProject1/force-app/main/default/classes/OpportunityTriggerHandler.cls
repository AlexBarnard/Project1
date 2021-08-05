public class OpportunityTriggerHandler {
    public Void OpportunityDeletionPrevention(List<Opportunity> o) {
        for (Opportunity opp : (List<Opportunity>) Trigger.new) {
            if (opp.StageName == 'Closed Won' || opp.StageName == 'Closded Lost') {
                	opp.addError ('Cannot Delete records that are "Closed Won or Closed Lost"');
            }
        }
            
    }

}