import { LightningElement } from 'lwc';
import cretateAccountRecord from '@salesforce/apex/AccountFromProvider.cretateAccountRecord';
export default class KishorAccount extends LightningElement {

objaa={'sObjectType':'Account'}

handlerSow(){
    
this.objaa.Name=this.template.querySelector('lightning-input[data-fromfiled="accountName"]').value;
this.objaa.Type=this.template.querySelector('lightning-input[data-fromfiled="accountType"]').value;
console.log('Enter the value='+this.objaa);

 cretateAccountRecord({Accountd:this.objaa})
.then(result=>{


console.log('enter the sucesssresod ='+JSON.stringify(result));
this.objaa=result;
})

.catch(error=>{

    console.log('enter the Errorresult ='+JSON.stringify(error));

})


    }
aaname(){



    
}
    
}