global class BatchContactToAccount implements Database.Batchable<sObject> {    
    global  Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id,FirstName,LastName,LeadSource,AccountId,Account.Name,Account.Description from contact where LeadSource=\'Web\'');
        
    }
    global void execute(Database.BatchableContext BC,list<Contact>conlist){//trigger.new
        set<id>accidset=new set<id>();
        if(!conlist.isEmpty()){
            for(contact objcon:conlist){
                if(objcon.AccountId!=Null){
                    accidset.add(objcon.AccountId);
                }
                
            }
            
        }
        map<id,Account>accmap=new map<id,Account>();
        if(!conlist.isEmpty()){
            for(Account objacc:[select Name,Description FROM Account where id IN:accidset]){
              accmap.put(objacc.id,objacc);
            }
        }
        if(!accmap.isEmpty()){
            for(Contact objcon:conlist){
                if(accmap.containskey(objcon.Accountid)){
                    if(string.isBlank(accmap.get(objcon.AccountId).Description)){
                      accmap.get(objcon.AccountId).Description=objcon.FirstName+''+objcon.LastName+''+objcon.LeadSource; 
                    }
                    else{
                  accmap.get(objcon.AccountId).Description=  accmap.get(objcon.AccountId).Description+ '\n'+ objcon.FirstName+''+objcon.LastName+''+objcon.LeadSource; 
                        
                       
                    }
                }
                
            }
            Database.update(accmap.values(),false);
        }     
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}