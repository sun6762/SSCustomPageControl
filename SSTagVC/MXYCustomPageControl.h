//
//  MXYCustomPageControl.h
//  moxiaoyueReader
//
//  Created by ruiyu on 2019/8/18.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MXYCustomPageControl : UIPageControl

@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UIImage *inactiveImage;

@property (nonatomic, assign) CGSize currentImageSize;
@property (nonatomic, assign) CGSize inactiveImageSize;

@end

NS_ASSUME_NONNULL_END
