global class BatchclassNoteAttchAccount implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id,Name from Account');
        
        
        
        
    }
    global void execute(Database.BatchableContext BC,List<Account>acclist){
        set<id>addset=new set<id>();
        for(Account objcc:acclist){
            addset.add(objcc.id);  
            
        }
        
        list<Note>addlist=new list<Note>();
        list<Attachment>addlistl=new list<Attachment>();
        for(Account obj:[select id,Name,(select id  from Notes),(select id from Attachments) from Account where Id IN:addset]){
           
           Note objcc=obj.Notes;
            addlist.add(objcc);
            
        }
        
        database.delete(addlist,false);
       
        
    }
    
    global void finish(Database.BatchableContext BC){
        
        
        
    }
    
    
    
    
}