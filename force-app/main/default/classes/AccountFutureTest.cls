@IsTest
private class AccountFutureTest {
    @IsTest
    static void testAccountFuture() {

        Account testAccount = new Account(Name='Bohdan');

        Test.startTest();
        AccountFuture.createAccountFuture('Bohdan');
        Test.stopTest();

        System.assertEquals(1,[SELECT COUNT() FROM Account WHERE Name='Bohdan']);
    }
}