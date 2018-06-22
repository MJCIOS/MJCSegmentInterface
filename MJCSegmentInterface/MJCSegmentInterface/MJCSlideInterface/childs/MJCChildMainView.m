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
@end
@implementation MJCChildMainView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
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
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _customChildBackView.frame = self.bounds;
}

-(void)setHostController:(UIViewController *)hostController
{
    _hostController = hostController;
}

-(void)setCustomChildBackView:(UIView *)customChildBackView
{
    _customChildBackView = customChildBackView;
    [self addSubview:customChildBackView];
}

-(void)setChildViewArray:(NSMutableArray *)childViewArray
{
    _childViewArray = childViewArray;
//    [self addChildVcView];
}

-(void)setChildControllerArray:(NSArray *)childControllerArray
{
    _childControllerArray = childControllerArray;
    if (_hostController.childViewControllers.count == 0) {
        for (int i = 0; i < _childControllerArray.count; i++) {
            [_hostController addChildViewController:_childControllerArray[i]];
        }
//        [self addChildVcView];//暂时没出啥问题,不删,
    }
}

- (void)addAllChildVcView;
{
    for (int i = 0 ; i < _hostController.childViewControllers.count; i++) {
        UIViewController *childVc;
        if (i >= _hostController.childViewControllers.count) {return;}
        childVc = _hostController.childViewControllers[i];
        if ([childVc isViewLoaded] && [childVc.view window]) return;
        CGFloat childVCX = i * self.bounds.size.width;
        childVc.view.frame = CGRectMake(childVCX, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
        [self addSubview:childVc.view];
    }
}

- (void)addChildVcView
{
    if (_hostController.childViewControllers.count != 0 || _childControllerArray.count != 0 || _childControllerArray != nil) {
        NSUInteger index = self.contentOffset.x / self.jc_width;
        UIViewController *childVc;
        if (index >= _hostController.childViewControllers.count) {return;}
        childVc = _hostController.childViewControllers[index];
        if ([childVc isViewLoaded] && [childVc.view window]) return;
        childVc.view.frame = self.bounds;
        [self addSubview:childVc.view];
        [self preloadNextControllerView:index];
    }else{
        if (_childViewArray.count != 0) {
            NSUInteger index = self.contentOffset.x / self.jc_width;
            UIView *childView =_childViewArray[index];
            if ([childView window]) return;
            childView.frame= self.bounds;
            [self addSubview:childView];
        }
    }
}

/**
 预加载选中页面左右两边页面
 */
- (void)preloadNextControllerView:(NSInteger)currentIndex {
    NSInteger nextIndex = currentIndex + 1;
    while (nextIndex > 0 && ABS(currentIndex - nextIndex <= 1)) {
        if (nextIndex >= _hostController.childViewControllers.count) {
            nextIndex = nextIndex - 2;
            continue;
        }
        UIViewController *childVc = _hostController.childViewControllers[nextIndex];
        if ([childVc isViewLoaded] && [childVc.view window]) return;
        CGFloat childVCX = nextIndex * self.bounds.size.width;
        childVc.view.frame = CGRectMake(childVCX, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
        [self addSubview:childVc.view];
        nextIndex = nextIndex - 2;
    }
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

-(void)setBouncesEnabled:(BOOL)bouncesEnabled
{
    _bouncesEnabled = bouncesEnabled;
    self.bounces = bouncesEnabled;
}

-(void)setupChildViewHeightisLoadDefaultChildVC:(BOOL)isLoadDefaultChildVC;
{
        if (isLoadDefaultChildVC == YES) {
            NSUInteger index = self.contentOffset.x/self.jc_width;
            if (index >= _hostController.childViewControllers.count) {return;}
            _childVC = _hostController.childViewControllers[index];
            _childVC.view.jc_height = self.bounds.size.height;
        }
}

-(void)removeFromSuperview
{
    [super removeFromSuperview];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0 ; i < _childViewArray.count; i++) {
        UIView *childView =  _childViewArray[i];
        [childView removeFromSuperview];
        childView = nil;
    }
    [_childViewArray removeAllObjects];
    _childViewArray = nil;
    NSInteger vcCount = _hostController.childViewControllers.count;
    for (int i = 0 ; i < vcCount; i++) {
        UIViewController *vc =  _hostController.childViewControllers[0];
        [vc removeFromParentViewController];
    }
}

@end
