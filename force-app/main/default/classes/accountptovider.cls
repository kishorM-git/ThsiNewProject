public  class accountptovider {
    @invocablemethod
      public static list <account>aapp(){
    
 list<Account> aplist =  [Select Name, Type,Phone, Rating from Account where Type='Prospect'and Rating='Hot' ];
    return  aplist; 

      }
}