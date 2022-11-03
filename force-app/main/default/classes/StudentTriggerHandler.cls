/**
 * Created by lukas on 28.07.2022.
 */

public with sharing class StudentTriggerHandler {
    public static void handle(List<Student__c> newStudents, System.TriggerOperation triggerOperation) {

        switch on triggerOperation {
            when BEFORE_INSERT {
                StudentService.validateStudentAge(newStudents);
            }
            when BEFORE_UPDATE {
                StudentService.validateStudentAge(newStudents);
            }
//            when AFTER_INSERT {
//                StudentService.updateAmountOfStudentsOnClass(newStudents);
//            }
//            when AFTER_UPDATE {
//                StudentService.updateAmountOfStudentsOnClass(newStudents);
//            }
        }
    }
}