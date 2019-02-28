//
//  SpeechManger.m
//  AudioPlayDemo
//
//  Created by iMac-1 on 2019/2/27.
//  Copyright © 2019 Fyc. All rights reserved.
//

#import "AWSpeechManger.h"

#import <AVFoundation/AVFoundation.h>

@interface AWSpeechManger () <AVSpeechSynthesizerDelegate>
{
    AVSpeechSynthesizer      *av;
    NSString                 *_languageStr;
    
}
@end

@implementation AWSpeechManger

+ (instancetype)sharedInstance
{
    static AWSpeechManger *single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[AWSpeechManger alloc] init];
    });
    return single;
}

- (void)start{
    
    NSArray *_languageArr = @[@"en-US",@"zh-CN",@"en-GB",@"zh-HK"];
    
    _languageStr = _languageArr [1];
    if([av isPaused]) {
        //如果暂停则恢复，会从暂停的地方继续
        [av continueSpeaking];
        
    }else{
        //初始化对象
        av= [[AVSpeechSynthesizer alloc]init];
        av.delegate = self;//挂上代理
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self.speechStr];//需要转换的文字
        utterance.rate = 0.5;// 设置语速，范围0-1，注意0最慢，1最快；AVSpeechUtteranceMinimumSpeechRate最慢，AVSpeechUtteranceMaximumSpeechRate最快
        AVSpeechSynthesisVoice*voice = [AVSpeechSynthesisVoice voiceWithLanguage:_languageStr];//设置发音，这是中文普通话
        utterance.voice= voice;
        [av speakUtterance:utterance];//开始
       
    }
    
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didStartSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---开始播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---完成播放");
   
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---播放中止");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---恢复播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance*)utterance{
    
    NSLog(@"---播放取消");
    
}

@end
