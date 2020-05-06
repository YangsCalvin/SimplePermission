//
//  ZYPermission.m
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import "SimplePermission.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "SimplePermissionViewController.h"


typedef void(^completionPermissionHandler)(BOOL granted,BOOL firstTime);


@implementation SimplePermission


+ (BOOL)isServicesEnabledWithType:(SimplePermissionType)type
{
    if (type == SimplePermissionType_Location)
    {
        SEL sel = NSSelectorFromString(@"isServicesEnabled");
        BOOL ret  = ((BOOL *(*)(id,SEL))objc_msgSend)( NSClassFromString(@"SimplePermissionLocation"), sel);
        return ret;
    }
    return YES;
}

+ (BOOL)isDeviceSupportedWithType:(SimplePermissionType)type
{
    if (type == SimplePermissionType_Health) {
        
        SEL sel = NSSelectorFromString(@"isHealthDataAvailable");
        BOOL ret  = ((BOOL *(*)(id,SEL))objc_msgSend)( NSClassFromString(@"SimplePermissionHealth"), sel);
        return ret;
    }
    return YES;
}

+ (BOOL)authorizedWithType:(SimplePermissionType)type
{
    SEL sel = NSSelectorFromString(@"authorized");
    
    NSString *strClass = nil;
    switch (type) {
        case SimplePermissionType_Location:
            strClass = @"SimplePermissionLocation";
            break;
        case SimplePermissionType_Camera:
            strClass = @"SimplePermissionCamera";
            break;
        case SimplePermissionType_Photos:
            strClass = @"SimplePermissionPhotos";
            break;
        case SimplePermissionType_Contacts:
            strClass = @"SimplePermissionContacts";
            break;
        case SimplePermissionType_Reminders:
            strClass = @"SimplePermissionReminders";
            break;
        case SimplePermissionType_Calendar:
            strClass = @"SimplePermissionCalendar";
            break;
        case SimplePermissionType_Microphone:
            strClass = @"SimplePermissionMicrophone";
            break;
        case SimplePermissionType_Health:
            strClass = @"SimplePermissionHealth";
            break;
        case SimplePermissionType_DataNetwork:
            break;
        case SimplePermissionType_MediaLibrary:
            strClass = @"SimplePermissionMediaLibrary";
            break;
            
        default:
            break;
    }
    
    if (strClass) {
        BOOL ret  = ((BOOL *(*)(id,SEL))objc_msgSend)( NSClassFromString(strClass), sel);
        return ret;
    }
    
    return NO;
}

+ (void)authorizeWithType:(SimplePermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    NSString *strClass = nil;
    switch (type) {
        case SimplePermissionType_Location:
            strClass = @"SimplePermissionLocation";
            break;
        case SimplePermissionType_Camera:
            strClass = @"SimplePermissionCamera";
            break;
        case SimplePermissionType_Photos:
            strClass = @"SimplePermissionPhotos";
            break;
        case SimplePermissionType_Contacts:
            strClass = @"SimplePermissionContacts";
            break;
        case SimplePermissionType_Reminders:
            strClass = @"SimplePermissionReminders";
            break;
        case SimplePermissionType_Calendar:
             strClass = @"SimplePermissionCalendar";
            break;
        case SimplePermissionType_Microphone:
            strClass = @"SimplePermissionMicrophone";
            break;
        case SimplePermissionType_Health:
            strClass = @"SimplePermissionHealth";
            break;
        case SimplePermissionType_DataNetwork:
            strClass = @"SimplePermissionData";
            break;
        case SimplePermissionType_MediaLibrary:
            strClass = @"SimplePermissionMediaLibrary";
            break;
            
        default:
            break;
    }
    
    if (strClass)
    {
        SEL sel = NSSelectorFromString(@"authorizeWithCompletion:");
        ((void(*)(id,SEL, completionPermissionHandler))objc_msgSend)(NSClassFromString(strClass),sel, completion);
    }
}

+ (void)showAuthorizeControllerWithType:(NSArray<NSDictionary *> *)types toViewController:(UIViewController *)viewController{
    
    SimplePermissionViewController *vc = [SimplePermissionViewController new];
    vc.permissions = types;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.shadowImage = [UIImage new];
    if (@available(iOS 13.0, *)) {
        [nav setModalInPresentation:YES];
    } else {
        // Fallback on earlier versions
    }
    
    [viewController presentViewController:nav animated:YES completion:nil];
}

@end

