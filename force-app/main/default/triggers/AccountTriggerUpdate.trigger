trigger AccountTriggerUpdate on Account (after update) {
       List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    for(Account objacc:trigger.new){
        if(objacc.Rating!=trigger.oldmap.get(objacc.id).Rating){
            if(objacc.Rating=='hot'&& trigger.oldmap.get(objacc.id).Rating=='cold'){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[] {'kishornagapure16@gmail.com'});
                    mail.setSenderDisplayName('kishor bhai');
                    mail.setSubject('Account Rating is updated');
                    mail.setPlainTextBody('Account Rating is Updated to Hot. \n Team Airtel');
                    mailList.add(mail);            

                
            }
            
        }
    }
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);  
        }
}