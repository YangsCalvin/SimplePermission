//
//  AppDelegate.m
//  SimplePermission
//
//  Created by Calvin on 2020/5/6.
//  Copyright © 2020 calendar. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
      self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
      self.window.backgroundColor = [UIColor blackColor];
      
      self.window.rootViewController = [[ViewController alloc] init];;
      
      [self.window makeKeyAndVisible];
      
      return YES;
}


@end
