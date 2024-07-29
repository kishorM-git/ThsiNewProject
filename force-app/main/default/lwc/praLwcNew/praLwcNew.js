import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import serverMethod from '@salesforce/apex/AccountProviderLwcpra.serverMethod';
//import serverMethod from '@salesforce/apex/AccountProviderLwcpraNew.serverMethod';
/*import{ShowToastEvent} from 'lightning/platformShowToastEvent';

const columns=[
{label:'id', fieldName:'Id'},
{label:'Name', fieldName:'Name'}


];*/
const columns=[
{label:'Id', fieldName:'Id'},
{label:'Name',fieldName:'Name'}


];
export default class PraLwcNew extends LightningElement {
    coulmns=columns;
toDate;
fromDate;
totalData;

saveHandler(){


this.toDate=this.template.querySelector('lightning-input[data-formfield="toDate"]').value;
this.fromDate=this.template.querySelector('lightning-input[data-formfield="FromField"]').value;
console.log('Enter the to date==' +this.toDate+ 'from date=='+this.fromDate);
serverMethod({"toDateField":this.toDate ,"fromDateField":this.fromDate})

.then(result=>{
this.totalData=result;
console.log('Date server=='+JSON.stringify(result));
this.showEvent();
})



    /*  this.toDate=this.template.querySelector('lightning-input[data-formfield="toDateName"]').value;
     this.fromDate=this.template.querySelector('lightning-input[data-formfield="formDateName"]').value;
console.log('Enter To Date =='+this.toDate + ',Enter From Date=='+this.fromDate);

serverMethod({"toDateField":this.toDate , " fromDateField":this.fromDate})
.then(result=>{
this.totalData=result;
console.log('enter the data sever='+JSON.stringify(result));
this.showToasrMehod();
})
.catch(error=>{

})

}
showToasrMehod(){
const evt=new ShowToastEvent({
title:'Massage',
message:'Record Found',
variant:'success',
mode: 'dismissable'

});
this.dispatchEvent(evt);*/



}

showEvent(){
const evt=new ShowToastEvent({
title:'Massage',
message:'Record Found...',
variant:'success',
mode:'dismissable'
})
this.dispatchEvent(evt);

}


}