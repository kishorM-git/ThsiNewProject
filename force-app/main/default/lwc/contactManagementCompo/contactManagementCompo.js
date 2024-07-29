import { LightningElement ,wire,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import serverMethod from '@salesforce/apex/ContacProvider.serverMethod';
import getAccountRecords11 from '@salesforce/apex/ContacProvider.getAccountRecords11';
const columns=[
    {label: 'First Name',fieldName: 'FirstName'},
    {label: 'Last Name',fieldName: 'LastName'},
    {label: 'Email',fieldName: 'Email',type: 'email'},
    {label: 'Phone',fieldName: 'phone',type: 'phone'}



]

export default class ContactManagementCompo extends LightningElement {
   
    @track contacts;
    @track accountId = '';
    @track columns = columns;
   
    @wire(getAccountRecords11) accounts;
    onValueSelection(event){
        const selectedAccount = event.target.value;//kk
        this.accountId = event.target.value;
console.log('Enter under the method='+this.accountId);
if (selectedAccount != null) {
serverMethod({accountI:selectedAccount})
.then(result=>{
    this.contacts=result;
    
console.log('Server side data ='+JSON.stringify(result))
this.showSuccessToast();

})
.catch(error=>{

    this.error = error;

});
        
    }
}


    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }


}