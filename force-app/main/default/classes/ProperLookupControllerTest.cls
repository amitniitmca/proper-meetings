/**
 * @description       : 
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 28-11-2023
 * @last modified on  : 28-11-2023
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
@IsTest
class ProperLookupControllerTest {
    @TestSetup
    static void createData(){
        List<Account> accounts = new List<Account>();
        for(Integer index=1; index<=3; index++){
            Account acc = new Account(Name='Test Account '+index, Type='Prospect');
            accounts.add(acc);
        }
        INSERT accounts;
    }
    
    @IsTest
    static void getRecordsTest1(){
        String objectName = 'Account';
        List<String> fieldNames = new List<String>{'Id', 'Name', 'Type'};
        Test.startTest();
        List<SObject> records = ProperLookupController.getRecords(objectName, fieldNames);
        Test.stopTest();
        System.assertEquals(3, records.size(), 'Number of records is not matching!');
    }

    @IsTest
    static void getRecordsTest2(){
        String objectName;
        List<String> fieldNames = new List<String>();
        Test.startTest();
        List<SObject> records = new List<SObject>();
        try {
            records = ProperLookupController.getRecords(objectName, fieldNames);
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        System.assertEquals(0, records.size(), 'Number of records is not matching!');
    }
}