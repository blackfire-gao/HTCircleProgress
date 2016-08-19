//
//  HTCircleProgress.h
//  HTCircleProgress
//
//  Created by 高海涛 on 16/7/22.
//  Copyright © 2016年 高海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

//进度环宽度
#define HTProgressCircleWidth 2
//文字缩放
#define HTProgressViewFontScale (MIN(self.frame.size.width, self.frame.size.height) / 70.0)
//文字颜色
#define HTProgressTextcolor [UIColor colorWithRed:0.149 green:0.651 blue:0.9529 alpha:1.0]

//进度颜色
#define HTProgressCircleColor  [UIColor colorWithRed:0.149 green:0.651 blue:0.9529 alpha:1.0]

//进背景颜色
#define HTProgressViewBackgroundColor  [UIColor colorWithRed:0.8784 green:0.8784 blue:0.8784 alpha:1.0]
// 遮罩
#define HTProgressCenterColor [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]

typedef NS_ENUM(NSUInteger,HTCircleProgressStart){
    RIGHTSTART=0,
    BOTTOMSTART=1,
    LEFTSTART=2,
    TOPSTART=3,
    
};

@interface HTCircleProgress : UIView

@property (nonatomic, assign) CGFloat progress;

//结束时
@property (nonatomic, assign) CGFloat endProgress;

//每秒调用次数=60/ frameInterval。比如当 frameInterval设为2，每秒调用就变成30次。
@property (nonatomic, assign) NSUInteger progressFrameInterval;

//开始的位置P
@property (nonatomic, assign) HTCircleProgressStart startPosition;


//手动调整中心的进度文字
- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes;



@end
