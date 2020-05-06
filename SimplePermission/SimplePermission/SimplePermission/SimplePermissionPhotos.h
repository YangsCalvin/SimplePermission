//
//  SimplePermissionPhotos.h
//  EasyKits
//
//  Created by Easyia on 2017/9/10.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SimplePermissionPhotos : NSObject

+ (BOOL)authorized;

/**
 photo permission status
 
 @return
 0 :NotDetermined
 1 :Restricted
 2 :Denied
 3 :Authorized
 */
+ (NSInteger)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
