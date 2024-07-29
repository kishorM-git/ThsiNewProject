@isTest
public class AccountTriggerT_TEST {
    @testsetup
    public static void setupMethod(){
        Account objacc=new Account(Name='kishor', Rating='Hot');
        Database.insert(objacc , false);
    } 
    
    
    @isTest
    public static void AccounrtypePossitiveMethod(){

        string actualType=[select id,Type,Rating from Account  ].Type;
        system.assertEquals('Prospect', actualType);
    }
    @isTest
    public static void AccountTytpeNegativeMethod(){
        
        Account objacc=new Account(Name='kishor',Rating='Warm');
        insert objacc;
        string actualType1=[select id,Type,Rating from Account where id =: objacc.id].Type;
           system.assertEquals(null, actualType1);
    }
    @isTest
    public static void AccountTytpeEmptyMethod(){
        
        Account objacc=new Account(Name='kishor',Rating='');
        insert objacc;
        string actualType1=[select id,Type,Rating from Account where id =: objacc.id].Type;
           system.assertEquals(null, actualType1);
    }
    
}