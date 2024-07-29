trigger AccountTrigrerDuplicat on Account (before insert,before update) {
    set<string>acset=new set<string>();
    for(Account accountobj:trigger.new){
        if(string.isNotBlank(accountobj.Name)){
          acset.add(accountobj.Name);
            
            
        }
        
    }
map<string,Account>accmap=new  map<string,Account>();
    for( Account objac:[select id,Name from Account where Name IN: acset ]){
        accmap.put(objac.Name,objac);
    }
    for(Account accountobj:trigger.new){
        if( accmap.containsKey(accountobj.Name) ){
            accountobj.addError('duplicate name');
            
        }
    }   
    }