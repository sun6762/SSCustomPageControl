//
//  SSPageCtrl.h
//  SSTagVC
//
//  Created by ruiyu on 2019/9/3.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSPageCtrl : UIView

@property (nonatomic, assign)NSInteger numberOfPages;          // default is 0
@property (nonatomic, assign)NSInteger currentPage;            // default is 0. value

@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UIImage *inactiveImage;

@property (nonatomic, assign) CGSize currentImageSize;
@property (nonatomic, assign) CGSize inactiveImageSize;

@end

NS_ASSUME_NONNULL_END
