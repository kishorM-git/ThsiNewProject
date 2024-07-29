import { LightningElement } from 'lwc';
import createNewAccount from '@salesforce/apex/AccountFromProvider.createNewAccount';

export default class AccountFrom extends LightningElement {
    accountObj={'sObjectName':'Account'}
    handaleSubmitButton(){
        debugger;
        this.accountObj.Name=this.template.querySelector('lightning-input[data-formfield="accountName"]').value;
        this.accountObj.Type=this.template.querySelector('lightning-input[data-formfield="accountType"]').value;
       createNewAccount({objacc:this.accountObj})
       .then(result=>{
           console.log('Result='+result);
        })
        .catch(error=>{
            console.log('Error='+error);

        })

    }
}