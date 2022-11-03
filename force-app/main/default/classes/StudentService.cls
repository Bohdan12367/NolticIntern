/**
 * Created by lukas on 28.07.2022.
 */

public with sharing class StudentService {
    public static void validateStudentAge(List<Student__c> students) {
        for (Student__c s : students) {
            if (s.Age__c < 6 /*|| s.Age__c == null*/) {
                s.addError('Student is too young!');
            }
        }
    }

    public static void updateAmountOfStudentsOnClass(List<Student__c> students) {
        Set<Id> classIds = new Set<Id>();

        for (Student__c s : students) {
            classIds.add(s.Class__c);
        }

        List<AggregateResult> aggregateResults = StudentSelector.getAmountOfStudentsForEachClass();

        List<Class__c> classes = new List<Class__c>();

        for (AggregateResult ar : aggregateResults) {
            classes.add(new Class__c(Id = (Id) ar.get('Class__c'), Students__c = (Integer) ar.get('amount')));
        }

        update classes;
    }
}