public class OpportunityTriggerHandler {
    // List to store tasks affected by Opportunity updates
    private static List<Task> affectedTasks;

    /**
     * Handles logic before updating Opportunities.
     * Identifies Opportunities with owner changes and retrieves associated open tasks.
     *
     * @param newOpportunityById New Opportunities mapped by Id.
     * @param oldOpportunityById Old Opportunities mapped by Id.
     */
    public static void beforeUpdateHandler(Map<Id, Opportunity> newOpportunityById, Map<Id, Opportunity> oldOpportunityById) {
        Set<Id> changedOwnerOppIds = new Set<Id>();
        Set<Id> oldOwnerIds = new Set<Id>();

        for (Opportunity newOpp : newOpportunityById.values()) {
            Opportunity oldOpp = oldOpportunityById.get(newOpp.Id);
            if (newOpp.OwnerId != oldOpp.OwnerId) {
                changedOwnerOppIds.add(newOpp.Id);
                oldOwnerIds.add(oldOpp.OwnerId);
            }
        }

        affectedTasks = TaskSelector.getOpenTasksByOppAndOwnerIds(changedOwnerOppIds, oldOwnerIds);
    }

    /**
     * Handles logic after updating Opportunities.
     * Updates the tasks affected by Opportunity updates.
     *
     * @param newOpportunityById New Opportunities mapped by Id.
     * @param oldOpportunityById Old Opportunities mapped by Id.
     */
    public static void afterUpdateHandler(Map<Id, Opportunity> newOpportunityById, Map<Id, Opportunity> oldOpportunityById) {
        if(!affectedTasks.isEmpty()){
            update affectedTasks;
        }
    }
}
