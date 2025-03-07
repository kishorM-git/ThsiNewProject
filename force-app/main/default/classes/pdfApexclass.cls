public with sharing class pdfApexclass {
    @AuraEnabled
    public static Attachment generatePDF(Id recordId, String htmlData){
        Pagereference page = Page.pdfController;
        page.getParameters().put('pdfText',htmlData);

        Contact con = new Contact(Id=recordId);
        Attachment objAttachment = new Attachment();
        objAttachment.Name='invoice.pdf';
        objAttachment.ParentId = con.Id;
        objAttachment.Body = page.getContentaspdf();
        objAttachment.IsPrivate = false;
        insert objAttachment;
        return objAttachment;
    }


}