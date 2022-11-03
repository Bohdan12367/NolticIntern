/**
 * Created by lukas on 29.07.2022.
 */

public with sharing class CaseTriggerHandler {
    public static void updateCase(List<Case> cases){

        Set<String> countriesCase= new Set<String>();
        for(Case cas : cases){
            countriesCase.add(cas.Country__c);
        }
        List<Country__c> countries = [SELECT Id,Name,Success_Message__c FROM Country__c WHERE Id IN :countriesCase];
        for(Case cas : cases) {
                if (cas.Status == 'Closed') {
                    for(Country__c country :countries) {
                    cas.Received_Success_Message__c = country.Success_Message__c;
                }
            }
        }
    }
    public static void updateCountry(List<Case> CaseNew){
        List<Country__c> countries = [SELECT Name,Closed_Cases__c FROM Country__c];
        List<Country__c> countriesToUpdate = new List<Country__c>();
        Map<id,Country__c> countriesToUpdates = new Map<id,Country__c>();
        for(Case cs : CaseNew) {
            for(Country__c country :countries) {
                if (cs.Status == 'Closed') {
                    country.Closed_Cases__c +=1;
                    countriesToUpdate.add(country);
                    countriesToUpdates.putAll(countriesToUpdate);
                }
            }
        }
        update countriesToUpdates.values();
    }

}