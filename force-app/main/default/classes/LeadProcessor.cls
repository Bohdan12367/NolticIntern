public with sharing class LeadProcessor implements Database.Batchable<SObject>{
	public Database.QueryLocator start(Database.BatchableContext bc){
        final String query = 'SELECT LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadToUpdates = new List<Lead>();
        for(Lead l: scope){
            l.LeadSource = 'Dreamforce';
            leadToUpdates.add(l);
        }
        update leadToUpdates;
    }
    public void finish(Database.BatchableContext bc){

    }
}