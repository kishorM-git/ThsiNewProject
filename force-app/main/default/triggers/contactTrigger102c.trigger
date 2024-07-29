trigger contactTrigger102c on Contact (before insert,before update) {
    
   set<string>conset=new set<string>(); 
    if(trigger.isInsert || trigger.isUpdate  && trigger.isBefore){
    for(Contact objcon:trigger.new){
       conset.add(objcon.Email);
                
                
            }
          
    } 
    
    
    
    list<Contact>conlist=[select id,Email from Contact where Email IN:conset];
    map<string,Contact>conmap=new map<string,Contact>();
    for(Contact objcon:conlist){
        conmap.put(objcon.Email,objcon);
        

    }
  
    for(Contact objcon:trigger.new){
        if(string.isNotBlank(objcon.Email)){
        if(conmap.containsKey(objcon.Email)){
            
            objcon.adderror('duplicate email id Found');
        
        }                                    
        }
        }
    
    
        
        
    }