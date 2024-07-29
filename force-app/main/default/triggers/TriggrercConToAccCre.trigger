trigger TriggrercConToAccCre on Contact (after insert) {
map<id,Account>putmap=new map<id,Account>();
  // List<Account> accList = new List<Account>();
   // set<Id> conId = new set<Id>();
    for(Contact objCon : trigger.new){         
        //conId.add(objCon.Id);       
        Account objAcc = new Account();
        objAcc.Name = objCon.FirstName +' ' +objCon.LastName;
        objAcc.Phone = objCon.Phone;
        putmap.put(objCon.id,objAcc);   
    }
    database.Insert(putmap.values(),false);
  //  Id accId = [select Id from Account where Id IN :accList].Id;
    List<Contact> conList = [select Id,Name from Contact where Id IN :putmap.keyset()];
    system.debug('#####='+conList);
    //system.debug('#######'+accId);
    for(Contact objCon : conList){
        objCon.AccountId = putmap.get(objCon.id).id;
    }
   database.update(conList,false);
}