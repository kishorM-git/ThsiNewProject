public with sharing class VFCountryCode_CX {
    public String selectedCountry {get; set;}
        public String countryCode {get; set;}

    public VFCountryCode_CX(ApexPages.StandardController controller) {

    }

    public List<SelectOption> getCountriesOptions() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        
        Map<String, custom_setting_list__c> countryCodeMap = custom_setting_list__c.getAll();
        
        countryOptions.add(new SelectOption('','--None--'));
        
       for(String countryName: countryCodeMap.keySet()){
          String cLabel =countryName;
          String value= countryCodeMap.get(countryName).country_code__c;
           
            countryOptions.add(new SelectOption(value,cLabel )); //1.Value, 2.Lable
        }

        
       
        
 
        return countryOptions;
    }
    

}