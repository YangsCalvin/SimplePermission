//
//  SimplePermissionGPS.h
//  EasyKits
//
//  Created by Easy on 2017/9/7.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimplePermissionLocation : NSObject

/**
 @return YES if GPS system service enabled,NO if GPS system service is not enabled
 */
+ (BOOL)isServicesEnabled;

+ (BOOL)authorized;

+ (CLAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end

NS_ASSUME_NONNULL_END
