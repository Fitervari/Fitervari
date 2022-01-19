# UserAPI

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteUsersUserId**](UserAPI.md#deleteusersuserid) | **DELETE** /users/{userId} | Delete specific user
[**getUser**](UserAPI.md#getuser) | **GET** /users/{userId} | Get specific user
[**getUserWorkoutPlans**](UserAPI.md#getuserworkoutplans) | **GET** /users/{userId}/workoutPlans/ | Get workout plans of user
[**getUsers**](UserAPI.md#getusers) | **GET** /users | Get all users
[**postUsers**](UserAPI.md#postusers) | **POST** /users | Activate user
[**postUsersUserIdWorkoutPlans**](UserAPI.md#postusersuseridworkoutplans) | **POST** /users/{userId}/workoutPlans/ | Add workout plan for user
[**putUsersUserId**](UserAPI.md#putusersuserid) | **PUT** /users/{userId} | Update specific user


# **deleteUsersUserId**
```swift
    open class func deleteUsersUserId(userId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete specific user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 

// Delete specific user
UserAPI.deleteUsersUserId(userId: userId) { (response, error) in
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

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
```swift
    open class func getUser(userId: String, completion: @escaping (_ data: User?, _ error: Error?) -> Void)
```

Get specific user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 

// Get specific user
UserAPI.getUser(userId: userId) { (response, error) in
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

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserWorkoutPlans**
```swift
    open class func getUserWorkoutPlans(userId: String, completion: @escaping (_ data: [WorkoutPlan]?, _ error: Error?) -> Void)
```

Get workout plans of user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 

// Get workout plans of user
UserAPI.getUserWorkoutPlans(userId: userId) { (response, error) in
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

[**[WorkoutPlan]**](WorkoutPlan.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsers**
```swift
    open class func getUsers(completion: @escaping (_ data: [User]?, _ error: Error?) -> Void)
```

Get all users

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all users
UserAPI.getUsers() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[User]**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUsers**
```swift
    open class func postUsers(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Activate user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Activate user
UserAPI.postUsers() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUsersUserIdWorkoutPlans**
```swift
    open class func postUsersUserIdWorkoutPlans(userId: String, workoutPlan: WorkoutPlan? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Add workout plan for user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 
let workoutPlan = WorkoutPlan(id: 123, name: "name_example", description: "description_example", validFrom: "validFrom_example", validTill: "validTill_example") // WorkoutPlan |  (optional)

// Add workout plan for user
UserAPI.postUsersUserIdWorkoutPlans(userId: userId, workoutPlan: workoutPlan) { (response, error) in
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
 **workoutPlan** | [**WorkoutPlan**](WorkoutPlan.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putUsersUserId**
```swift
    open class func putUsersUserId(userId: String, user: User? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update specific user

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let userId = "userId_example" // String | 
let user = User(id: 123, firstname: "firstname_example", lastname: "lastname_example", trainer: 123, creationDate: 123) // User |  (optional)

// Update specific user
UserAPI.putUsersUserId(userId: userId, user: user) { (response, error) in
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
 **user** | [**User**](User.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

