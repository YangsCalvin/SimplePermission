//
//  SimplePermissionCalendar.h
//  EasyKit
//
//  Created by Easy on 2017/10/30.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface SimplePermissionCalendar : NSObject

+ (BOOL)authorized;

+ (EKAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
