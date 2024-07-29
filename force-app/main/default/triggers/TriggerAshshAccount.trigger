trigger TriggerAshshAccount on Account (after insert) { 
    
 list<Account>addlist=new list<Account>();
    for(Account acc:trigger.new){
       
       addlist.add(acc);
        
      
        
    }
  list<Contact>conlist=new list<Contact>();
  
    for (integer i=0;i<=10;i++) {
            
       Contact con=new Contact();     
        con.AccountID = addlist[i].id;
            con.LastName = 'addlist.Name'+i;
            conlist.add(con);
            
            
        }  
Database.insert(conlist,false);
}