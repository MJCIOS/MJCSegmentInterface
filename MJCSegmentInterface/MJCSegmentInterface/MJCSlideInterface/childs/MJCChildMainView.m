//
//  MJCChildScrollView.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCChildMainView.h"
#import "UIView+MJCClassExtension.h"

static CGFloat const animalTime= 0.25;
@interface MJCChildMainView ()
@property (nonatomic,weak) UIViewController *childVC;
@property (nonatomic,strong) NSArray *titlesArr;

@property (nonatomic,strong) NSArray  *vcArr;

@end
@implementation MJCChildMainView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = YES;
        self.scrollEnabled = YES;
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = YES;
    self.scrollEnabled = YES;
}

-(void)setHostController:(UIViewController *)hostController
{
    _hostController = hostController;
}

-(void)setChildControllerArray:(NSArray *)childControllerArray
{
    _childControllerArray = childControllerArray;
    if (_hostController.childViewControllers.count == 0) {
        for (int i = 0; i < _childControllerArray.count; i++) {
            [_hostController addChildViewController:_childControllerArray[i]];
        }
//        [self addChildVcView];//暂时没出啥问题,不删,,
    }
}
- (void)addChildVcView
{
    NSUInteger index = self.contentOffset.x / self.jc_width;
    UIViewController *childVc;
    if (index >= _hostController.childViewControllers.count) {return;}
    childVc = _hostController.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = self.bounds;
    [self addSubview:childVc.view];
}
-(void)setTitlesTabItem:(MJCTabItem *)titlesTabItem
{
    _titlesTabItem = titlesTabItem;
    if (_isChildScollAnimal == YES) {
        [UIView animateWithDuration:animalTime animations:^{
            CGPoint offset = self.contentOffset;
            offset.x = titlesTabItem.tag * self.jc_width;
            [self setContentOffset:offset animated:NO];
        }];
    }else{
        CGPoint offset = self.contentOffset;
        offset.x = titlesTabItem.tag * self.jc_width;
        [self setContentOffset:offset animated:NO];
    }
}
-(void)setupContenSizeWithTitlesArr:(NSArray *)titlesArr mainView:(UIView*)mainView;
{
    _titlesArr = titlesArr;
    self.contentSize = CGSizeMake(titlesArr.count * mainView.frame.size.width,0);
}
-(void)setIsChildScollAnimal:(BOOL)isChildScollAnimal
{
    _isChildScollAnimal = isChildScollAnimal;
}
-(void)setIsChildScollEnabled:(BOOL)isChildScollEnabled
{
    _isChildScollEnabled = isChildScollEnabled;
    self.scrollEnabled = isChildScollEnabled;
}
-(void)setupChildViewHeightisLoadDefaultChildVC:(BOOL)isLoadDefaultChildVC;
{
    if (isLoadDefaultChildVC == YES) {
//                dispatch_async(dispatch_get_main_queue(), ^{
        NSUInteger index = self.contentOffset.x/self.jc_width;
        if (index >= _hostController.childViewControllers.count) {return;}
        _childVC = _hostController.childViewControllers[index];
        _childVC.view.jc_height = self.bounds.size.height;
//                });
    }
}
@end
