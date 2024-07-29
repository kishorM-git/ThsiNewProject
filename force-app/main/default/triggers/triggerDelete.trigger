trigger triggerDelete on Account (before delete) {
    
    
    for(Account objcon:trigger.old){
        if(string.isNotBlank(objcon.Type)){
            if(objcon.Type=='Prospect'){
                objcon.adderror('Record not delete');
                
                
            }
            
            
        }
        
        
    }

}