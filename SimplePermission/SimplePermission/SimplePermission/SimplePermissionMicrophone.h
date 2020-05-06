//
//  SimplePermissionAudio.h
//  EasyKit
//
//  Created by Easy on 2017/10/30.
//  Copyright © 2017年 Easy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SimplePermissionMicrophone : NSObject

+ (BOOL)authorized;

/**
 permission status
 
 0 ：AVAudioSessionRecordPermissionUndetermined
 1 ：AVAudioSessionRecordPermissionDenied
 2 ：AVAudioSessionRecordPermissionGranted
 
 @return status
 */
+ (NSInteger)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
