//
//  SimplePermissionNetwork.m
//  EasyKits
//
//  Created by Easy on 2017/12/7.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import "SimplePermissionData.h"
#import <CoreTelephony/CTCellularData.h>

@interface SimplePermissionData()

@property (nonatomic, strong) id cellularData;
@property (nonatomic, copy) void (^completion)(BOOL granted,BOOL firstTime);
@end

@implementation SimplePermissionData

+ (instancetype)sharedManager
{
    static SimplePermissionData* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SimplePermissionData alloc] init];
        
    });
    
    return _sharedInstance;
}


+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    if (@available(iOS 10,*)) {
        
        [SimplePermissionData sharedManager].completion = completion;
        
        if (![SimplePermissionData sharedManager].cellularData) {
            
            CTCellularData *cellularData = [[CTCellularData alloc] init];
            
            cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (state == kCTCellularDataNotRestricted) {
                        //没有限制
                        [SimplePermissionData sharedManager].completion(YES,NO);
                        NSLog(@"有网络权限");
                    }
                    else if (state == kCTCellularDataRestrictedStateUnknown)
                    {
                        //                    completion(NO,NO);
                        NSLog(@"没有请求网络或正在等待用户确认权限?");
                    }
                    else{
                        //
                        [SimplePermissionData sharedManager].completion(NO,NO);
                        NSLog(@"无网络权限");
                    }
                });
            };
            
            //不存储，对象cellularData会销毁
            [SimplePermissionData sharedManager].cellularData = cellularData;
        }
    }
    else
    {
        completion(YES,NO);
    }

}

@end
