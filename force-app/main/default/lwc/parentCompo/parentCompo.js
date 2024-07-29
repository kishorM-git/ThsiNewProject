import { LightningElement } from 'lwc';

export default class ParentCompo extends LightningElement {
     x;
     a;

     SendButtonhandleClick(){
       this.a=200;
       this.x=100;


     }



}