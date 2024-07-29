trigger Trigger23Account on Account (after insert) {
    
    list<Contact>addlist=new list<contact>();
    list<Opportunity>addoplist=new list<Opportunity>();
    for(Account obj:trigger.new){
        if(obj.OTP_varify__c){
            Contact objc =new contact();
           objc.AccountId=obj.Id;
            objc.FirstName='kk1';
            objc.LastName='ll1';
            addlist.add(objc);
            
            
        }
        else{
            if(obj.otpexpair__c && obj.Active__c=='Yes'){
                
                Opportunity objcc=new Opportunity();
                objcc.AccountId=obj.id;
                objcc.Name='kkkk111';
                objcc.StageName='Closed Won';
                objcc.CloseDate=system.today();
                addoplist.add(objcc);
                
            }
            
            
        }
        
        
        
    }
database.insert(addlist,false);
    database.insert(addoplist,false);
}