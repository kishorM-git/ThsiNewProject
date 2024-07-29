import {  LightningElement, track } from 'lwc';

export default class TrackDecoratorAcount extends LightningElement {


  @track objAccount={'sObjectType':'Account'}
    accountNameHandler(){

       this.objAccount.Name=this.template.querySelector('lightning-input[ data-formfield="accName"]').value;
      console.log('Enter the method='+this.objAccount.Name);


        
    }


}