public class AccountProcessor {
	
    @future
    public static void countContacts(List<ID> recordIds){
        List<Account> accounts = [Select Id,(SELECT id FROM Contacts) from Account Where Id IN :recordIds];
        
        for(Account acc: accounts){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update accounts;
    }
}