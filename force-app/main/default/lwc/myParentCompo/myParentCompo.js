import { LightningElement } from 'lwc';

export default class MyParentCompo extends LightningElement {
    recivefromChild='wating for Child';

    parentDisplayMethod(event){
        console.log('REsilt='+event.detail);
     
    this.recivefromChild= event.detail;
 
  console.log('REsilt='+event.detail);

    }



}