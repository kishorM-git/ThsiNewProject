public class AccountRecursiveHandler {
    public static boolean flag=False;
    public static void insertrecord(list<Account>accnewlist){
        if(!flag){
            flag=true;
        AccountRecursiveHelperTrigger.insertnew(accnewlist);
        }  
    }

}