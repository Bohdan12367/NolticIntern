@IsTest
public class LeadProcessorTest {
	 @TestSetup
    private static void setupTestData(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0;i<200;i++){
            Lead l = new Lead(LastName = 'Ivan'+i,Company='Google',LeadSource = 'Dreamforce');
            leads.add(l);
        }
        insert leads;
    }

    @IsTest
    private static void testBatch() {
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();

        System.assertEquals(200,[SELECT COUNT() FROM Lead WHERE LeadSource='Dreamforce']);
    }
}