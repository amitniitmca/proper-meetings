/**
 * @description       : Test class for TextToCollection Apex class with 100% code coverage
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 27-11-2023
 * @last modified on  : 27-11-2023
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
@IsTest
class TextToCollectionTest {
    /**
    * @description This method is used to test the convert method of the TextToCollection class for positive test.
    * @author Amit Kumar (Proper Salesforce Tutorials) | 27-11-2023 
    **/
    @IsTest
    static void convertTest(){
        String text = 'abc,def,ghi';
        String separator = ',';
        TextToCollection.ValuesInfo vi = new TextToCollection.ValuesInfo();
        vi.text = text;
        vi.separator = separator;
        Test.startTest();
        List<List<String>> values = TextToCollection.convert(new List<TextToCollection.ValuesInfo>{vi});
        Test.stopTest();
        System.assertEquals(3, values.get(0).size(), 'Number of returning values not matching');
        System.assertEquals('abc', values.get(0).get(0), 'First element in the list not same');
        System.assertEquals('def', values.get(0).get(1), 'Second element in the list not same');
        System.assertEquals('ghi', values.get(0).get(2), 'Third element in the list not same');
    }

    /**
    * @description This method is used to test the convert method of the TextToCollection class for negative test.
    * @author Amit Kumar (Proper Salesforce Tutorials) | 27-11-2023 
    **/
    @IsTest
    static void convertTestForException(){
        List<List<String>> values;
        Test.startTest();
        try {
            values = TextToCollection.convert(new List<TextToCollection.ValuesInfo>());
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        Test.stopTest();
        System.assertEquals(null, values, 'Exception not caught');
    }
}