import { LightningElement, wire } from 'lwc';
import leadData from '@salesforce/apex/LwcLeadClass.leadData';
import taskcallLoad from '@salesforce/apex/LwcLeadClass.taskcallLoad';
const columns=[
{label:'id',fieldName:'Id', type:'Id'},
{label:'Name',fieldName:'Name' , type:'text'}



];

export default class LwcLead extends LightningElement {
columns=columns;
shoepopo=false;
taskdata;
draftvalues=[];
leadData={'sObjectType':'Lead'};
iddta;
leadDatas;
@wire(leadData)
leadstoredata({data,error}){
if(data){

    console.log('Wire data'+data);
this.leadDatas=data;

}

else if(error){



}


};

dataShow(event){
this.shoepopo=event.detail;
console.log('Enter the data child='+this.datapop);

};

saveHandler(){
    this.leadData.FirstName=this.template.querySelector('lightning-input[data-formfield="firstName"]').value;
this.leadData.LastName=this.template.querySelector('lightning-input[data-formfield="lastName"]').value;
console.log('Enter the data======'+this.leadData.FirstName+"last name=="+this.leadData.LastName);

}
handleRowAction(event){
    this.shoepopo=true;
console.log('Row select=='+JSON.stringify(event.detail.selectedRows));
this.iddata=event.detail.selectedRows;

console.log('iddata=='+this.iddata);
taskcallLoad({leadrecord:this.iddata})
.then(resut=>{

    console.log('Task data=='+JSON.stringify(result));
this.taskdata=result;

})
.catch(error=>{



});

}



}