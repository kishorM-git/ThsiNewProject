import { LightningElement } from 'lwc';

export default class MyFirstLwccompo extends LightningElement {
name;//undefine
firstName='Lakhan';//string
phone=9970090987;//number
salary=7000.00//decimal
flag=true;//boolean
todatDate=new Date();//current date

objAcc={sObjectType:'Account'}//object
applicantObject={sobjectType:'applicant__c'}//object

objContact={
'FirstName':'Munni',
'LastName':'Modi',
'Emai':'munni@gamil.com'
}

objAddress={
    'city__c':'India',
    'state__c':'Maharastra',
    'country__c':'Pune'
}
emplist=['Bunty','shakira','Bubli','Shaktiman'];


display(){//method



}
myMethod(){//method

}

}