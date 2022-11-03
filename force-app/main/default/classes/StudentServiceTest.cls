/**
 * Created by lukas on 28.07.2022.
 */

@IsTest
private class StudentServiceTest {
    @IsTest
    static void validateStudentAge_positive() {

        //given
        Student__c student = new Student__c(Name = 'Tom', Age__c = 6);

        //whens
        Test.startTest();
        insert student;
        Test.stopTest();

        //then
        List<Student__c> students = [SELECT Id FROM Student__c];
        System.assertEquals(1, students.size());
    }

    @IsTest
    static void validateStudentAge_negative() {
        //given
        Student__c student = new Student__c(Name = 'Tom', Age__c = 5);
        Exception ex = null;

        //whens
        Test.startTest();
        try {
            insert student;
        } catch (Exception e) {
            ex = e;
        }
        Test.stopTest();

        //then
        System.assertNotEquals(null, ex);
        System.assert(ex != null);
        List<Student__c> students = [SELECT Id FROM Student__c];
        System.assertEquals(0, students.size());
    }

    @IsTest
    static void validateStudentAge_negative2() {
        //given
        Student__c student = new Student__c(Name = 'Tom');
        Exception ex = null;

        //whens
        Test.startTest();
        try {
            insert student;
        } catch (Exception e) {
            ex = e;
        }
        Test.stopTest();

        //then
        //System.assertNotEquals(null, ex);
        List<Student__c> students = [SELECT Id FROM Student__c];
        System.assertEquals(0, students.size());
    }

    @IsTest
    static void validateStudentAge_bulk(){
        //given
        List<Student__c> students = TestDataFactory.createStudents(20);

        //whens
        Test.startTest();
        insert students;
        Test.stopTest();

        //then
        List<Student__c> studentsInOb = [SELECT id FROM Student__c];
        System.assertEquals(20,studentsInOb.size());
    }
}