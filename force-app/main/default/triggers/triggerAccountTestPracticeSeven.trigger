trigger triggerAccountTestPracticeSeven on Account (before insert,before update) {
    for(Account objacc:trigger.new){
if( string.isBlank(objacc.Industry)){
 objacc.addError('Industry field is Not blank')  ; 

}
        else{
           
            
            if(objacc.Industry=='Media'){
                
                objacc.Rating='Hot';
                
                
            }
            else{
              objacc.Rating='';   
                
                
            }
            
            
            
            
        }
        
    }
}