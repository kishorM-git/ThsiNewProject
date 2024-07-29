import { LightningElement } from 'lwc';
import PASSPORT_OBJECT from '@salesforce/schema/passport__c';
import PASSPORT_NUMBER_FIELD from '@salesforce/schema/passport__c.passport_number__c';
import STATUS_FIELD from '@salesforce/schema/passport__c.status__c';
import APPLICANT_FIELD from '@salesforce/schema/passport__c.applicant__c'; 


export default class LdsPassportError extends LightningElement {

    passportObject = PASSPORT_OBJECT;
    passNumber = PASSPORT_NUMBER_FIELD;
    passStatus = STATUS_FIELD;
    applicant = APPLICANT_FIELD;

    objPassport={'sObjectType' : 'Passport__c'};

    handlerPassNumberChange(event){
        this.objPassport.Applicant__c =  event.target.value;
        console.log(event.target.value);
 

    }
    handlerPassStatusChange(event){
        this.objPassport.Status__c =    event.target.value;


    }

    handlerApplicantChange(event){

        this.objPassport.Passport_Number__c =    event.target.value;
        console.log(event.target.value);
 
    }

    handlePassportRecord(){
       
    }




}