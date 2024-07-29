trigger triggerContacDuplcate on Contact (before insert) {
    set<String>addset=new set<string>();
    for(Contact objcon:trigger.new){
        if(string.isNotBlank(objcon.Email)){
        addset.add(objcon.Email);  
        }
    }
    map<string,Contact>putmap=new map<string,Contact>();
    for(Contact objcc:[select id,LastName,  Email from Contact where    Email  =:addset]) {
        
        putmap.put(objcc.Email,objcc);
    }
    for(Contact objccc:trigger.new){
        if(putmap.containsKey(objccc.Email)){
            objccc.addError('Duplicate NAME HAI RE BAVA EMAILL');
            
            
        }        
        
    }
}