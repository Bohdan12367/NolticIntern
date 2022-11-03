/**
 * Created by lukas on 29.07.2022.
 */

@IsTest
private class CaseTriggerTest {
    @IsTest
    static void testCase() {
        Country__c objCountry = new Country__c(Name='Portugal',Closed_Cases__c = 10,Success_Message__c = 'Hello, this is Portugal');
        insert objCountry;
        Country__c objCountry1 = new Country__c(Name='Ukraine',Closed_Cases__c = 11,Success_Message__c = 'Hello, this is Ukraine');
        insert objCountry1;
        List<Case> cases = new List<Case>();
        Case objCase = new Case(Country__c = objCountry.Id,Status = 'Closed');
        Case objCase1 = new Case(Country__c = objCountry1.Id,Status = 'Closed');
        Case objCase2 = new Case(Country__c = objCountry1.Id,Status = 'Closed');
        Case objCase3 = new Case(Country__c = objCountry.Id,Status = 'Closed');
        cases.add(objCase1);
        cases.add(objCase2);
        cases.add(objCase3);
        Test.startTest();
        insert objCase;
        insert cases;
        Test.stopTest();
        System.equals(objCountry1.Closed_Cases__c,13);
        System.equals(objCountry1.Success_Message__c,objCase2.Received_Success_Message__c);
        System.equals(objCountry.Closed_Cases__c,12);
        System.equals(objCountry.Success_Message__c,objCase3.Received_Success_Message__c);
    }
}