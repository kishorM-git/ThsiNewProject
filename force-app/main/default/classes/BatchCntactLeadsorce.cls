global class BatchCntactLeadsorce implements Database.Batchable<sobject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        string query='select id,Name,LeadSource,Level__c from Contact where LeadSource!=\'Purchased List\' and LeadSource!=\'Other\'';      
            return Database.getQueryLocator(query); 
    }
    global void execute(Database.BatchableContext BC,list<Contact>ctlist){
        if(!ctlist.isEmpty()){
            for(Contact objct:ctlist){
                if(objct.LeadSource=='Web' && objct.Level__c!='Primary'){
                    objct.Level__c='Primary';
                }
                else
                    if((objct.LeadSource=='Phone Inquiry'||objct.LeadSource=='Partner Referral')&& objct.Level__c!='Tertiary'){
                       objct.Level__c='Tertiary';
                    }
                else{
                    objct.Level__c='';
                }
                    
                
                    
                
                    
                   
            }
            Database.update(ctlist,false);
        }
            
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}