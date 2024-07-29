public class accounttableVF_CX {
   public list<Account> alist{get;set;}
    public accounttableVF_CX(ApexPages.StandardController controller) {
    String accType = ApexPages.currentPage().getParameters().get('Type');
     String accrating = ApexPages.currentPage().getParameters().get('Rating');
        
        
    alist=[select Name,Type,Rating from Account where Type=:accType and  Rating=:accrating  limit 5 ];
    system.debug('account type='+alist.size());
    
    
    

    }

}