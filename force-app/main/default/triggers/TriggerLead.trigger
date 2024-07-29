trigger TriggerLead on Lead (before insert,before update) {
    
    set<String>addset=new set<string>();
    for(Lead objl:trigger.new){
        if(string.isNotEmpty(objl.FirstName)){  
            addset.add(objl.FirstName);
           
        }      
    }
    map<string,Contact>putmap=new map<string,Contact>();
    
    for(Contact objcon:[select id,FirstName,LastName,Email from Contact where FirstName IN:addset]){
        
putmap.put(objcon.FirstName,objcon);        
        
        
    }
    
    for(Lead objll:trigger.new){
        if(putmap.containsKey(objll.FirstName)){
            
      objll.Email=putmap.get(objll.FirstName).Email;
            
            
            
        }
        
        
        
    }
}