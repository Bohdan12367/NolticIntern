/**
 * Created by lukas on 28.07.2022.
 */

trigger StudentTrigger on Student__c (before insert, before update, after insert, after update) {
    StudentTriggerHandler.handle(Trigger.new, Trigger.operationType);
}