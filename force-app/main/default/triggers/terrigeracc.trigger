trigger terrigeracc on Account (before insert,before update) {
  for(Account objAcc : trigger.new){
      
    
    
        objAcc.ShippingCity=  objAcc.BillingCity;
      objAcc.ShippingState=objAcc.BillingState;
     objAcc.ShippingPostalCode= objAcc.BillingPostalCode; 
      objAcc.ShippingCountry= objAcc.BillingCountry;
     
      
      }
        }