/*
    Created By :- Dheeraj Sharma
    Date :- 04-Jan-2023
*/
trigger OpportunityTrigger on Opportunity (before update, after update) {
    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            OpportunityTriggerHandler.beforeUpdateHandler(Trigger.newMap, Trigger.oldMap);
        }
        if (Trigger.isAfter) {
            OpportunityTriggerHandler.afterUpdateHandler(Trigger.newMap, Trigger.oldMap);
        }
    }
}
