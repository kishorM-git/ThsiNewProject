import { LightningElement ,api } from 'lwc';

export default class LoadRecordPassport extends LightningElement {

    @api recordId;
    @api objectApiName;
    fields = ['	applicantId', 'status__c', 'Name', 'Phone', 'Email'];













}