/**
 * Created by lukas on 28.07.2022.
 */

public with sharing class StudentSelector {
    public static List<Student__c> getByClassIds(Set<Id> classIds) {
        return [SELECT Class__c, Teacher__c FROM Student__c WHERE Class__c IN : classIds];
    }

    public static List<AggregateResult> getAmountOfStudentsForEachClass() {
        return [SELECT Class__c, COUNT(Id) amount FROM Student__c GROUP BY Class__c];
    }
}