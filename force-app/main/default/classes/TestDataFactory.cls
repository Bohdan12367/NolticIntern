@IsTest
public with sharing class TestDataFactory {

    public static Student__c createStudent() {
        return new Student__c(Name = 'TestStudent');
    }

    public static List<Student__c> createStudents(Integer amountOfStudents) {
        List<Student__c> students = new List<Student__c>();

        for (Integer i = 0; i < amountOfStudents; i++) {
            students.add(new Student__c(Name = 'Test' + i));
        }

        return students;
    }

    public static List<Student__c> createStudentsForClass(Integer amountOfStudents, Id classId) {
        List<Student__c> students = new List<Student__c>();

        for (Integer i = 0; i < amountOfStudents; i++) {
            students.add(new Student__c(Name = 'Test' + i, Class__c = classId));
        }

        return students;
    }

    public static Class__c createClass() {
        return new Class__c(Name = 'TestClass');
    }
}