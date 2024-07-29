trigger AccountSenario3setTrriger on Account (before insert,before Update) {
    map<string,Account>accmap=new map<string,Account>();
    for(Account objacc:trigger.new){
        if(string.isNotBlank(objacc.Name)){
            accmap.put(objacc.Name,objacc);
        }
    }
    list<Account>acclist=new list<Account>();
    for(Account objacc:[select id,Name from Account where Name IN:accmap.keyset()]){
        acclist.add(objacc);
    }
delete acclist;
}