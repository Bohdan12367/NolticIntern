/**
 * Created by lukas on 11.09.2022.
 */

@IsTest
private class ChangeAccountNamesBatchTest {
    @TestSetup
    private static void setupTestData(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0;i<100;i++){
            Account newAccount = new Account(Name = 'Batch Processed');
            accounts.add(newAccount);
        }
        insert accounts;
    }

    @IsTest
    private static void testBatch() {
        Test.startTest();
        Database.executeBatch(new ChangeAccountNamesBatch());
        Test.stopTest();

        System.assertEquals(100,[SELECT COUNT() FROM Account WHERE Name='Batch Processed']);
    }
}