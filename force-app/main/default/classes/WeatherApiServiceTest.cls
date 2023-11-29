/**
 * @description       : This Apex Test class is used to test WeatherApiService Apex class. (100% Coverage)
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 29-11-2023
 * @last modified on  : 29-11-2023
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/
@IsTest
class WeatherApiServiceTest {
    
    @IsTest
    static void getOrganizationApiInfoTest(){
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(UserInfo.getOrganizationId());
        api.proper_meeting__API_Key__c = 'key';
        api.proper_meeting__API_Host__c = 'host';
        INSERT api;
        Test.startTest();
        Map<String, String> apiMap = WeatherApiService.getOrganizationApiInfo();
        Test.stopTest();
        System.assertEquals(api.proper_meeting__API_Key__c, apiMap.get('key'), 'Key value not matching!');
        System.assertEquals(api.proper_meeting__API_Host__c, apiMap.get('host'), 'Host value not matching!');
    }

    @IsTest
    static void getUserApiInfoTest(){
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(UserInfo.getUserId());
        api.proper_meeting__API_Key__c = 'key';
        api.proper_meeting__API_Host__c = 'host';
        INSERT api;
        Test.startTest();
        Map<String, String> apiMap = WeatherApiService.getUserApiInfo();
        Test.stopTest();
        System.assertEquals(api.proper_meeting__API_Key__c, apiMap.get('key'), 'Key value not matching!');
        System.assertEquals(api.proper_meeting__API_Host__c, apiMap.get('host'), 'Host value not matching!');
    }

    @IsTest
    static void setOrganizationApiInfoTest(){
        Test.startTest();
        WeatherApiService.setOrganizationApiInfo('key', 'host');
        Test.stopTest();
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(UserInfo.getOrganizationId());
        System.assertEquals('key', api.proper_meeting__API_Key__c, 'Key value not matching!');
        System.assertEquals('host', api.proper_meeting__API_Host__c, 'Host value not matching!');
    }

    @IsTest
    static void setUserApiInfoTest(){
        Test.startTest();
        WeatherApiService.setUserApiInfo('key', 'host');
        Test.stopTest();
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(UserInfo.getUserId());
        System.assertEquals('key', api.proper_meeting__API_Key__c, 'Key value not matching!');
        System.assertEquals('host', api.proper_meeting__API_Host__c, 'Host value not matching!');
    }
}