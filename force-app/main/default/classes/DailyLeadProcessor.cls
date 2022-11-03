global class DailyLeadProcessor implements Schedulable{
	global void execute(SchedulableContext sc){
        List<Lead> l = [SELECT LeadSource From Lead WHERE LeadSource=''];
        List<Lead> leadUpdate = new List<Lead>();
        for(Lead lead:l){
            lead.LeadSource = 'Dreamforce';
            leadUpdate.add(lead);
        }
        update leadUpdate;
    }
}