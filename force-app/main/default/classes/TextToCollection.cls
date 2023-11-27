/**
 * @description       : This Apex Action is used to convert text values to collection of string.
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @create on         : 27-11-2023
 * @last modified on  : 27-11-2023
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
public with sharing class TextToCollection {
    /**
    * @description It is used to convert the text value to a String collection
    * @author Amit Kumar (Proper Salesforce Tutorials) | 27-11-2023 
    * @param content ValuesInfo instance to provide text and separator
    * @return List<List<String>> List of string formed by separating text with the separator
    **/
    @InvocableMethod(label='Convert Text to Collection')
    public static List<List<String>> convert(List<ValuesInfo> content){
        try {
            String textValue = content.get(0).text;
            String separator = content.get(0).separator;
            List<String> collection = textValue.split(separator);
            return new List<List<String>>{collection};
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    /**
    * @description This inner class is used to provide the text and the separator
    **/
    public class ValuesInfo{
        @InvocableVariable
        public String text;
        @InvocableVariable
        public String separator;
    }
}