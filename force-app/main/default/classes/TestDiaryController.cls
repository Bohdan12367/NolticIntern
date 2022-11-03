/**
 * Created by lukas on 24.08.2022.
 */

@IsTest
private class TestDiaryController {
        @IsTest
        static void testNewDiary() {

            Diary__c objDiary = new Diary__c(Note__c = 'Hello,my name Bohdan',Contact__c = '0037R00003Ep2VTQAZ');
            insert objDiary;

            Test.startTest();
            DiaryController.addDiary(objDiary.Contact__c,objDiary.Note__c);
            Test.stopTest();

    }

        @IsTest
        static void testGetDiaryByContactId(){
            Diary__c objDiary = new Diary__c(Note__c = 'Hello,my name Bohdan',Contact__c = '0037R00003Ep2VTQAZ');
            insert objDiary;

            Test.startTest();
            DiaryController.getDiaryByContactId(objDiary.Contact__c);
            Test.stopTest();

            System.assertEquals('Hello,my name Bohdan', [SELECT Note__c FROM Diary__c WHERE Id =: objDiary.Contact__c].Note__c );
        }
}