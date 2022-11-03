public with sharing class ChangeAccountNamesBatch implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        final String query = 'SELECT Name FROM Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> accountsToUpdates = new List<Account>();
        for(Account acc: scope){
            acc.Name = 'Batch Processed';
            accountsToUpdates.add(acc);
        }
        update accountsToUpdates;
    }
    public void finish(Database.BatchableContext bc){

    }
}