/**
 * Created by lukas on 29.07.2022.
 */

@IsTest
private class TestContactTrigger {
//    @IsTest
//    static void testContactPersonal() {
//        Account objAccount = new Account(Name = 'Test');
//        insert objAccount;
//        Account objAccount2 = new Account(Name = 'Test 2');
//        insert objAccount2;
//        Contact objContact = new Contact(LastName = 'Test Contact', AccountId = objAccount.Id);
//        Contact objContact2 = new Contact(LastName = 'Test Contact 1', AccountId = objAccount2.Id);
//        Test.startTest();
//
//        insert objContact;
//        insert objContact2;
//
//        Test.stopTest();
//        System.assertEquals('Personal', [SELECT Type__c FROM Account WHERE Id =: objAccount.Id].Type__c );
//        System.assertEquals('Personal', [SELECT Type__c FROM Account WHERE Id =: objAccount2.Id].Type__c );
//    }
//    @IsTest
//    static void testContactBusiness(){
//        Account objAccount1 = new Account(Name = 'Test 1');
//        insert objAccount1;
//        Contact objContact1 = new Contact(LastName = 'Test Contact 1', AccountId = objAccount1.Id);
//        Test.startTest();
//
//        insert objContact1;
//
//        delete objContact1;
//
//        Test.stopTest();
//        System.assertEquals('Business', [SELECT Type__c FROM Account WHERE Id =: objAccount1.Id].Type__c );
//    }
//    @IsTest
//    static void testContactCompany(){
//        Account objAccount3 = new Account(Name = 'Test 3');
//        insert objAccount3;
//        List<Contact> con = new List<Contact>();
//        for(Integer i=0;i<101;i++){
//            Contact contact = new Contact(LastName = 'test' +i,AccountId = objAccount3.Id);
//            con.add(contact);
//        }
//        Test.startTest();
//
//        insert con;
//
//        Test.stopTest();
//        System.assertEquals('Company', [SELECT Type__c FROM Account WHERE Id =: objAccount3.Id].Type__c );
//    }
}