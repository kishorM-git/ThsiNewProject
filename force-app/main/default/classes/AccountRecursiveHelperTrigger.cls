public class AccountRecursiveHelperTrigger {
    public static void insertnew(list<Account>accnewlist){
        list<Account> acclist=new list<Account>();
        for(Account objac:accnewlist){
            Account objnewcc= new Account(Name='abc');
            acclist.add(objnewcc);
        }
       if(!acclist.isEmpty()) 
           insert acclist;
    }

}