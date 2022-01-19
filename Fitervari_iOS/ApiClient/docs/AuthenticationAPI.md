# AuthenticationAPI

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAdminToken**](AuthenticationAPI.md#getadmintoken) | **GET** /adminToken | Get auth token for trainer
[**getUsersUserIdActivationToken**](AuthenticationAPI.md#getusersuseridactivationtoken) | **GET** /users/{userId}/activationToken | Generate activationToken for user
[**getUsersUserIdAuthToken**](AuthenticationAPI.md#getusersuseridauthtoken) | **GET** /authToken | Generate authToken from activationToken


# **getAdminToken**
```swift
    open class func getAdminToken(username: String, password: String, completion: @escaping (_ data: UUID?, _ error: Error?) -> Void)
```

Get auth token for trainer

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let username = "username_example" // String | 
let password = "password_example" // String | 

// Get auth token for trainer
AuthenticationAPI.getAdminToken(username: username, password: password) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String** |  | 
 **password** | **String** |  | 

### Return type

**UUID**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsersUserIdActivationToken**
```swift
    open class func getUsersUserIdActivationToken(userId: String, completion: @escaping (_ data: UUID?, _ error: Error?) -> Void)
```

Generate activationToken for user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 

// Generate activationToken for user
AuthenticationAPI.getUsersUserIdActivationToken(userId: userId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String** |  | 

### Return type

**UUID**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsersUserIdAuthToken**
```swift
    open class func getUsersUserIdAuthToken(activationToken: UUID, completion: @escaping (_ data: UUID?, _ error: Error?) -> Void)
```

Generate authToken from activationToken

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let activationToken = 987 // UUID | 

// Generate authToken from activationToken
AuthenticationAPI.getUsersUserIdAuthToken(activationToken: activationToken) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **activationToken** | **UUID** |  | 

### Return type

**UUID**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

