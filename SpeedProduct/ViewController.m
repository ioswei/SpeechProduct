//
//  ViewController.m
//  SpeedProduct
//
//  Created by iMac-1 on 2019/2/28.
//  Copyright © 2019 iOS_阿玮. All rights reserved.
//

#import "ViewController.h"

#import "AWSpeechManger.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tf_inputContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark —————————————————————————————————— 语音播报
- (IBAction)speechClick:(UIButton *)sender {
    
    [AWSpeechManger sharedInstance].speechStr = _tf_inputContent.text;
    [[AWSpeechManger sharedInstance] start];
    
}

#pragma mark —————————————————————————————————— 支付宝到账
- (IBAction)alipayDemoClick:(UIButton *)sender {
    
    [AWSpeechManger sharedInstance].speechStr = @"支付宝到账1000000元";
    [[AWSpeechManger sharedInstance] start];
    
}



@end
