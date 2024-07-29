import { LightningElement,api } from 'lwc';

export default class ChildPedination extends LightningElement {
    totalRecord;
    currentpage=1;
    visiablerecord;
    totalpage;
    recordSize=5;
    


    get records(){ 
        console.log('child get='+ this.visiablerecord)
return this.visiablerecord;

    }
    @api
    set records(data){
if(data){
this.totalRecord=data
console.log('enter the child side='+this.totalRecord)
this.totalpage=Math.ceil(data.length/this.recordSize)
console.log('total page='+this.totalpage)
this.upadterecord();


}


    }
    upadterecord(){
        const start=(this.currentpage-1)*this.recordSize;
const end=this.recordSize*this.currentpage;
this.visiablerecord=this.totalRecord.slice(start,end);
console.log('bhai bhai'+this.visiablerecord)
this.dispatchEvent(new CustomEvent('update',{

detail:{
    records:this.visiablerecord}

}))


    }
  
    periviousButtonHandler(){
if(this.currentpage>1){
this.currentpage=this.currentpage-1;
this.upadterecord();

}



    }

    nextButtonHandler(){
        if(this.currentpage<this.totalpage){

this.currentpage=this.currentpage+1
this.upadterecord();


        }



    }
   get priviousDesabledHandler(){

return this.currentpage <=1
    }
   get nextDesabledHandler(){
return this.currentpage>= this.totalpage

    }


}