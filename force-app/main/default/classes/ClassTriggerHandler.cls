/**
 * Created by lukas on 28.07.2022.
 */

public with sharing class ClassTriggerHandler {
    public static void handler(Map<Id, Class__c> idClassMapNew, Map<Id, Class__c> idClassMapOld, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when AFTER_UPDATE {
                ClassService.updateTeachersForStudents(idClassMapNew, idClassMapOld);
            }
        }
    }
}