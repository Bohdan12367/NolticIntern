public class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact inputContact,String inputState){
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context) {
       List<Account> accs = [select id from account where billingstate =:state LIMIT 200];
        
        List<Contact> cts = new List<Contact>();
        
        for(Account acc:accs){
        
        	Contact contClone = contact.clone();
        	contClone.AccountId = acc.id;
            cts.add(contClone);
        }
        insert cts;
        
    }

}