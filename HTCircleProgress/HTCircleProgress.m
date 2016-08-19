//
//  HTCircleProgress.m
//  HTCircleProgress
//
//  Created by 高海涛 on 16/7/22.
//  Copyright © 2016年 高海涛. All rights reserved.
//

#import "HTCircleProgress.h"

@implementation HTCircleProgress{
    
    CGFloat startProgress;
    CADisplayLink *link;

}


- (void)drawRect:(CGRect)rect {
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5);
    CGContextRef ref=UIGraphicsGetCurrentContext();
    
    // 进度环背景
    [HTProgressViewBackgroundColor set];
    CGContextAddArc(ref, xCenter, yCenter, radius, 0, M_PI*2, 0);
    CGContextClosePath(ref);
    CGContextFillPath(ref);
    
    //进度条
    [HTProgressCircleColor set];
    if (!_startPosition) {
        
        _startPosition=0;
    }
    CGContextAddArc(ref, xCenter, yCenter, radius, M_PI/2*self.startPosition, 2*M_PI*_progress+M_PI/2*self.startPosition, 0);
    CGContextAddLineToPoint(ref, xCenter, yCenter);
    CGContextClosePath(ref);
    CGContextFillPath(ref);
    
    //中心遮罩
    [HTProgressCenterColor set];
    CGContextAddArc(ref, xCenter, yCenter, radius-HTProgressCircleWidth*10, 0, M_PI*2, 0);
    CGContextFillPath(ref);
    
    // 进度数字
    NSString *progressStr = [NSString stringWithFormat:@"%.0f%s", self.progress * 100, "\%"];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20 * HTProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = HTProgressTextcolor;
    [self setCenterProgressText:progressStr withAttributes:attributes];

    
    // 调整环形进度条
    link = [CADisplayLink displayLinkWithTarget:self selector:@selector(progressRun)];
    link.frameInterval = _progressFrameInterval;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    
}
- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes
{
    CGFloat xCenter = self.frame.size.width * 0.5;
    CGFloat yCenter = self.frame.size.height * 0.5;
    
    
    CGSize strSize = [text sizeWithAttributes:attributes];
    CGFloat strX = xCenter - strSize.width * 0.5;
    CGFloat strY = yCenter - strSize.height * 0.5;
    [text drawAtPoint:CGPointMake(strX, strY) withAttributes:attributes];
    
    
}

- (void)progressRun
{
    
    
    if (startProgress < self.endProgress) {
        if (self.endProgress-startProgress<0.01) {
            
            startProgress=self.endProgress;
            
        }else{
            
            startProgress += 0.01;
        }
        
        self.progress = startProgress;
    }
    if (startProgress > self.endProgress) {
        
        if (startProgress-self.endProgress<0.01) {
            
            startProgress=self.endProgress;
            
        }else{
            
            startProgress -= 0.01;
        }
        self.progress = startProgress;
    }
    
    if (self.progress==_endProgress) {
        
        
       link.paused = YES;

    }
    
}


- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self setNeedsDisplay];
        
    });
    
}

-(void)dealloc{
    [link invalidate];
   link = nil;
    NSLog(@"dealloc");
}




@end
