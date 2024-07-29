import { LightningElement } from 'lwc';
import serchAddresMethod from '@salesforce/apex/AddressProvider.serchAddresMethod'
export default class ApplicantParentCompo extends LightningElement {
    
    appid;
    adrlist;
    sarchRelatedAddresses(){
       
     this.appid=this.template.querySelector('lightning-input[data-formfiled="appID"]').value;
        console.log('Enter the Button Method')
        serchAddresMethod({applicantId:this.appid})
        .then(result=>{
          console.log('Result ='+JSON.stringify(result));
             this.adrlist=result;
        })
        .catch(error=>{

            console.log('Error ='+JSON.stringify(error));

        })

    }






}