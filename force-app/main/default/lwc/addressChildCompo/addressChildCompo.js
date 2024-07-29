import {  LightningElement,api } from 'lwc';
const addColumns = [
  { label: 'Address id', fieldName: 'Name', editable: true },
    { label: 'City Name', fieldName: 'city__c', editable: true },
    { label: 'State', fieldName: 'state__c', editable: true },
   
    { label: 'Contry Name', fieldName: 'country__c', editable: true }
   
   
  
  ];
  
 

export default class AddressChildCompo extends LightningElement {
   
 @api addressList;
 selectedRecordsCount=0;
 columns=addColumns;
 
  selectedRecordsHandler(event){
    const selectedRows  =   event.detail.selectedRows;
    console.log("Selected Rows = "+selectedRows)
    this.selectedRecordsCount = event.detail.selectedRows.length;

    let recordsSets = new Set();

    // getting selected record id
    for (let i = 0; i < selectedRows.length; i++) {
        recordsSets.add(selectedRows[i].Id);
    }

    // coverting to array
    this.selectedRecords = Array.from(recordsSets);
  }



 }