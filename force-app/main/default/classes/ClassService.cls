/**
 * Created by lukas on 28.07.2022.
 */

public with sharing class ClassService {
    public static void updateTeachersForStudents(Map<Id, Class__c> idClassMapNew, Map<Id, Class__c> idClassMapOld) {

        Set<Id> classIds = idClassMapNew.keySet();

        List<Student__c> students = StudentSelector.getByClassIds(classIds);

        List<Student__c> studentsToUpdate = new List<Student__c>();

        for (Student__c s : students) {
            if (idClassMapNew.get(s.Class__c).Teacher__c != idClassMapOld.get(s.Class__c).Teacher__c) {
                s.Teacher__c = idClassMapNew.get(s.Class__c).Teacher__c;
                studentsToUpdate.add(s);
            }
        }

        update studentsToUpdate;
    }
}