trigger TriggerAccountRahul on Account (after insert,after update) {
    list<Contact>addlist=new list<Contact>();
    map<id,Account>putmap=new map<id,Account>();
    for(Account objacc:trigger.new){
        
        if(string.isNotBlank(objacc.email_id__c)  && (string.isNotBlank(objacc.Name))){
            
            Contact obj =new Contact();
            obj.AccountId=objacc.id;
            obj.FirstName='kk';
            obj.LastName=objacc.Name;
            obj.Email=objacc.email_id__c;
            addlist.add(obj);
            
            
            
            
        }
        putmap.put(objacc.id,objacc);
        
    }
    database.insert(addlist,false);
     List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    for(Contact obj:[select id,Email,AccountID from Contact where AccountID IN:putmap.keySet()]) {
        if(putmap.containsKey(obj.AccountId)){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {obj.Email});
            mail.setSenderDisplayName('Account is created successfully');
            mail.setSubject('Account is created successfully');
            mail.setPlainTextBody('Account is created successfully');
            mailList.add(mail);            
            
            
            
        }
        
        
        
        
    }   
    
    
            if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);  
    }

    
    
    
    
    
    
    
    
    
    
    
    
    

}