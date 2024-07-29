trigger teiggercontact on Contact (after insert) {
    
   List<Account> accList = new List<Account>();
     for(Contact objCon : trigger.new){
        
        
       
        
        Account objAcc = new Account();
        objAcc.Name = objCon.FirstName +' ' +objCon.LastName;
        objAcc.Phone = objCon.Phone;
        accList.add(objAcc);
        
        
    }
    database.Insert(accList,false);

}