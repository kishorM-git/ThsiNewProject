trigger triggerAccountandConNO on Account (after update) {
    
    
     for(Account objAcc : trigger.new){   
         
         
         if(objAcc.Type =='Technology Partner'){
      Contact objcon=new Contact();
         
         } 
    }

}