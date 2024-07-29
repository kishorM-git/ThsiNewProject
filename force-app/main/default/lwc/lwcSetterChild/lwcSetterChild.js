import { LightningElement ,api} from 'lwc';

export default class LwcSetterChild extends LightningElement {
   parentData;
   setdata;
   @api 
    get detail(){

return  this.parentData;

    }

    set detail(data){
let setdata=data.Age*2;
 this.parentData={...data,Age:setdata};


    }

}