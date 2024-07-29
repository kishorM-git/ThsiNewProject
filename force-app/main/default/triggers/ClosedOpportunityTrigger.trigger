trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    list<Task>taskList=new list<Task>();
    
    for(Opportunity objacc:trigger.new){
        
      
        if(objacc.StageName=='Closed Won'){
            
               taskList.add(new Task(
 

                     
                      WhatId = objacc.Id, //Assigned to ID
 
                    Subject='Follow Up Test Task'

                   
 

                      ))  ;                                                 
        
                   }
            
            
        }
    
        
        database.insert(taskList,false);
    
}