@IsTest
private class AccountManagerTest {
	@isTest static void testGetAccountById() {
        Account a = new Account(Name='Ivan');
        insert a;
        Contact c = new Contact(AccountId=a.Id,FirstName='Test',LastName='Test');
        insert c;
        
        RestRequest request = new RestRequest();
        request.requestUri ='https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'+a.id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account account = AccountManager.getAccount();
        // Verify results
        System.assert(account != null);
        System.assertEquals('Ivan', account.Name);
    }
              
}