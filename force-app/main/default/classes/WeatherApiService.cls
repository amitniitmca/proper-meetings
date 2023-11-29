/**
 * @description       : This Apex class is used to perform CRUD operation on WeatherAPI custom settings.
 * @author            : Amit Kumar (Proper Salesforce Tutorials)
 * @created on        : 29-11-2023
 * @last modified on  : 29-11-2023
 * @last modified by  : Amit Kumar (Proper Salesforce Tutorials)
**/

public inherited sharing class WeatherApiService {
    
    public static Map<String, String> getOrganizationApiInfo(){
        return getApiInfo(UserInfo.getOrganizationId());
    }

    public static Map<String, String> getUserApiInfo(){
        return getApiInfo(UserInfo.getUserId());
    }

    public static void setOrganizationApiInfo(String key, String host){
        setApiInfo(UserInfo.getOrganizationId(), key, host);
    }
    
    public static void setUserApiInfo(String key, String host){
        setApiInfo(UserInfo.getUserId(), key, host);

    }

    private static void setApiInfo(Id instanceId, String key, String host){
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(instanceId);
        api.proper_meeting__API_Key__c = key;
        api.proper_meeting__API_Host__c = host;
        UPSERT api;
    }

    private static Map<String, String> getApiInfo(Id instanceId){
        proper_meeting__WeatherAPI__c api = proper_meeting__WeatherAPI__c.getInstance(instanceId);
        Map<String, String> apiMap = new Map<String, String>();
        apiMap.put('key', api.proper_meeting__API_Key__c);
        apiMap.put('host', api.proper_meeting__API_Host__c);
        return apiMap;
    }
}