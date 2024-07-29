public class accountprovider {
    public static list<account>getAccountRecord(){
        
        list<account>acclist=[select ID,Name from account];
        return acclist;
        
        
        
    }
}