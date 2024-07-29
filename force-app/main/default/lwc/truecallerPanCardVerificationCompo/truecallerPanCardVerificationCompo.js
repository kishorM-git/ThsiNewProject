import { LightningElement } from 'lwc';

export default class TruecallerPanCardVerificationCompo extends LightningElement {
    panCardNumber;


    verifyPanHandler(){
        this.panCardNumber = this.template.querySelector('lightning-input[data-formfield="panCardNumber"]').value;
        console.log('Enter to the verify button='+this.panCardNumber);
    }







}