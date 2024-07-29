trigger OpportunitiesTriggernew1 on Opportunity (after delete) {
    list<Opportunities_Backup__c>opplist=new list<Opportunities_Backup__c>();
    for(Opportunity objopp:trigger.old){
        if(objopp.Amount>=18000 && objopp.CloseDate.month()==8 && objopp.StageName=='Prospecting'||(objopp.StageName=='Closed Lost  ')){
       objopp.StageName.addError('this record can not be deleted, stagename is prospecting');
        }  
        else{
            Opportunities_Backup__c objbk=new Opportunities_Backup__c();
            objbk.Amount__c=objopp.Amount;
            objbk.Opportunity_Name__c= objopp.Name;
            opplist.add(objbk);
        }
            
        }      
    if(!opplist.isEmpty())  { 
       database.insert(opplist,false);
    }

}