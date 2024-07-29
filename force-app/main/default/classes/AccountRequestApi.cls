public class AccountRequestApi {
    
    public static void getPletraAccount(){
        Http http=new Http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint('callout:pletraTechNameCread/services/apexrest/abcGet');
        req.setMethod('GET');
        
        
        HttpResponse response=http.send(req);
        system.debug('Respose satatus code   ###  '+response.getStatusCode());
        if(response.getStatusCode()==200){
            system.debug('Received Data ==='+response.getBody());
            
            
            list<Object>objlist=(list<Object>) JSON.deserializeUntyped(response.getBody());
            list<Account>acclistInsert=new list<Account>();
            for(object obja:objlist){
                map<string,Object>accMap=(map<string,Object>)obja;
                system.debug('Id   ++'+accMap.get('Id'));
                system.debug('Name   ++'+accMap.get('Name'));
                system.debug('Type   ++'+accMap.get('Type'));
                Account obj =new Account();
                obj.Name=string.valueOf(accMap.get('Name'));
                obj.Type=string.valueOf(accMap.get('Type'));
                
                acclistInsert.add(obj);
                
                
            }
            
            if(!acclistInsert.isEmpty()){
                
                database.insert(acclistInsert,false);
            }
            
            
        }
        
        
        
    }    
    
    public static void postInsert(){
        
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('callout:pletraTechNameCread/services/apexrest/abcGet');
        req.setMethod('POST');
        //Set Parameters
        req.setHeader('Content-Type','application/json;charset=UTF-8');
        req.setBody('{"Name":"Pan India","Type":"Prospect","Rating":"Cold"}');
        
        HttpResponse response=Http.send(req);
        system.debug('Status Code ##'+response.getStatusCode());
        system.debug('Status Code ##'+response.getBody());
        
        if(response.getStatusCode()==200){
            Map<string,Object>accmap=(Map<string,Object>)JSON.deserializeUntyped(response.getBody());//songle object record
            
            
            
        }
        
    }
    
    public static void updatedta(){
         Http http=new Http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint('callout:pletraTechNameCread/services/apexrest/abcGet');
        req.setMethod('PUT');
        
        req.setHeader('Content-Type','application/json;charset=UTF-8');
        req.setBody('{"Name":"Pan India","Type":"Prospect","Rating":"Cold"}');
        
        
        
        HttpResponse response=Http.send(req);
        system.debug('Status Code ##'+response.getStatusCode());
        system.debug('Status Code ##'+response.getBody());
        
        if(response.getStatusCode()==200){
            map<string,Object>accmap=(map<string,Object>)JSON.deserializeUntyped(response.getBody());
            system.debug('Reccive Respose==  '+accmap);
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}