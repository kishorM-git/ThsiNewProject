import { LightningElement ,track} from 'lwc';

export default class PhoneApiSourcecode extends LightningElement {
@track accountobject={'sObjectType':'Account'}
    handlertSaxve(){
this.accountobject.phone=this.template.querySelector('lightning-input[data-formfield="accName"]').value;

console.log('Enter the phone number=   '+this.accountobject.phone);


    }



}