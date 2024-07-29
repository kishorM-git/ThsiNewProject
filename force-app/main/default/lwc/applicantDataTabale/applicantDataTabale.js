import { LightningElement } from 'lwc';
import sarchApplicantNameWise from '@salesforce/apex/applicantprovider.sarchApplicantNameWise';
 const applicantColumns = [
  { label: 'applicant ID', fieldName: 'Name', editable: true },
  { label: 'first Name', fieldName: 'first_name__c', editable: true },
  { label: 'Last Name', fieldName: 'last_name__c', editable: true }

];

export default class ApplicantDataTabale extends LightningElement {
    totalRecordSelect=0;
    
    selectedRecords;
     applicantObject={'sObjecttype':'applicant__c'};
     applist;
     columns  =applicantColumns;
     draftValues=[];
   
    serachRecordName(){
      
        console.log('Enter the inputsearch Method');
     this.applicantObject.first_name__c=this.template.querySelector('lightning-input[data-fromfield="applicantFirstname"]').value;
     sarchApplicantNameWise({objapp:this.applicantObject})
     .then(response=>{
       console.log('Result='+JSON.stringify(response));
       this.applist=response;
       
     })

      .catch(issue=>{
        console.log('Result='+JSON.stringify(issue));



      })
     
    }

    selectedRecordsHandler(event){
      const selectedRows  =   event.detail.selectedRows;
      console.log("Selected Rows = "+selectedRows)
      this.totalRecordSelect = event.detail.selectedRows.length;

      let recordsSets = new Set();

      // getting selected record id
      for (let i = 0; i < selectedRows.length; i++) {
          recordsSets.add(selectedRows[i].Id);
      }

      // coverting to array
      this.selectedRecords = Array.from(recordsSets);

       

    }
    deleteButtonHandler(){
     debugger;
    deleteSelectedApplicantRecords({appDlist : this.selectedRecords, objApp : this.applicantObject})
        .then(result=>{
            console.log("Result "+JSON.stringify(result));
            this.appList = result;

            
            
        })
        .catch(error=>{
            console.log("eRROR "+JSON.stringify(error));
           
        })
    }



}