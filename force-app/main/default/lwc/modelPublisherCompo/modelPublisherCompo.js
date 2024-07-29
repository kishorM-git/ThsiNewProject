import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class ModelPublisherCompo extends LightningElement {
    accountName;



    sendDataHandler(){
    this.accountName=this.template.querySelector('lightning-input[data-formfield="accountName"]').value;
     console.log('Enter the Button')
     pubsub.publish('eventName' , this.accountName)
    }




}