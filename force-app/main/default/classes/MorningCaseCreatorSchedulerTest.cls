@IsTest
private class MorningCaseCreatorSchedulerTest {

    public static String CRON_EXP= '0 0 7 1/1 * ? *';

    @IsTest
    static void testScheduler() {
        Test.startTest();
        String jobId = System.schedule('ScheduleApexClassTest',
                CRON_EXP,
                new MorningCaseCreatorScheduler());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
        FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP,
                ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2022-09-12 07:00:00',
                String.valueOf(ct.NextFireTime));
        Test.stopTest();

    }
}