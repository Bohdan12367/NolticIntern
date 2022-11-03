@IsTest
public class AddPrimaryContactTest {

    @IsTest
   static void testAccountQueueable(){
       List<Account> accs = new List<Account>();
       for(Integer i=0;i<50;i++){
           Account acc = new Account(Name='Ivan'+i,BillingState = 'NY');
           accs.add(acc);
       }
       for(Integer i=0;i<50;i++){
           Account acc = new Account(Name='Bohdan'+i,BillingState = 'CA');
           accs.add(acc);
       }
       insert accs;
       
       Contact contact = new Contact(LastName='Lukas');
       
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact,'CA'));
        Test.stopTest();

       System.assertEquals(1,[SELECT COUNT() FROM Contact WHERE Contact.Account.BillingState='CA']);
    }
}