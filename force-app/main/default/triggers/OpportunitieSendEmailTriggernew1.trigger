trigger OpportunitieSendEmailTriggernew1 on Opportunity (after delete) {
     List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    for(Opportunity obkopp:trigger.old){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'kishornagapure08@gmail.com'});
        mail.setSenderDisplayName('Adrian Lamo#$%#$^$%&');
        mail.setSubject('hacked');
        mail.setPlainTextBody(obkopp.Name+' your email Hacked.. \n ching chong');
        mailList.add(mail);
        
    }
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);  
        }
}