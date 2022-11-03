/**
 * Created by lukas on 23.08.2022.
 */

public with sharing class DiaryController {

    @AuraEnabled(Cacheable=true)
    public static List<Diary__c> getDiaryByContactId(Id contactId){
        return [SELECT Note__c, Created_Date__c FROM Diary__c WHERE Contact__c = :contactId];
    }

    @AuraEnabled
    public static void addDiary(Id contactId, String note){
        insert new Diary__c(Contact__c = contactId,Note__c = note);
    }

}