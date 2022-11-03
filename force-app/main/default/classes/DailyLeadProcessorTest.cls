@IsTest
public class DailyLeadProcessorTest {

     public static String CRON_EXP= '0 0 7 1/1 * ? *';
		
    @IsTest
    static void testScheduler() {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead l = new Lead(LastName='Ivan'+i,Company='Google');
            leads.add(l);
        }
        insert leads;
        Test.startTest();
        String jobId = System.schedule('ScheduleApexClassTest',
                CRON_EXP,
                new DailyLeadProcessor());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
        FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP,
                ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2022-09-14 07:00:00',
                String.valueOf(ct.NextFireTime));
        Test.stopTest();
    }
    
}