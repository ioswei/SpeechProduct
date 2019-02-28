//
//  SpeechManger.h
//  AudioPlayDemo
//
//  Created by iMac-1 on 2019/2/27.
//  Copyright © 2019 Fyc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWSpeechManger : NSObject

//播放模型单例
+ (instancetype)sharedInstance;

/**
 请说出你的故事
 */
@property (nonatomic,copy) NSString *speechStr;

- (void)start;

@end

NS_ASSUME_NONNULL_END
