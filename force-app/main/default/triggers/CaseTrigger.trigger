/**
 * Created by lukas on 28.07.2022.
 */

trigger CaseTrigger on Case ( after insert, after update, before insert, before update) {
    if(Trigger.isBefore) {
        CaseTriggerHandler.updateCase(Trigger.new);
    }
    if(Trigger.isAfter){
        CaseTriggerHandler.updateCountry(Trigger.new);
    }
}