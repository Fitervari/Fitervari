# WorkoutPlanAPI

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteWorkoutPlansWorkoutPlanId**](WorkoutPlanAPI.md#deleteworkoutplansworkoutplanid) | **DELETE** /workoutPlans/{workoutPlanId}/ | Delete specific workout plan
[**deleteWorkoutSessionsWorkoutSessionId**](WorkoutPlanAPI.md#deleteworkoutsessionsworkoutsessionid) | **DELETE** /workoutSessions/{workoutSessionId} | Delete specific workout session
[**getWorkoutPlansWorkoutId**](WorkoutPlanAPI.md#getworkoutplansworkoutid) | **GET** /workoutPlans/{workoutPlanId}/ | Get specific workout plan
[**getWorkoutPlansWorkoutIdWorkoutSessions**](WorkoutPlanAPI.md#getworkoutplansworkoutidworkoutsessions) | **GET** /workoutPlans/{workoutPlanId}/workoutSessions/ | Get workout sessions of workout plan
[**getWorkoutSessionsWorkoutSessionId**](WorkoutPlanAPI.md#getworkoutsessionsworkoutsessionid) | **GET** /workoutSessions/{workoutSessionId} | Get specific workout session
[**postWorkoutPlansWorkoutPlanIdWorkoutSessions**](WorkoutPlanAPI.md#postworkoutplansworkoutplanidworkoutsessions) | **POST** /workoutPlans/{workoutPlanId}/workoutSessions/ | Add workout sessions of workout plan
[**putWorkoutPlansWorkoutPlanId**](WorkoutPlanAPI.md#putworkoutplansworkoutplanid) | **PUT** /workoutPlans/{workoutPlanId}/ | Update specific workout plan


# **deleteWorkoutPlansWorkoutPlanId**
```swift
    open class func deleteWorkoutPlansWorkoutPlanId(workoutPlanId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete specific workout plan

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutPlanId = 987 // Double | 

// Delete specific workout plan
WorkoutPlanAPI.deleteWorkoutPlansWorkoutPlanId(workoutPlanId: workoutPlanId) { (response, error) in
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
 **workoutPlanId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWorkoutSessionsWorkoutSessionId**
```swift
    open class func deleteWorkoutSessionsWorkoutSessionId(workoutSessionId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete specific workout session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutSessionId = 987 // Double | 

// Delete specific workout session
WorkoutPlanAPI.deleteWorkoutSessionsWorkoutSessionId(workoutSessionId: workoutSessionId) { (response, error) in
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
 **workoutSessionId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWorkoutPlansWorkoutId**
```swift
    open class func getWorkoutPlansWorkoutId(workoutPlanId: Double, completion: @escaping (_ data: WorkoutPlan?, _ error: Error?) -> Void)
```

Get specific workout plan

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutPlanId = 987 // Double | 

// Get specific workout plan
WorkoutPlanAPI.getWorkoutPlansWorkoutId(workoutPlanId: workoutPlanId) { (response, error) in
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
 **workoutPlanId** | **Double** |  | 

### Return type

[**WorkoutPlan**](WorkoutPlan.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWorkoutPlansWorkoutIdWorkoutSessions**
```swift
    open class func getWorkoutPlansWorkoutIdWorkoutSessions(workoutPlanId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get workout sessions of workout plan

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutPlanId = 987 // Double | 

// Get workout sessions of workout plan
WorkoutPlanAPI.getWorkoutPlansWorkoutIdWorkoutSessions(workoutPlanId: workoutPlanId) { (response, error) in
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
 **workoutPlanId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWorkoutSessionsWorkoutSessionId**
```swift
    open class func getWorkoutSessionsWorkoutSessionId(workoutSessionId: Double, completion: @escaping (_ data: WorkoutSession?, _ error: Error?) -> Void)
```

Get specific workout session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutSessionId = 987 // Double | 

// Get specific workout session
WorkoutPlanAPI.getWorkoutSessionsWorkoutSessionId(workoutSessionId: workoutSessionId) { (response, error) in
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
 **workoutSessionId** | **Double** |  | 

### Return type

[**WorkoutSession**](WorkoutSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postWorkoutPlansWorkoutPlanIdWorkoutSessions**
```swift
    open class func postWorkoutPlansWorkoutPlanIdWorkoutSessions(workoutPlanId: Double, workoutSession: WorkoutSession? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Add workout sessions of workout plan

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutPlanId = 987 // Double | 
let workoutSession = WorkoutSession(id: "id_example", plan: 123, date: "date_example", healthData: [HealthData(time: 123, type: "type_example", value: "value_example")]) // WorkoutSession |  (optional)

// Add workout sessions of workout plan
WorkoutPlanAPI.postWorkoutPlansWorkoutPlanIdWorkoutSessions(workoutPlanId: workoutPlanId, workoutSession: workoutSession) { (response, error) in
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
 **workoutPlanId** | **Double** |  | 
 **workoutSession** | [**WorkoutSession**](WorkoutSession.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putWorkoutPlansWorkoutPlanId**
```swift
    open class func putWorkoutPlansWorkoutPlanId(workoutPlanId: Double, workoutPlan: WorkoutPlan? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update specific workout plan

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workoutPlanId = 987 // Double | 
let workoutPlan = WorkoutPlan(id: 123, name: "name_example", description: "description_example", validFrom: "validFrom_example", validTill: "validTill_example") // WorkoutPlan |  (optional)

// Update specific workout plan
WorkoutPlanAPI.putWorkoutPlansWorkoutPlanId(workoutPlanId: workoutPlanId, workoutPlan: workoutPlan) { (response, error) in
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
 **workoutPlanId** | **Double** |  | 
 **workoutPlan** | [**WorkoutPlan**](WorkoutPlan.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

