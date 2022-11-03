/**
 * Created by lukas on 28.07.2022.
 */

trigger ClassTrigger on Class__c (after update) {
    ClassTriggerHandler.handler(Trigger.newMap, Trigger.oldMap, Trigger.operationType);
}