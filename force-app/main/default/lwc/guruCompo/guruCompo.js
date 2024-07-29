import { LightningElement,wire} from 'lwc';
import MYCHANNEL from "@salesforce/messageChannel/AccountDataChannel__c";
import {publish, MessageContext} from "lightning/messageService"


export default class GuruCompo extends LightningElement {
    myAccountName;
    @wire(MessageContext)
    context


    sendDataHandler(){
   this.myAccountName  =this.template.querySelector('lightning-input[data-formfield="accName"]').value;
   const message={
    accountName:{
        value:this.myAccountName
    }
 }

 publish(this.context, MYCHANNEL, message);

console.log('data='+message);
   
    }



}