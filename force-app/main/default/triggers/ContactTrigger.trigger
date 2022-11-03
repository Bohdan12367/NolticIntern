/*
 * Created by lukas on 28.07.2022.
 */

trigger ContactTrigger on Contact ( after insert,after delete, after undelete) {
    if(Trigger.isInsert || Trigger.isUndelete){
        ContactTriggerHandler.updateAccount(Trigger.new);
    }
    if(Trigger.isDelete){
        ContactTriggerHandler.updateAccount(Trigger.old);
    }
}