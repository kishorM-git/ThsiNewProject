import { LightningElement,wire} from 'lwc';
import getConactList from '@salesforce/apex/PaginationClasss.getConactList'
const columns = [
    { label: 'Name', fieldName: 'Name', editable:true },
   { label: 'id', fieldName: 'ID',editable:true },
];
export default class PeginationParent extends LightningElement {
    columns=columns;
totalrecord
visiableerecord
@wire(getConactList)
wireConatac({data,error}){
if(data){

this.totalrecord=data;
console.log('get  record='+JSON.stringify(this.totalrecord));
}
if(error){



}

}
upateRecord(event){
this.visiableerecord=event.detail.records;
console.log('parent js='+this.visiableerecord);



}




}