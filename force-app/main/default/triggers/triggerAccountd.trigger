trigger triggerAccountd on Account (after delete) {   
    set<id>addset=new set<id>();  
    for(Account objacc:trigger.old){ 
        addset.add(objacc.id);    
    }
    list<Contact>addlist=new list<Contact>();
    if(!addset.isEmpty()){
        
        for(Contact objcon:[select id,AccountID from Contact where AccountID IN:addset]){
            
            addlist.add(objcon);
            
            
        }  
        
        
        }
    
    Database.delete(addlist,false);

}