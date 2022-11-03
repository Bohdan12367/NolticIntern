public class AccountUtils {
    public static List<Account> accountsByState(string billing){
        List<Account> acc = [SELECT Id, Name FROM Account WHERE BillingState =: billing];
        
        return acc;
    }

}