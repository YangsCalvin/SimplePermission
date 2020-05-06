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
        
        
        NSDictionary *music_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"music.mic"],seletedImage,@"手机麦克风",@"APP需要您的同意，才能使用麦克风，以便可以使用智能语音助手对话功能",@(SimplePermissionType_Microphone)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
        
        NSDictionary *calendar_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"calendar"],seletedImage,@"手机日历",@"APP需要您的同意，才能使用日历信息，以便可以持续给您推荐假日提醒功能",@(SimplePermissionType_Calendar)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
        
        NSDictionary *photo_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"photo"],seletedImage,@"手机相册",@"APP需要您的同意，才能使用你的相册功能，以便可以保存一些精美的图片或视频",@(SimplePermissionType_Photos)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
        
        NSDictionary *camera_dict = [NSDictionary dictionaryWithObjects:@[[UIImage systemImageNamed:@"camera.fill"],seletedImage,@"手机相机",@"APP需要您的同意，才能访问相机进行拍摄商品信息，如禁止将无法拍照拍摄图片无法更新信息",@(SimplePermissionType_Camera)] forKeys:@[@"iconImage",@"selectedImage",@"name",@"describe",@"type"]];
           
        [SimplePermission showAuthorizeControllerWithType:@[music_dict,calendar_dict,photo_dict,camera_dict] toViewController:self];
       } else {
           // Fallback on earlier versions
       }
}

@end
