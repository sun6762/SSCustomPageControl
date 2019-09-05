//
//  ViewController.m
//  SSTagVC
//
//  Created by ruiyu on 2019/9/3.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import "ViewController.h"
#import "MXYCustomPageControl.h"
#import "SSPageCtrl.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak)MXYCustomPageControl *pageCtrl;

@property (nonatomic, weak)SSPageCtrl *myPage;

@end

@implementation ViewController

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_pageCtrl sizeToFit];
    
    _pageCtrl.frame = CGRectMake(0, self.view.frame.size.height - 40, _pageCtrl.frame.size.width, 20);
    
    _myPage.frame = CGRectMake(0, self.view.frame.size.height - 70, _myPage.frame.size.width, 20);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    
    UICollectionView *coll = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flow];
    [self.view addSubview:coll];
    coll.backgroundColor = [UIColor whiteColor];
    coll.delegate = self;
    coll.dataSource = self;
    coll.bounces = NO;
    [coll registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ss_co"]; //
    coll.pagingEnabled = YES;
    coll.showsHorizontalScrollIndicator = NO;
    
    MXYCustomPageControl *pageCtrl = [[MXYCustomPageControl alloc]init];
    _pageCtrl = pageCtrl;
    [self.view addSubview:pageCtrl];
    pageCtrl.numberOfPages = 4;
    pageCtrl.currentPage = 0;
    pageCtrl.userInteractionEnabled = NO;
    pageCtrl.inactiveImage = [UIImage imageNamed:@"other_dot"];
    pageCtrl.inactiveImageSize = CGSizeMake(8, 8);
    pageCtrl.currentImage = [UIImage imageNamed:@"current_dot"];
    pageCtrl.currentImageSize = CGSizeMake(16, 8);
    //去掉系统自带样式
    pageCtrl.currentPageIndicatorTintColor = [UIColor clearColor];
    pageCtrl.pageIndicatorTintColor = [UIColor clearColor];
    
    
    SSPageCtrl *myPage = [SSPageCtrl new];
    _myPage = myPage;
    [self.view addSubview:myPage];
    myPage.numberOfPages = 4;
    myPage.inactiveImage = [UIImage imageNamed:@"other_dot"];
    myPage.inactiveImageSize = CGSizeMake(8, 8);
    myPage.currentImage = [UIImage imageNamed:@"current_dot"];
    myPage.currentImageSize = CGSizeMake(16, 8);
    myPage.frame = CGRectMake(0, self.view.frame.size.height - 70, _myPage.frame.size.width, 20);
    myPage.currentPage = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/(self.view.frame.size.width);
    _pageCtrl.currentPage = index;
    _myPage.currentPage = index;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ss_co" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256)/255.0) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1];
    return cell;
}



@end
