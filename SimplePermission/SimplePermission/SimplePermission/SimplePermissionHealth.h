//
//  SimplePermissionHealth.h
//  EasyKit
//
//  Created by Easy on 2017/10/30.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SimplePermissionHealth : NSObject

+ (BOOL)authorized;


/*!
 @method        isHealthDataAvailable
 @abstract      Returns YES if HealthKit is supported on the device.
 @discussion    HealthKit is not supported on all iOS devices.  Using HKHealthStore APIs on devices which are not
 supported will result in errors with the HKErrorHealthDataUnavailable code.  Call isHealthDataAvailable
 before attempting to use other parts of the framework.
 */
+ (BOOL)isHealthDataAvailable;

+ (NSInteger)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
