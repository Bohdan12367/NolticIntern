@IsTest
public class AccountProcessorTest {
	@IsTest
    private static void TestCount(){
        List<Account> accs = new List<Account>();
        for(Integer i=0;i<200;i++){
            accs.add(new Account(Name = 'Ivan'+i));
        }
        insert accs;
        
        List<Contact> cns = new List<Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc: accs){
            cns.add(new Contact(FirstName = acc.Name, AccountId=acc.Id));
            accIds.add(acc.id);
        }
        
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        
        
    }
}