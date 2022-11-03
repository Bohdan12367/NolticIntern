/**
 * Created by lukas on 21.08.2022.
 */

public with sharing class ContactController {

    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactByAccountId(Id accountId){
        return [SELECT Name,Title,Email,Phone FROM Contact WHERE AccountId = :accountId];
    }

    @AuraEnabled
    public static void addContact(Id accountId, String lastName){
        insert new Contact(AccountId = accountId, LastName = lastName,Title='Hello',Phone = '104');
    }
}