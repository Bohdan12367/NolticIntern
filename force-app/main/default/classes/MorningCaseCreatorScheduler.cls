global class MorningCaseCreatorScheduler implements Schedulable{
    global void execute(SchedulableContext sc){
        Case cs = new Case(Subject = 'Morning Case -'+system.today().format());
        insert cs;
    }
}