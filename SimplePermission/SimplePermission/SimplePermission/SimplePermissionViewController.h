//
//  SimplePermissionViewController.h
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimplePermissionViewController : UIViewController

@property (copy, nonatomic)NSArray<NSDictionary *> *permissions;

@end

NS_ASSUME_NONNULL_END
