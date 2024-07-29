import { LightningElement ,wire} from 'lwc';
import filterMethod from '@salesforce/apex/fiteringApexclass.filterMethod'

export default class UdmFilteringHtmlDataTable extends LightningElement {
    headings=["Id", "Name", "Title", "Email"]
 fullTableData=[];
  filteredData=[];
  timer
  filterBy="Name"

@wire(filterMethod)

fiterWire({data,error}){
if(data){

 this.fullTableData=data;
 this.filteredData=data;//  dono me same data hai leking use data to filter bhi krna hai to eske liye use
 console.log('data enter from sever=='+JSON.stringify(this.filteredData));
}
if(error){

    console.error('data enter from error=='+JSON.stringify(error));

}




}
get FilterByOptions(){
    return [
        {label:"All", value:'All'},
        {label:"Id", value:'Id'},
        {label:'Name', value:'Name'},
        {label:'Title', value:'Title'},
        {label:'Email', value:'Email'}
    ]
}


filterbyHandler(event){
    this.filterBy = event.target.value
}




filterHandler(event){

    const {value} = event.target
    window.clearTimeout(this.timer)
    if(value){
        this.timer = window.setTimeout(()=>{
            console.log(value)
            this.filteredData = this.fullTableData.filter(eachObj=>{
                if(this.filterBy === 'All'){
                    /**Below logic will filter each and every property of object */
                    return Object.keys(eachObj).some(key=>{
                        return eachObj[key].toLowerCase().includes(value)
                    })
                } else {
                     /**Below logic will filter only selected fields */
                    const val = eachObj[this.filterBy] ? eachObj[this.filterBy]:''
                    return val.toLowerCase().includes(value)
                }
            })
        }, 500)


} else {
    this.filteredData = [...this.fullTableData]
}



}



}