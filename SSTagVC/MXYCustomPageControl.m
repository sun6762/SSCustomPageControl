//
//  MXYCustomPageControl.m
//  moxiaoyueReader
//
//  Created by ruiyu on 2019/8/18.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import "MXYCustomPageControl.h"
#define dotW 4.5
#define activeDotW 6
#define margin 3

@implementation MXYCustomPageControl

- (instancetype)init{
    self = [super init];
    if (self) {
//        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage{
    [super setCurrentPage:currentPage];
    
    [self updateDots];
     
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = margin + 5;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * (margin + self.inactiveImageSize.width) + self.currentImageSize.width + 100;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
}


- (void)updateDots{
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView *dot = [self imageViewForSubview:[self.subviews objectAtIndex:i] currPage:i];
        CGFloat marginX = margin + 5;
        
        if (i < self.currentPage){
            dot.image = self.inactiveImage;
            dot.frame = CGRectMake(i * (margin + self.inactiveImageSize.width), dot.frame.origin.y, self.inactiveImageSize.width, self.inactiveImageSize.height);
        }else if(i == self.currentPage){
            dot.image = self.currentImage;
            dot.frame = CGRectMake(i * (margin + self.inactiveImageSize.width), dot.frame.origin.y, self.currentImageSize.width, self.currentImageSize.height);
        }
        else{
            dot.image = self.inactiveImage;
            dot.frame = CGRectMake((i-1) * (margin + self.inactiveImageSize.width) + self.currentImageSize.width + margin, dot.frame.origin.y, self.inactiveImageSize.width, self.inactiveImageSize.height);
        } 
    }
    
}


- (UIImageView *)imageViewForSubview:(UIView *)view currPage:(int)currPage{
    UIImageView *dot = nil;
    if ([view isKindOfClass:[UIView class]]) {
        for (UIView *subview in view.subviews) {
            if ([subview isKindOfClass:[UIImageView class]]) {
                dot = (UIImageView *)subview;
                break;
            }
        }
        
        if (dot == nil) {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            
            [view addSubview:dot];
        }
    }else {
        dot = (UIImageView *)view;
    }
    
    return dot;
}
 

@end
