public class TaskSelector {
    /**
     * Retrieves open tasks associated with specified Opportunities and old owner Ids.
     *
     * @param oppIds   Set of Opportunity Ids.
     * @param ownerIds Set of old owner Ids.
     * @return List of open tasks.
     */
    public static List<Task> getOpenTasksByOppAndOwnerIds(Set<Id> oppIds, Set<Id> ownerIds) {
        return [SELECT Id, Subject, OwnerId, Owner.Name
                FROM Task
                WHERE Status != 'Completed'
                      AND WhatId IN :oppIds
                      AND OwnerId IN :ownerIds];
    }
}
