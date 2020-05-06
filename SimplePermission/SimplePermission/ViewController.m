//
//  ViewController.m
//  SimplePermission
//
//  Created by Calvin on 2020/5/6.
//  Copyright © 2020 calendar. All rights reserved.
//

#import "ViewController.h"
#import "SimplePermission.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (@available(iOS 13.0, *)) {
        
        UIImage *seletedImage = [UIImage systemImageNamed:@"checkmark.seal.fill"];
        
        NSDictionary *location_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"paperplane.fill"],seletedImage,@"地理位置",@"APP需要您的同意，才能持续访问定位位置展示持续更新信息，如禁止将无法持续更新位置信息",@(SimplePermissionType_Location)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
        
        NSDictionary *camera_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"camera.fill"],seletedImage,@"手机相机",@"APP需要您的同意，才能访问相机进行拍摄商品信息，如禁止将无法拍照拍摄图片无法更新信息",@(SimplePermissionType_Camera)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
        
        [SimplePermission showAuthorizeControllerWithType:@[location_dict,camera_dict] toViewController:self];
    } else {
        // Fallback on earlier versions
    }
}

@end
