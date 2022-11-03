public with sharing class ContactTriggerHandler {
    public static void updateAccount(List<Contact> contacts){
        Integer count;

        Set<Id> accId= new Set<Id>();
        for(Contact con : contacts){
            accId.add(con.AccountId);
        }

        List<Account> accList = [SELECT Id,Name,Type__c ,(SELECT Id FROM Contacts) FROM Account WHERE Id IN : accId];
        for(Account acc : accList){
            count = acc.Contacts.size();
            if(count == 1){
                acc.Type__c = 'Personal';
            }
            else if(count >= 100){
                acc.Type__c = 'Company';
            }
            else if(count>1 || count<100){
                acc.Type__c = 'Business';
            }
        }
        update accList;
    }
}