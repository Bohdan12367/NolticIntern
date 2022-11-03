public with sharing class CreateAccountQueueable implements Queueable{
    private String accountName;
    public CreateAccountQueueable(String name){
        this.accountName = name;
    }

    public void execute(QueueableContext context){
        Account acc = new Account(Name = accountName);
        insert acc;
    }
}