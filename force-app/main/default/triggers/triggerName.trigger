trigger triggerName on Contact (after insert,after update) {
    
    set<id>addset=new set<id>();
for(Contact objon:trigger.new){

addset.add(objon.AccountID);


}

map<id,Account>putmap=new map<id,Account>();
if(!addset.isempty()){

for(Account objacc:[select id,Name,(select Name,Phone from contacts),Phone from Account where id IN:addset]){

putmap.put(objacc.ID,objacc);


}



}
for(Contact objcon:trigger.new){

if(putmap.containskey(objcon.AccountID)){
    if(putmap.get(objcon.AccountId).Phone==null){

putmap.get(objcon.AccountID).phone=objcon.Phone;
  
    }
    putmap.get(objcon.AccountID).phone=  putmap.get(objcon.AccountID).phone;
        }
   
}





Database.update(putmap.values(),false);

}