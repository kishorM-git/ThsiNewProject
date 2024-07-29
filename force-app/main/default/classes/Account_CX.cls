public  class Account_CX {
public list <account> acclist{get;   set;}
    public Account_CX(ApexPages.StandardController controller) {
  accList  =  [Select Name, Type, Rating from Account where Type='Prospect'and Rating='Hot' limit 7];
    acclist =accountprovider.getAccountRecord(); 

    }
}