trigger leadcrelatelead on Lead (after insert) {
    
    list<Lead>addlist=new list<Lead>();
    for(Lead objl:trigger.new){
        
     Lead obj=new lead();
        obj.LastName=objl.LastName;
        obj.Company=objl.Company;
        obj.Status=objl.Status;
        addlist.add(obj);
    }
database.insert(addlist,false);
}