import { LightningElement } from 'lwc';

export default class LwcUdmProjectQizeAppOne extends LightningElement {
    selected={} // for storing answers
    correctAnswers = 0 //to show the number of correct answers
    isSubmitted = false // use to show the result

    myQuestions=[
        {
            id:"Question1",
            question:"Which one of the following is not a template loop?",
            answers:{
                a:"for:each",
                b:"iterator",
                c:"map loop"
            },
            correctAnswer:"c"
        },
        {
            id:"Question2",
            question:"Which of the file is invalid in LWC component folder?",
            answers:{
                a:".svg",
                b:".apex",
                c:".js"
            },
            correctAnswer:"b"
        },
        {
            id:"Question3",
            question:"WHich one of the following is not a directive?",
            answers:{
                a:"for:each",
                b:"if:true",
                c:"@track"
            },
            correctAnswer:"c"
        }
    ]
// changeHandler get's called on every click on the options
    changeHandler(event){
        const {name, value} = event.target //means const name=event.target.name ex=question1
                                             //const value=event.target.Value    ex='a'
        this.selected={...this.selected, [name]:value}
        
    }
    get isScoredFull(){
        return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswers?
            'slds-text-color_success':'slds-text-color_error'}`
    }

    get allNotSelected(){
return !(Object.keys(this.selected).length === this.myQuestions.length)

    }

    submitHandler(event){
        event.preventDefault()//ye page ko refresh krta hai automatic
        let correct = this.myQuestions.filter(item=>this.selected[item.id] === item.correctAnswer)//correect mach kare ex first
                                                                                               //ayega c===c()  no1
                                                                                            //    b===a no2
                                                                                            //    c===d no 3


        this.correctAnswers = correct.length
        this.isSubmitted = true

    }
resetHandler(){
    this.selected ={}//object ko reset kiya
    this.correctAnswers=0//currect answer ko 0 kiya
    this.isSubmitted = false//esko band kiya


}



    
}