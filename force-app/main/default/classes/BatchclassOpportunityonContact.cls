global class BatchclassOpportunityonContact implements database.Batchable<sObject>{
     global   database.queryLocator start(Database.BatchableContext BC) {
        
        return database.getQueryLocator('select id,	Level__c,Name,AccountId from Contact where 	Level__c=\'Secondary\'');
        
    }
    global void execute(Database.BatchableContext BC,list<Contact>listCon){
    list<Opportunity>addlist    =new list<Opportunity>();
        for(Contact objcon:listCon){
           
            Opportunity objopp=new opportunity();
            
         objopp.ContactId=objcon.id;
                objopp.Name='Jai ho babaji';
            objopp.CloseDate=system.Today();
            objopp.StageName='Prospecting';
            addlist.add(objopp);
            
            
            
        }
       Database.SaveResult[] adr=database.insert(addlist,false);
    }
    global void finish (Database.BatchableContext BC){
        
        
    }

}