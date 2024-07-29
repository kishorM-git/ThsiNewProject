import { LightningElement ,wire} from 'lwc';
import myClass  from '@salesforce/apex/ApexClassProvider.myClass';
const column=[
{label:'Id' ,fieldName:'Id',editable:true},
{label:'Name',fieldName:'Name'},
{label:'CreatedDate', fieldName:'CreatedDate'},
{ label: 'Owner', fieldName: 'Owner.Name'},
{ label: 'ActiveField', fieldName: 'accountcheckbox__c' , cellAttributes: { class: { fieldName: 'activeClass' } },editable:true}



];
export default class CustomeLighrtningDataTable extends LightningElement {
    columns=column;
datas=[];
error;

@wire(myClass)
datasave ({data,error}){
if(data){
   
this.datas= data.map(item => ({
    ...item,
    activeClass: item.active ? 'slds-text-color_success' : 'slds-text-color_error'
}));
} else if (error) {
    
console.error('Error fetching data:', error);
}


}





}