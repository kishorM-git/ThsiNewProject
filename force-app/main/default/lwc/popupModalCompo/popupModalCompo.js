import { LightningElement } from 'lwc';

export default class PopupModalCompo extends LightningElement {

    closePopModalHandler(){
        const myEvent = new CustomEvent("popupevent", {
            detail : false
            });
            this.dispatchEvent(myEvent);







        }
    
}