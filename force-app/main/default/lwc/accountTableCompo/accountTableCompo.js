import { LightningElement } from 'lwc';
import accountDetail from '@salesforce/apex/AccountTable.accountDetail'
export default class AccountTableCompo extends LightningElement {
   accountObject={"sObjectType":"Account"};
   acclist;
     totalRecord=0;
     showTableFlag=false;
     get slaOptions() {
        return [
            { label: 'Gold', value: 'Gold' },
            { label: 'Silver', value: 'Silver' },
            { label: 'Platinum', value: 'Platinum' },
        ];
    }

    handleSlaChange(event) {
        this.accountObject.SLA__c = event.detail.value;
    }

   get typeOptions() {
    return [
        { label: 'Prospect', value: 'Prospect' },
        { label: 'Customer - Direct', value:'Customer - Direct' },
        { label: 'Customer - Channel', value: 'Customer - Channel' },
        { label: 'Technology Partner', value: 'Technology Partner'},
        { label: 'Other', value: 'Other' },
    ];
}

handleTypeChange(event) {
debugger;
    this.accountObject.Type = event.detail.value;
    console.log('Enter Event='+this.accountObject.Type)
    accountDetail({objacc:this.accountObject})
    .then(result=>{
      console.log('Result='+JSON.stringify(result));
      this.acclist=result;
      this.totalRecord=result.length;
      if(result.length>0){
      this.showTableFlag=true;
      }
      else{
        this.showTableFlag=false;
      }
    })
    .catch(error=>{
        console.log('Result='+JSON.stringify(error));
        this.showTableFlag=false;
    })
}
}