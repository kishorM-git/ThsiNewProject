import { LightningElement } from 'lwc';

export default class PracticeCRUD extends LightningElement {

   showSearchFlag=false;
   showUpdateFlag=false;
   showCreateFlag=true;
   showDeleteFlag=false;
a;
accountName={'sObjectName':'Account'}
   createHandler(){
      console.log('enter the cretae method');
      
     this.showCreateFlag=true;
     this.showSearchFlag=false;
     this.showUpdateFlag=false;
     
    this.showDeleteFlag=false;
   }
   searcHandler(){

      this.showCreateFlag=false;
      this.showSearchFlag=true;
      this.showUpdateFlag=false;
      
     this.showDeleteFlag=false;
   }
   updateHandler(){
      this.showCreateFlag=false;
      this.showSearchFlag=false;
      this.showUpdateFlag=true;
      
     this.showDeleteFlag=false;

   }
   deleteHandler(){

      this.showCreateFlag=false;
      this.showSearchFlag=false;
      this.showUpdateFlag=false;
      
     this.showDeleteFlag=true;

   }



    
}