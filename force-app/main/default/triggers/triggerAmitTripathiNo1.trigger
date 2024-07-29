trigger triggerAmitTripathiNo1 on Opportunity (before insert,before update) {
set<id>addset=new set<id>();
    for(Opportunity objcon:trigger.new){
        if(objcon.OwnerId!=null){
            addset.add(objcon.OwnerId);
            
            
        }
map<id,user>putmap=new map<id,user>();        
        if(!addset.isEmpty()){
            for(user objacc:[select id  from user where id IN:addset]) {
                putmap.put(objacc.id,objacc);
                
                
                
            }
            
            
            
        }
        if(!putmap.isEmpty()){
            for(Opportunity obj:trigger.new){
                if(putmap.containskey(obj.OwnerId)){
                    obj.user_maneger__c=putmap.get(obj.OwnerId).id;
                    
                } 
                
                
                
            }  
            
            
        }
        
    }




}