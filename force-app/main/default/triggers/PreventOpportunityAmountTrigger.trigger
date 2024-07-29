trigger PreventOpportunityAmountTrigger on Opportunity (before insert,before update) {
    set<decimal>oppset=new set <decimal>();//5
    for(Opportunity objopp:trigger.new){
        oppset.add(objopp.Amount);//5
    }
    list <Opportunity> opplist = [select id,Amount from Opportunity where Amount IN:oppset ];//2 for existing record
   map<decimal,Opportunity> oppmap= new map<decimal,Opportunity>();
    for(Opportunity objopp:opplist){
        oppmap.put(objopp.Amount, objopp);
    }
    for(Opportunity objopp:trigger.new)
    if(oppmap.containsKey(objopp.Amount)){
        objopp.addError('duplicante Amount found');
    }
           
       
    
}