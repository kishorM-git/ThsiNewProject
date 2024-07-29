import { LightningElement } from 'lwc';

export default class EnableDisableButton extends LightningElement {
  
disableSearchButtonFlag=false;
disableEditButtonFlag=true;
    handleSearchButton(){
     
    console.log("Enter SearchMethod")    
       this.disableEditButtonFlag=false;
       this.disableSearchButtonFlag=true;

    }
handleEditButton(){
    debugger;
  this.disableSearchButtonFlag=false;
  this.disableEditButtonFlag=true;
    console.log("Enter Edit Method")    


}














}