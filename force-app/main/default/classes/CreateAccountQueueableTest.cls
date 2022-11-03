/**
 * Created by lukas on 11.09.2022.
 */

@IsTest
private class CreateAccountQueueableTest {
   @IsTest
   static void testAccountQueueable(){
        Account testAccount = new Account(Name='Queueable');
        CreateAccountQueueable queueable = new CreateAccountQueueable(testAccount.Name);

        Test.startTest();
        System.enqueueJob(queueable);
        Test.stopTest();

       System.assertEquals(1,[SELECT COUNT() FROM Account WHERE Name='Queueable']);
    }
}