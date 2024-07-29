import { LightningElement } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import createNewAccountde from '@salesforce/apex/AccountFromProvider.createNewAccountde'
const columns=[
{label:'Id',fieldName:'Id'},
{label:'Name' ,fieldName:'Name'},
{label:'Owner Name',fieldName:'Owner.Name'}




];

export default class PracticeLwcOnly extends LightningElement {
accNamea;
boleanFlag=false;
columns=columns;
    accountName={'sObjectType':'Account'}
    saveHandler(){

this.accountName.Name=this.template.querySelector('lightning-input[data-formfield="accName"]').value;

this.boleanFlag=true;
console.log('Enter the Method='+this.accountName.Name);
createNewAccountde({accountObj:this.accountName})
.then(result=>{
this.accNamea=result;
this.booleanFlag=false;
this.showEvenr()
this.boleanFlag=false;
console.log('Enter the Then Data='+JSON.stringify(result));


})
.catch(error=>{
    console.log('Enter the Then Data='+JSON.stringify(error));

});


    }



    showEvenr(){
        const evt= new ShowToastEvent({
        
            title: 'Message',
            message: 'Record Found...!!!',
            variant: 'success',
            mode: 'dismissable'

        
        });
        this.dispatchEvent(evt);
        
        
        }
        
        









}