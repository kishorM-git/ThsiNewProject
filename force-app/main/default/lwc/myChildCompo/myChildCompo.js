import {  LightningElement } from 'lwc';

export default class MyChildCompo extends LightningElement {
  childMessage='are child bhau';

  childButtonHandler(){
  
    const myEvent = new CustomEvent("mychildevent", {
        detail : this.childMessage 
       
        });
        this.dispatchEvent(myEvent);
        console.log(myEvent);
}




   }