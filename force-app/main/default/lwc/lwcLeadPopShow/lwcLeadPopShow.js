import { LightningElement } from 'lwc';

export default class LwcLeadPopShow extends LightningElement {

    popdata='kishoe the dat';
    closePopModalHandler(event){
        const myEvent = new CustomEvent("popupevent", {
            detail : false
            });
            this.dispatchEvent(myEvent);


}






}