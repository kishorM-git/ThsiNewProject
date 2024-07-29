trigger AccountTrriderNew1 on Account (before insert,before update) {
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.Type)){
            if(objacc.Type=='Prospect')        {
                objacc.Rating='Hot';
               } 
               else{
                  objacc.Rating='';
                   
               }
    }
    }
}