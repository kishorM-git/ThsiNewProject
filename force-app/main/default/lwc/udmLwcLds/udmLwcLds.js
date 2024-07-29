import { LightningElement ,api} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type'
import ACCOUNT_ANNUAL_REVENUE from '@salesforce/schema/Account.AnnualRevenue'
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry'

export default class UdmLwcLds extends LightningElement {
@api recordId;//use in static
@api objectApiName;//use in static
object=ACCOUNT_OBJECT; // export account object use Dymanic
fields=[ACCOUNT_NAME,ACCOUNT_TYPE, ACCOUNT_ANNUAL_REVENUE,ACCOUNT_INDUSTRY];// they are fields store in Arry  fromate 

successHandler(event){
console.log(event.detail.id);//us record ki id
const toastEvent = new ShowToastEvent({ 
    title:"Account created",
    message:"Record ID: "+event.detail.id,
    variant:"success"
})
this.dispatchEvent(toastEvent)


}




}