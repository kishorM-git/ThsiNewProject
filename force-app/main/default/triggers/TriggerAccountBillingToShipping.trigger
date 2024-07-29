trigger TriggerAccountBillingToShipping on Account (before insert) {
   
    for(Account acc:trigger.new){   
       if (acc.BillingStreet != null && acc.BillingCity != null &&
            acc.BillingState != null && acc.BillingPostalCode != null &&
            acc.BillingCountry != null) { 
                
                 acc.ShippingStreet = acc.BillingStreet;
            acc.ShippingCity = acc.BillingCity;
            acc.ShippingState = acc.BillingState;
            acc.ShippingPostalCode = acc.BillingPostalCode;
            acc.ShippingCountry = acc.BillingCountry;
                
                
                
            }
    }
}