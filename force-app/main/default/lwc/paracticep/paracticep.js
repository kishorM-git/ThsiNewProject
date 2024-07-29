import { LightningElement } from 'lwc';
import createNewAccountPractice from '@salesforce/apex/AccountFromProvider.createNewAccountPractice'

export default class ParacticeAccountCreate extends LightningElement {
aa={'sObject':'Account'};

handaleSubmitButton(){
debugger;
this.aa.Name=this.template.querySelector('lightning-input[data-formfield="accountName"]').value;
console.log('Inside of JS Method '+ this.aa.Name);
       createNewAccountPractice({accountinsert:this.aa.Name})
    .then(result=>{
console.log('sucuseeful='+result);
this.showToastEvent();

    })
    .catch(error=>{

console.log('error');


    })
    }



}