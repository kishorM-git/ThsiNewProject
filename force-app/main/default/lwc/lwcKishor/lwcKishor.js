import { LightningElement } from 'lwc';
import methodName from '@salesforce/apex/AccountClassLwc.methodName';

export default class LwcKishor extends LightningElement {
accNameAccount={"sObjectType":"Account"}

saveHandler(){


this.accNameAccount.Name=this.template.querySelector('lightning-input[data-formfiled="accName"]').value;
console.log('enter the save method='+this.accNameAccount.Name);
methodName({accname:this.accNameAccount})
.then(resulr=>{

this.accNameAccount=resulr;

})
.catch(error=>{




})
    }






}