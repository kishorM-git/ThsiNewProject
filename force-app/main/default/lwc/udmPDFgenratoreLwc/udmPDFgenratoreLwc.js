import { LightningElement,api } from 'lwc';
import generatePDF from '@salesforce/apex/pdfApexclass.generatePDF'
export default class UdmPDFgenratoreLwc extends LightningElement {
    @api recordId;
   imageUrl ='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAH8AAAB/CAMAAADxY+0hAAAAb1BMVEU8eQr///83dwD8/fwbawBmkVbb5NYpcAAxdACwxKcibQA7eAQucgD2+PXm7OQXaQDC0b3u8uwAYgBejEqAonK4yrFtlWDT3s/f5tyZs49NgjZDfCVKgS1ij1FUhjuhuZaNq4U6eBt2m2mFpnx2nGTTsRrPAAAD7ElEQVRoge2Z2ZKrIBCGFTUQFpcxBpckY3Te/xkPmg1UjGZwqk4V36Ux/A00TXfrOBaLxWKxWCwWi8VisVgsFovFYrFYLBaLxbIEAjrIJmNT+AJM/A4QjNDpHJwvDo6ocSNosX9xGRkAcHnIQsY8z2OM8e8jmDTyc/zcfREMxgYwjRNXISwqalR/9xrbG+gjJ3PHJK1vcBNm9PGRTcgLODa3B3p9XE+rC/KrMQO0+qjRyosVMGaATh9cvBl9N8Pb6hPK5+RdtzZ0CjT6qJ2Xd92TmR3Q6ONcr9yTHLfUB2dl9z1eHOp9KD2JT5uuPy1k+byMKBLXQPOIB6wxFgGm9bHsfeHX/TGCt12JfWRIXaf/JUf9w1MNlOJ5eISbx98vSZ45r7WmB3d/NTf5ZfpSqCFO4Bu+fxfMX1puYlZdqy8fv8bogi/Sj+Sznhte8gX6MJb03YxuZ8C0PlLij7u7RFtZoIm/6eD2jVN/m/xbc//Ij2+/8QYZTn3n9NHBHZEXlXkLtPnHcAE6WFYZTD3n9EWon86/4pNZC7T5J53YgZ7stP3904ELjQFJbdAN5uoPnQEud4yF5Ln6CweJxgAWwD/QFwnPVAHYv9oaKgBm9UUBHGjqAK8xk4DO63cWHKct8CojTvhOX1gQBZO7wKmJY/hev2uC4HYiHB5M7MAS/S4c07Ej7JCBBVimLyxAY1c0UYIt1Xc6R2jUePBtIAis0O/igbIEefTH+g64yolpYsABZ/QJGkd5KvcF2CchACDlT3L/T9UHuB5vMIGSvpeu16fXTK5nnCiZHg/gUqzMWCBydfYuAfi1J8pn6YlSaT17KoRe9/0OD296gn8xfwLL3n+lqwOksv4joADY3peFD0oPJSti63pAANa3BoZ3eTqWcsGG0d3My+uY8Up2QnCV+0LJmvNPaPUcNbmncAQG0nBu3N/pxNnLD8MgelQegKrnf7fm/AMlmyqwD3EECyXJrfupgqOrwg8owlC8XhVqQ7hYcf6HDT3Gs4yrw7G7O+HRdcvCOMvicJCRe+cV20+ccDjqEH5PqUD19tXb+6vCPxou64ifh6eh4N2rPcG6JDiK54fbvfIZ+Lb7KshW3n4ET5V0L0ppN/Wp/5Nw9VcQUM01dWtlOrCebb93R3h97AeVfgX2g3weHnW1x2325ScVEBgfrcfsR+UEgjP+8mlHiOBgagl4OeFLBJcaC3iKP848EWqGYYf/aGYDaPmdD/0gic/0N9UnQTht45B13zQZS+I2hfo8GkB0brM8uX8ATfh3U+FfN6IAwhE4pef0JAI7mt9J0n3/hdeLeLt0sE+BodJ/3SftLT+AWyyW/5x/4dIwygAUFwkAAAAASUVORK5CYII='
    invoiceData={
        invoiceNo:'123',
        invoiceCreated:'January 1, 2019',
        invoiceDue:'January 10, 2020',
        companyName:'Sparksuite, Inc.',
        address1:'12345 Sunny Road',
        address2:' Sunnyville, CA 12345'
    }
    clientData={
        client:'Acme Corp',
        username:'John Doe',
        email:'john@example.com'
    }
    services=[
        {name:'Consultant fee', amount:1000.00},
        {name:'Website design', amount:300.00},
        {name:'Hosting (3 months)', amount:75.00}
    ]

    get totalAmount(){
        return this.services.reduce((total, service)=>{
            return total = total+service.amount
        }, 0)
    }
    pdfHandler(){
        let content = this.template.querySelector('.container')
        console.log(content.outerHTML)
        generatePDF({ recordId:this.recordId, htmlData:content.outerHTML}).then(result=>{
            console.log("attachment id", result)
             window.open(`https://truecallerphone-dev-ed.file.force.com/servlet/servlet.FileDownload?file=00P5i00000SEEjEEAX&operationContext=S1=${result.Id}`)
        }).catch(error=>{
            console.error(error)
        })
    }
}