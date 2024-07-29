import { LightningElement } from 'lwc';
import serverMethod from '@salesforce/apex/AccountProviderLwcpra.serverMethod';
const columns=[
    { label: 'id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' }
];

export default class PraLwc extends LightningElement {
   toDate;
   fromDate;
   record;
   
   columnsList=columns;
   
   saveHandler(){
       this.fromDate=this.template.querySelector('lightning-input[data-formfield="fromDate"]').value;
       this.toDate=this.template.querySelector('lightning-input[data-formfield="toDate"]').value;
 console.log('From Date='+this.fromDate+', to Date='+ this.toDate); 


 serverMethod({"toDateField":this.toDate,"fromDateField":this.fromDate})

 .then(result=>{
this.record=result;
   console.log('Eter thew data='+JSON.stringify(result))

})
.catch(error=>{



})
   
  }
}