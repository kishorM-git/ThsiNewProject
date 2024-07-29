trigger TriggerLeadOnlyProfile on Lead (before delete) {
     Id profileid=Userinfo.getProfileId();  
  Profile profilname=[select Name from Profile where id=:profileid];
    for(Lead objlead:trigger.old){
        if(profilname.Name=='System Administrator'){
            objlead.addError('Not Delete lead bcz profile is system administrator ');
            
            
        }
        
        
    }
}