//
//  SimplePermissionTableViewCell.m
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import "SimplePermissionTableViewCell.h"

@interface SimplePermissionTableViewCell()


@end
@implementation SimplePermissionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(!selected){
        if (@available(iOS 13.0, *)) {
//            self.contentView.backgroundColor = [UIColor systemBackgroundColor];
        } else {
//            self.contentView.backgroundColor = [UIColor whiteColor];
        }
        self.selectedImageView.hidden = NO;
    }else{
        self.selectedImageView.hidden = YES;
//        self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    // Configure the view for the selected state
}

@end
