public without sharing class Accountvf_cx {
public List<Account>applist{get; set;}

    public Accountvf_cx(ApexPages.StandardController controller) {

     applist =accountptovider.aapp();
    }
}