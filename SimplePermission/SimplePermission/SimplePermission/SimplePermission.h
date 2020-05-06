//
//  SimplePermission.h
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,SimplePermissionType)
{
    SimplePermissionType_Location,
    SimplePermissionType_Camera,
    SimplePermissionType_Photos,
    SimplePermissionType_Contacts,
    SimplePermissionType_Reminders,
    SimplePermissionType_Calendar,
    SimplePermissionType_Microphone,
    SimplePermissionType_Health,
    SimplePermissionType_DataNetwork,
    SimplePermissionType_MediaLibrary
};

@interface SimplePermission : NSObject

/**
 only effective for location servince,other type reture YES
 @param type permission type,when type is not location,return YES
 @return YES if system location privacy service enabled NO othersize
 */
+ (BOOL)isServicesEnabledWithType:(SimplePermissionType)type;

/**
 whether device support the type
 @param type permission type
 @return  YES if device support
 */
+ (BOOL)isDeviceSupportedWithType:(SimplePermissionType)type;

/**
 whether permission has been obtained, only return status, not request permission
 for example, u can use this method in app setting, show permission status
 in most cases, suggest call "authorizeWithType:completion" method
 @param type permission type
 @return YES if Permission has been obtained,NO othersize
 */
+ (BOOL)authorizedWithType:(SimplePermissionType)type;

/**
 request permission and return status in main thread by block.
 execute block immediately when permission has been requested,else request permission and waiting for user to choose "Don't allow" or "Allow"
 @param type permission type
 @param completion May be called immediately if permission has been requested
 granted: YES if permission has been obtained, firstTime: YES if first time to request permission
 */
+ (void)authorizeWithType:(SimplePermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion;


/**
 
 @param types permission arrays
 @param viewController May be called immediately if permission has been requested
 granted: YES if permission has been obtained, firstTime: YES if first time to request permission
 */
+ (void)showAuthorizeControllerWithType:(NSArray<NSDictionary *> *)types toViewController:(UIViewController *)viewController;


@end

NS_ASSUME_NONNULL_END
