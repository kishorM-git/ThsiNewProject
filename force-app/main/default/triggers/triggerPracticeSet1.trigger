trigger triggerPracticeSet1 on Account (before insert,before update) {
    
   set<string>addset=new set<string>(); 
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.Name)){
            addset.add(objacc.Name);
            
            
        } 
       map<string,Account>addaset=new map<string,Account>();
        for(Account objscc:[select Name ,id from Account]){
          addaset.put(objscc.Name,objscc)  ;
            
            
        }
        
        if(!addaset.isEmpty()){
        for(Account objsdd:trigger.new)
        {
            if(addaset.Containskey(objsdd.Name))  {
                objsdd.addError('duplicate Name');
                
                
                
            }
            
        }            
        }
        
        
        
    }

}