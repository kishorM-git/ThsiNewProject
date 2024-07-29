trigger AccountTriggerIUDEmail on Account (after insert,after update,after delete) {
  List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
   if(trigger.isInsert&& trigger.isAfter ){
      for(Account objacc2:trigger.new){
            Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
            mail.setToAddresses(new string[]{'kishornagapure16@gmail.com'});
            mail.setSenderDisplayName('Kishor Bhai');
            mail.setSubject('Welcome Insert');
            mail.setPlainTextBody('welcome Dude...!!!!!');
            mailList.add(mail);
        }
    }
        if(trigger.isUpdate &&trigger.isAfter){
            for(Account objacc1:trigger.new){
            if(objacc1.Rating !=trigger.oldmap.get(objacc1.id).Rating){
                if(objacc1.Rating=='Hot'&& trigger.oldmap.get(objacc1.id).rating=='Cold'){
                    Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new string[]{'kishornagapure16@gmail.com'});
                    mail.setSenderDisplayName('Kishor Bhai');
                    mail.setSubject('Welcome update');
                    mail.setPlainTextBody('welcome Dude...!!!!!');
                  mailList.add(mail);
                }
                }
            }   
            }   
         
        if(trigger.isDelete && trigger.isAfter){
            for(Account objacc2:trigger.old){
            Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
            mail.setToAddresses(new string[]{'kishornagapure16@gmail.com'});
            mail.setSenderDisplayName('Kishor Bhai');
            mail.setSubject('Welcome Deleted');
            mail.setPlainTextBody('welcome Dude...!!!!!');
            mailList.add(mail);
            }  
        }
    
    if(!mailList.isEmpty())
        Messaging.sendEmail(mailList,false);  
    
}