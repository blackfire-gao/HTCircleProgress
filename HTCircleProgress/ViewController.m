//
//  ViewController.m
//  HTCircleProgress
//
//  Created by 高海涛 on 16/7/22.
//  Copyright © 2016年 高海涛. All rights reserved.
//

#import "ViewController.h"
#import "HTCircleProgress.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HTCircleProgress *hehe;
@property (weak, nonatomic) IBOutlet UITextField *endProgressTextField;
@property (weak, nonatomic) IBOutlet UITextField *progressFrameIntervalTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
}


- (IBAction)refresh:(id)sender {
    
    //结束时的进度（完全进度=1）
    _hehe.endProgress=[_endProgressTextField.text floatValue];
    //开始位置，(默认为右侧开始)
    _hehe.startPosition=TOPSTART;
    //每秒调用次数=60/frameInterval。例如每秒调用30次，则frameInterval设为2。
    _hehe.progressFrameInterval=[_progressFrameIntervalTextField.text floatValue];
    
    [_hehe setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
