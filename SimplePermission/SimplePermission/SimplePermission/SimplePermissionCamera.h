//
//  SimplePermissionCamera.h
//  EasyKits
//
//  Created by Easyia on 2017/9/10.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface SimplePermissionCamera : NSObject

+ (BOOL)authorized;

+ (AVAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted ,BOOL firstTime ))completion;

@end
