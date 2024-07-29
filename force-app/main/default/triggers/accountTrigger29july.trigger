trigger accountTrigger29july on Account (before insert) {
    set<string>accset=new set<string>();
    for(Account objacc:trigger.new){
                if(!String.isBlank(objAcc.Name))
       accset.add(objacc.Name); 
    }
        
     list < Account > acclist =[select id,Name from Account where Name IN:accset ];
    if(!acclist.isEmpty())
        
    delete acclist;

}