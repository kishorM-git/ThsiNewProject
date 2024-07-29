import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LdsCreateRecord extends LightningElement {

    contactObject = CONTACT_OBJECT;
    myFields = [FIRST_NAME_FIELD, LAST_NAME_FIELD,ACCOUNT_FIELD];

    handleContactCreated(){
this. showSuccessToast();

    }
    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Toast Success',
            message: 'Record create successful',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);

}
}