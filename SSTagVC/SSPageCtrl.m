//
//  SSPageCtrl.m
//  SSTagVC
//
//  Created by ruiyu on 2019/9/3.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import "SSPageCtrl.h"

static const CGFloat margin = 5;

@implementation SSPageCtrl

- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * (margin + self.inactiveImageSize.width) + self.currentImageSize.width;
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _numberOfPages = 0;
    _currentPage = 0;
}

#pragma mark -- UI --
- (void)createUI{
    for (int i = 0; i < _numberOfPages; i++) {
        @autoreleasepool {
            UIImageView *imgView = [UIImageView new];
            [self addSubview:imgView];
            if (i < _currentPage) {
                imgView.image = _inactiveImage;
                imgView.frame = CGRectMake(margin * i  + _inactiveImageSize.width * (i+1), (self.frame.size.height - _inactiveImageSize.height)*0.5, _inactiveImageSize.width, _inactiveImageSize.height);
            }else if (i == _currentPage) {
                imgView.image = _currentImage;
                imgView.frame = CGRectMake((margin + _inactiveImageSize.width)* (i-1) , (self.frame.size.height - + _currentImageSize.height)*0.5, + _currentImageSize.width, _currentImageSize.height);
            }else{
                imgView.image = _inactiveImage;
                imgView.frame = CGRectMake((margin + _inactiveImageSize.width)* i + _currentImageSize.width, (self.frame.size.height - _inactiveImageSize.height)*0.5, _inactiveImageSize.width, _inactiveImageSize.height);
            }
        }
    }
}

#pragma mark -- PRIVATE --
- (void)updateDots{
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView *dot = [self imageViewForSubview:[self.subviews objectAtIndex:i] currPage:i];
        
        if (i < self.currentPage){
            dot.image = self.inactiveImage;
            dot.frame = CGRectMake(i * (margin + self.inactiveImageSize.width), (self.frame.size.height - _inactiveImageSize.height)*0.5, self.inactiveImageSize.width, self.inactiveImageSize.height);
        }else if(i == self.currentPage){
            dot.image = self.currentImage;
            dot.frame = CGRectMake(i * (margin + self.inactiveImageSize.width), (self.frame.size.height - _inactiveImageSize.height)*0.5, self.currentImageSize.width, self.currentImageSize.height);
        }
        else{
            dot.image = self.inactiveImage;
            dot.frame = CGRectMake((i-1) * (margin + self.inactiveImageSize.width) + self.currentImageSize.width + margin, (self.frame.size.height - _inactiveImageSize.height)*0.5, self.inactiveImageSize.width, self.inactiveImageSize.height);
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

#pragma mark -- SET --
- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self createUI];
//    [self updateDots];
}

- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    
    [self updateDots];
}

#pragma mark -- EVENT --

#pragma mark -- delegate --

#pragma mark -- lazy --

@end
