public with sharing class AccountFuture {

    @Future
    public static void createAccountFuture(String accountName){
        insert new Account(Name = accountName);
    }
}