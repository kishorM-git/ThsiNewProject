import { LightningElement } from 'lwc';
import createNewAccount from '@salesforce/apex/AccountFromProvider.createNewAccount';
import searchAcountRecord from '@salesforce/apex/AccountFromProvider.searchAcountRecord';

export default class CurdCompo extends LightningElement {
    showInputFieldsFlag=true;
    showserchNowButtonFlag=false;
    showUpadateFieldsFlag=false
    accountObject={"sObjectType":"Account"};
    get typeoptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'In Customer - Direct	', value: 'Customer - Direct'},
            { label: 'Technology Partner', value: 'Technology Partner' },
            { label: ' Other', value: 'Other'},
        ];
    }

    handleTypeChange(event) {
        this.accountObject.Type= event.detail.value;
        console.log('enter the select ='+this.accountObject.Type);
    }
    get SLAoptions() {
        return [
            { label: 'Gold', value: 'Gold' },
            { label: 'Silver', value: 'Silver'},
            { label: 'Platinum', value: 'Platinum' },
            { label: ' Bronze', value: 'Bronze'},
        ];
    }

    handleSLAChange(event) {
        this.accountObject.SLA__c = event.detail.value;
        console.log('enter the select ='+this.accountObject.SLA__c);
    }
 
    cretaeButtonHandler(){
     console.log('Enter the create');
     this.showInputFieldsFlag=true;
     this.showserchNowButtonFlag=false;
    }
    
    serachButtonHandler(){
        debugger;
        console.log('Enter the serach');
     this.showInputFieldsFlag=false;
     this.showserchNowButtonFlag=true;
     this.showUpadateFieldsFlag=false;
    }
    
    updateButtonHandler(){
        debugger;
        console.log('Enter the update');
        this.showInputFieldsFlag=false;
        this.showserchNowButtonFlag=false;
       this.showUpadateFieldsFlag=true;
       this.accountObject.Name =this.template.querySelector('lightning-input[data-fromfiled="accountName"]').value;
       updateAccountRecord({objacc:this.accountObject})
       .then(result=>{
      console.log(Result=result);

       })
       .catch(error=>{

        console.log(Result=error);
       })
          

       }
    
    
    deleteButtonHandler(){
        console.log('Enter the delete');
  



    }

    cretaeSaveButtonHandler(){
       debugger;
      this.accountObject.Name =this.template.querySelector('lightning-input[data-fromfiled="accountName"]').value;
      createNewAccount({objacc:this.accountObject})
      .then(result=>{    
         console.log('Result ='+result);

      })
      .catch(error=>{
        console.log('Result ='+error);


      })
        
    }

    serachNowButtonHandler(){
        this.accountObject.Name =this.template.querySelector('lightning-input[data-fromfiled="accountName"]').value;
        searchAcountRecord({objacc:this.accountObject})
        .then(result=>{    
           console.log('Result ='+JSON.stringify(result));
             this.accountObject=result;
        })
        .catch(error=>{
          console.log('Result ='+JSON.stringify(error));
  
  
        })

    }

    updateNowDownButtonHandler(){
        upadateDownButtonCl({objacc:this.accountObject})



    }



}