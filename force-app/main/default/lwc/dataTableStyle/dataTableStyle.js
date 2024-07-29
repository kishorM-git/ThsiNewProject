import { LightningElement ,wire} from 'lwc';
import dataMethod from '@salesforce/apex/DataTableStyleClass.dataMethod';
import {loadStyle} from 'lightning/platformResourceLoader';
import COLORS from '@salesforce/resourceUrl/colors';
const COLUMNS=[
{label:'Account Name', fieldName:'Name' ,cellAttributes:{
    class:{fieldName:'accountColor'}
   
}},
{label:'Annual Revenue', fieldName:'AnnualRevenue' ,type:'currency',cellAttributes:{class:{fieldName:'amountColor'}},editable:true},
{label:'Industry' ,fieldName:'Industry', type:'text' ,cellAttributes:{class:{fieldName:'industryColor'}}},
{label:'Phone' ,fieldName:'Phone',type:'Phone'} 


];
export default class DataTableStyle extends LightningElement {
columns=COLUMNS;
isCssLoaded = false;

tableData;
@wire(dataMethod)
dataHandler({data,error}){

if(data){

console.log('Enter the data server==='+JSON.stringify(data)); "slds-text-color_success"
this.tableData=data.map(item=>{
    let amountColor= item.AnnualRevenue < 2000 ? "slds-text-color_success" :"slds-text-color_error"
 return{...item,"amountColor":amountColor,
 industryColor:"slds-icon-custom-custom12 slds-text-color_default",
accountColor:"datatable-orange"
}
})
}
if(error){
console.error('Enter the error from server'+JSON.stringify(error));

}
}
renderedCallback(){ 
    if(this.isCssLoaded) return
    this.isCssLoaded = true
    loadStyle(this, COLORS).then(()=>{
        console.log("Loaded Successfully")
    }).catch(error=>{ 
        console.error("Error in loading the colors")
    })
}
    
}