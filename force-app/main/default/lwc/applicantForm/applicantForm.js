import { LightningElement } from 'lwc';

export default class ApplicantForm extends LightningElement {
    name;
    firstName;
    lastName;
    emaiID;
    contactNO;

    handleButton(){

        console.log('YES');
        this.name=this.template.querySelector('lightning-input[data-formfield="name"]').value;
        this.firstName=this.template.querySelector('lightning-input[data-formfield="firstName"]').value;
        this.emaiID=this.template.querySelector('lightning-input[data-formfield="emaiID"]').value;
        this.lastName=this.template.querySelector('lightning-input[data-formfield="lastName"]').value;
        this.contactNO=this.template.querySelector('lightning-input[data-formfield="contactNO"]').value;
        

    }
           
}