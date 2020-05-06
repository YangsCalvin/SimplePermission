//
//  EasyContactPermission.m
//  EasyKits
//
//  Created by lbx on 2017/9/3.
//  Copyright © 2017年 lbx. All rights reserved.
//

#import "SimplePermissionContacts.h"
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

@implementation SimplePermissionContacts

+ (BOOL)authorized
{
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        return status ==  CNAuthorizationStatusAuthorized;
}

/**
 access authorizationStatus

 @return ABAuthorizationStatus:prior to iOS 9 or CNAuthorizationStatus after iOS 9
 */
+ (NSInteger)authorizationStatus
{
    NSInteger status;
    status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    return status;
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    switch (status)
    {
        case CNAuthorizationStatusAuthorized:
        {
            if (completion) {
                completion(YES,NO);
            }
        }
            break;
        case CNAuthorizationStatusDenied:
        case CNAuthorizationStatusRestricted:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
        case CNAuthorizationStatusNotDetermined:
        {
            [[CNContactStore new] requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (completion) {
                        completion(granted,YES);
                    }
                });
            }];
            
        }
            break;
    }
}



@end
