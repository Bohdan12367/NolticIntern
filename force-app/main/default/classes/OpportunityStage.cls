/**
 * Created by lukas on 22.07.2022.
 */

public with sharing class OpportunityStage {
    public static List<Opportunity> updateOpportunityStage(String stageNew, String stageOld) {
        List <Opportunity> opportunities = [SELECT Name, StageName FROM Opportunity WHERE StageName = :stageOld];
        Boolean is;
        System.debug(is);
        System.debug(opportunities);
        List<Schema.PicklistEntry> optionStages = Opportunity.StageName.getDescribe().getPicklistValues();
        System.debug(optionStages);
        List<String> getValue= new List<String>();
        for (Schema.PicklistEntry op : optionStages) {
            getValue.add(op.getValue());
        }
        System.debug(getValue);
        if(getValue.contains(stageNew) && getValue.contains(stageOld)){
            for (Opportunity opp : opportunities) {
                if (opp.StageName == stageOld) {
                    opp.StageName = stageNew;
                }
            }
        } else {
            System.debug('Error! Not a valid value!');
        }
        update opportunities;
        return opportunities;
    }
}