import { LightningElement } from 'lwc';

export default class ShowPopupCompo extends LightningElement {
    showpoppupModalflag=false;

    showPopupModalHandler(){

        this.showpoppupModalflag=true;

        
    }
    receivedPopupModalDataHandler(event){

        this.showpoppupModalflag=event.detail;
    }


}