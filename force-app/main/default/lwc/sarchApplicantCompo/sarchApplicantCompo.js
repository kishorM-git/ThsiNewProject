import { LightningElement } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';
import SearchApplicantProvider from '@salesforce/apex/SearchApplicantProvider.SearchApplicantProvider';

export default class SarchApplicantCompo extends LightningElement {
     
    applicantObjec={'sObjectType':'applicant__c'};
    showSpinnerFlag=false;

    sarchSubmitButton(){
        debugger;
        console.log('Enter js method');
        this.showSpinnerFlag=true;
      this.applicantObjec.Name= this.template.querySelector('lightning-input[data-formfield="applicantName"]').value;//APID-0062
      SearchApplicantProvider({"objapp":this.applicantObjec})
      .then(result=>{
        console.log("Result ="+JSON.stringify(result));
        this.showSpinnerFlag=false;
        this.applicantObjec=result;
        this.showToast();
       })
       .catch(error=>{
        this.showSpinnerFlag=false;
        
           console.log("Error ="+JSON.stringify(error));
        });


    }
    showToast() {
        const event = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found',
            variant: 'Success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }
}