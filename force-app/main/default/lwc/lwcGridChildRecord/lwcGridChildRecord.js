import { LightningElement ,api} from 'lwc';
import gridMethod from '@salesforce/apex/GetChildRecordGrid.gridMethod';

const COLUMNS=[
{label:'Name',fieldName:'Name',type:'Text',editable:true},
{label:'First Name' ,fieldName:'FirstName',type:'text',editable:true},
{label:'Last Name' ,fieldName:'LastName' ,type:'text',editable:true}
];

export default class LwcGridChildRecord extends LightningElement {

columns=COLUMNS;
accountData;

connectedCallback (){

    gridMethod()

    .then(result=>{


        var tempContact=JSON.parse(JSON.stringify(result));//tempary contact liya yaha pe data add kiya

       // this.accountData=result;
console.log('ENTER the TempContact=='+JSON.stringify(tempContact));
console.log('Enter teh result=='+JSON.stringify(result))

for(var i=0;i<tempContact.length;i++){//contact data nikal ne lite loop using  index

var newContact=tempContact[i]['Contacts'];//sperate contact relate account  for data add kiys
console.log('Enter contact data=='+JSON.stringify(newContact));

if(newContact){//newcontact not empty

    tempContact[i]._children=newContact;// esme grid kiya contact nestecd kiys and store kiya
    //console.log('Enter children data=='+JSON.stringify(tempContact[i]._children));
delete tempContact[i].Contacts//  double contact save tha to ex ko delete kiya childern me bhi contact ka data hain
}

}

this.accountData=tempContact//esme changes data store kiaa
console.log('Enter Grid data=='+JSON.stringify(this.accountData));
    })
    .catch(error=>{


    })



}

getrowData(event){

const selectrows =event.detail.selectedRows;//Account only data aayega seellect krne kiaya tho
console.log('selected rowa=='+JSON.stringify( selectrows));
//abhi opko prticuler field hona to row ki ti
for(var i=0;i<selectrows.length;i++){

    console.log('row retrate data ==' +selectrows[i].Name);//ACount data 
    console.log('row retrate data =='+selectrows[i].LastName);//..child data
    
}

}



}