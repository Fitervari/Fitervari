# DeviceAPI

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteDevicesDeviceId**](DeviceAPI.md#deletedevicesdeviceid) | **DELETE** /devices/{deviceId} | Delete specific device
[**getDeviceGroups**](DeviceAPI.md#getdevicegroups) | **GET** /deviceGroups | Get all device groups
[**getDevices**](DeviceAPI.md#getdevices) | **GET** /devices | Get all devices
[**getDevicesDeviceId**](DeviceAPI.md#getdevicesdeviceid) | **GET** /devices/{deviceId} | Get specific device
[**postDevices**](DeviceAPI.md#postdevices) | **POST** /devices | Add device
[**putDevicesDeviceId**](DeviceAPI.md#putdevicesdeviceid) | **PUT** /devices/{deviceId} | Update specific device


# **deleteDevicesDeviceId**
```swift
    open class func deleteDevicesDeviceId(deviceId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete specific device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceId = 987 // Double | 

// Delete specific device
DeviceAPI.deleteDevicesDeviceId(deviceId: deviceId) { (response, error) in
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
 **deviceId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceGroups**
```swift
    open class func getDeviceGroups(completion: @escaping (_ data: [DeviceGroup]?, _ error: Error?) -> Void)
```

Get all device groups

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all device groups
DeviceAPI.getDeviceGroups() { (response, error) in
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

[**[DeviceGroup]**](DeviceGroup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevices**
```swift
    open class func getDevices(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get all devices

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Get all devices
DeviceAPI.getDevices() { (response, error) in
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

# **getDevicesDeviceId**
```swift
    open class func getDevicesDeviceId(deviceId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Get specific device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceId = 987 // Double | 

// Get specific device
DeviceAPI.getDevicesDeviceId(deviceId: deviceId) { (response, error) in
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
 **deviceId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postDevices**
```swift
    open class func postDevices(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Add device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Add device
DeviceAPI.postDevices() { (response, error) in
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

# **putDevicesDeviceId**
```swift
    open class func putDevicesDeviceId(deviceId: Double, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update specific device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceId = 987 // Double | 

// Update specific device
DeviceAPI.putDevicesDeviceId(deviceId: deviceId) { (response, error) in
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
 **deviceId** | **Double** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

