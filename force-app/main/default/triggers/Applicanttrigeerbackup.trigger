trigger Applicanttrigeerbackup on applicant__c (before delete) {
    list<Applicant_Backup__c>ablist=new list<Applicant_Backup__c>();
    for(applicant__c objapp:trigger.old){
        if(objapp.police_varification__c==true && (objapp.date_barth__c.month()==7||objapp.date_barth__c.month()==11)&&(objapp.gender__c=='male'||objapp.gender__c=='female')){
            Applicant_Backup__c objab=new Applicant_Backup__c();
            objab.first_name__c=objapp.first_name__c;
            objab.last_name__c= objapp.last_name__c;
            ablist.add(objab);
        } 
        else{
            objapp.police_varification__c.addError('police verification not valid');
        }
    }
        database.insert(ablist,false);
    }