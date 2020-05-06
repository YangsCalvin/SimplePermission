//
//  SimplePermissionTableViewCell.h
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimplePermissionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;

@end

NS_ASSUME_NONNULL_END
