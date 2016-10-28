//
//  shishishi.m
//  试试
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCSegmentInterface.h"
#import "MJCBottomView.h"
#import "MJCTopView.h"
#import "MJCTitlesView.h"
#import "MJCChildScrollView.h"
#import "MJCRightView.h"
#import "MJCIndicatorView.h"


//标题栏宽度
//static const CGFloat MJCTitlesViewH = 50;
//static const CGFloat MJCNavMaxY = 64;
//static const CGFloat tabBarHeight = 50;


@interface MJCSegmentInterface ()<UIScrollViewDelegate>

///** 当前选中的标题按钮 */
@property (nonatomic, strong) UIButton *firstTitleButton;

/** 标题按钮底部的指示器 */
@property (nonatomic, strong) MJCIndicatorView *indicatorView;

/** 子界面UIScrollView */
@property (nonatomic, strong) MJCChildScrollView *scrollView;

/** 标题栏view */
@property (nonatomic, strong) MJCTitlesView *titlesView;

/** 顶部横线 */
@property (nonatomic,strong) MJCTopView *topView;
/** 底部横线 */
@property (nonatomic,strong) MJCBottomView *bottomView;

/** 右边竖线 */
@property (nonatomic,strong) MJCRightView *rightView;

/** 标题tabitem */
@property (nonatomic,strong) UIButton *titlesButton;


/** tabitem宽度 */
@property (nonatomic,assign) CGFloat btnW;
/** tabitemH */
@property (nonatomic,assign) CGFloat btnH;
/** tabitemX */
@property (nonatomic,assign) CGFloat btnX;


@end


@implementation MJCSegmentInterface

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //如果外界没有设置frame,那我们这里面要设置下
        self.frame = [UIScreen mainScreen].bounds;
        
        //实例化mainVC,为当前view创建一个mainVC
        _addChildViewController = [self viewController:self];
    }
    return self;
}

//给view加了一个UIViewController控制器
- (UIViewController *)viewController:(UIView *)view{
    
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    return nil;
}

#pragma mark -- 添加子控制器
-(void)setAddChildViewController:(UIViewController *)addChildViewController
{
    _addChildViewController = addChildViewController;
    
    //实例化mainVC,为当前view创建一个主控制器
    _addChildViewController = [self viewController:self];
    
    [_addChildViewController addChildViewController:addChildViewController];
    
    //添加子控制器的view
    [self addChildVcView];
}

/**
 *  !!!:添加子控制器的view
 */
- (void)addChildVcView
{
    
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    
    UIViewController *childVc = _addChildViewController.childViewControllers[index];
    
    if ([childVc isViewLoaded]) return;
    
    
    childVc.view.frame = self.scrollView.bounds;
    
    
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    
    _addChildViewController.automaticallyAdjustsScrollViewInsets = NO;
    

    MJCChildScrollView *scrollView = [[MJCChildScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor whiteColor];

    [self isChildViewframe:_isChildViewframe childViewframe:_childViewframe];

    scrollView.pagingEnabled = YES;

    scrollView.scrollEnabled = _childViewEnabled;

    scrollView.showsHorizontalScrollIndicator = NO;

    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
//    //    scrollView.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部
    scrollView.contentSize = CGSizeMake(scollViewArr.count * scrollView.mjc_width, 0);
    
    [self addSubview:scrollView];
}
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe
{
    _isChildViewframe = isChildViewframe;
    _childViewframe = childViewframe;
    
    [self.scrollView isChildFrame:isChildViewframe setChildFrame:childViewframe SegmentInterFaceStyle:_SegmentInterFaceStyle];
}


#pragma mark -- 标题栏设置创建
-(void)addTitlesArray:(NSArray *)titlesArray
{
    [self setScollViewArr:titlesArray];
    [self setupTitlesView];
    [self setupTitlesButton:titlesArray];
    [self setupTopView:_titlesView];
    [self setupBottomView:_titlesView];
    [self setupindicatorView:_titlesView];
}
#pragma mark -- 创建标题栏数据
-(void)setupTitlesView
{
    
    MJCTitlesView *titlesView = [[MJCTitlesView alloc] init];
    self.titlesView = titlesView;
    [self setuptitlesViewData:_titlesView];
    [self addSubview:titlesView];
}

-(void)setuptitlesViewData:(UIView *)titlesView
{
    [self isTitlesViewframe:_isTitlesViewframe titlesViewframe:_titlesViewframe];
    [self setTitlesViewColor:_titlesViewColor];
}
-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe
{
    _isTitlesViewframe = isTitlesViewframe;
    _titlesViewframe = titlesViewframe;
    [self.titlesView isTitlesViewframe:isTitlesViewframe titlesViewframe:titlesViewframe];
}
-(void)setTitlesViewColor:(UIColor *)titlesViewColor
{
    _titlesViewColor = titlesViewColor;
    [self.titlesView setTitlesViewColor:titlesViewColor SegmentInterFaceStyle:_SegmentInterFaceStyle];
}
#pragma mark -- 创建标题按钮数据
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    NSArray *titles = titlesArray;
    NSUInteger count = titles.count;
    CGFloat titleButtonW = _titlesView.mjc_width / count;
    self.btnW = titleButtonW;
    CGFloat titleButtonH = _titlesView.mjc_height;
    self.btnH = titleButtonH;
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = titleButton;
        titleButton.backgroundColor = [UIColor redColor];
        titleButton.tag = i;
        self.btnX = i * titleButtonW;
        [self setTabItemTitlesfont:_tabItemTitlesfont];
        [self setTabItemBackColor:_tabItemBackColor];
        [self setTabItemTitleNormalColor:_tabItemTitleNormalColor];
        [self setTabItemTitleSelectedColor:_tabItemTitleSelectedColor];
        [self setTabItemImageNormal:_tabItemImageNormal];
        [self setTabItemImageSelected:_tabItemImageSelected];
        [self setTabItemImageArray:titleButton buttonTag:i];
        [self isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame];
        [self setupRightView:i titlesArr:titles];
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_titlesView addSubview:titleButton];
    }
}

-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame
{
    _isTabItemFrame = isTabItemFrame;
    _tabItemFrame = tabItemFrame;
    
    if (_isTabItemFrame == kNilOptions) {
        self.titlesButton.frame = CGRectMake(self.btnX, 0, self.btnW, self.btnH);
        
    }else{
        self.titlesButton.frame = tabItemFrame;
    }

}

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _tabItemTitlesfont = tabItemTitlesfont;
    if (_tabItemTitlesfont == kNilOptions) {
        self.titlesButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }else{
        self.titlesButton.titleLabel.font = _tabItemTitlesfont;
    }
    
}

-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _tabItemBackColor = tabItemBackColor;
    if (_tabItemBackColor == kNilOptions) {
        
        if (self.SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse) {
            self.titlesButton.backgroundColor = [UIColor clearColor];
        }else if (self.SegmentInterFaceStyle == SegMentInterfaceStylePenetrate){
            self.titlesButton.backgroundColor = [UIColor clearColor];
        }else{
            self.titlesButton.backgroundColor = [UIColor whiteColor];
        }
    }else{
        
        self.titlesButton.backgroundColor = tabItemBackColor;
    }
}

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _tabItemTitleNormalColor = tabItemTitleNormalColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }
}

-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _tabItemTitleSelectedColor = tabItemTitleSelectedColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }
    
}
-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _tabItemImageNormal = tabItemImageNormal;
    
    if (_tabItemImageNormal == kNilOptions) {
        [self.titlesButton setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self.titlesButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    
    if (_tabItemImageSelected == kNilOptions) {
        [self.titlesButton setBackgroundImage:nil forState:UIControlStateSelected];
    }else{
        [self.titlesButton setBackgroundImage:tabItemImageSelected forState:UIControlStateSelected];
    }
}
-(void)setTabItemImageArray:(UIButton *)titleButton buttonTag:(NSUInteger)buttonTag
{
    if (_tabItemImageArray == kNilOptions) {
        //        [titleButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }else{
        [titleButton setBackgroundImage:[UIImage imageNamed:_tabItemImageArray[buttonTag]] forState:UIControlStateNormal];
    }
}

#pragma mark -- 右边竖线的设置创建
-(void)setupRightView:(NSUInteger)inter titlesArr:(NSArray *)titlesArr
{
    MJCRightView *rightView = [[MJCRightView alloc]init];
    self.rightView = rightView;

    [rightView setRightBackgroundColor:_rightColor];
    [rightView setRightHeght:_rightViewHegiht titlesButton:self.titlesButton];
    [_titlesButton addSubview:rightView];

    [rightView setRightViewHidden:_rightViewHidden setRightViewShow:_rightViewShow inter:inter titlesArr:titlesArr SegmentInterFaceStyle:_SegmentInterFaceStyle];
}


#pragma mark -- 顶部横线的设置创建
-(void)setupTopView:(UIView *)titleView
{
    
    MJCTopView *topView = [[MJCTopView alloc]init];
    self.topView = topView;
    [self setTopViewColor:_topViewColor];
    [self isTopViewFrame:_isTopViewFrame setTopViewFrame:_topViewFrame];
    [self setTopViewHidden:_topViewHidden];
    [titleView addSubview:topView];
}

-(void)setTopViewHidden:(BOOL)topViewHidden
{
    _topViewHidden = topViewHidden;
    [self.topView settopHidden:topViewHidden SegmentInterFaceStyle:_SegmentInterFaceStyle];
}

-(void)setTopViewColor:(UIColor *)topViewColor
{
    _topViewColor = topViewColor;
    [self.topView setTopBackgroundColor:topViewColor];
}

-(void)isTopViewFrame:(BOOL)isTopViewFrame setTopViewFrame:(CGRect)topViewFrame
{
    self.isTopViewFrame = isTopViewFrame;
    self.topViewFrame = topViewFrame;
    [self.topView isTopFrame:isTopViewFrame settopFrame:topViewFrame topHegiht:_topViewHegiht titlesView:self.titlesView];
}

#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIView *)titleView
{
    MJCBottomView *bottomView = [[MJCBottomView alloc]init];
    self.bottomView = bottomView;
    [self setBottomViewColor:_bottomViewColor];
    [self setBottomViewHidden:_bottomViewHidden];
    [self isBottomViewFrame:_isBottomViewFrame setBottomViewFrame:_bottomViewFrame];
    [titleView addSubview:bottomView];
}
-(void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _bottomViewHidden = bottomViewHidden;
    [self.bottomView setBottomHidden:bottomViewHidden SegmentInterFaceStyle:_SegmentInterFaceStyle];
    
}
-(void)setBottomViewColor:(UIColor *)bottomViewColor
{
    _bottomViewColor = bottomViewColor;
    [self.bottomView setBottomBackgroundColor:bottomViewColor];
}

-(void)isBottomViewFrame:(BOOL)isBottomViewFrame setBottomViewFrame:(CGRect)bottomViewFrame
{
    self.isBottomViewFrame = isBottomViewFrame;
    self.bottomViewFrame = bottomViewFrame;
    [self.bottomView isBottomFrame:isBottomViewFrame setBottomFrame:bottomViewFrame bottomHegiht:_bottomViewHegiht titlesView:self.titlesView];
}


#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    UIButton *firstTitleButton = _titlesView.subviews.firstObject;
    [firstTitleButton.titleLabel sizeToFit];
    firstTitleButton.selected = YES;
    self.firstTitleButton = firstTitleButton;
    MJCIndicatorView *indicatorView = [[MJCIndicatorView alloc] init];
    self.indicatorView = indicatorView;
    [self setIndicatorColor:_indicatorColor];
    [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
    [_titlesView addSubview:indicatorView];
    [indicatorView setIndicatorViewHidden:_indicatorHidden];
}
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame
{
    _isindicatorFrame = isindicatorFrame;
    _indicatorFrame = indicatorFrame;
    
    [self.indicatorView isindicatorFrame:isindicatorFrame indicatorFrame:indicatorFrame indicatorWidth:_indicatorWidth titlesView:_titlesView firstTitleButton:_firstTitleButton SegmentInterFaceStyle:_SegmentIndicatorStyle];
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    [self.indicatorView setIndicatorColor:indicatorColor firstTitleButton:self.firstTitleButton];
}

- (void)titleClick:(UIButton *)titleButton
{

    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    [UIView animateWithDuration:0.25 animations:^{
        [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
    }];
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.mjc_width;
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark -- <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    UIButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
    
    [self addChildVcView];
}



#pragma mark -- 工具方法
//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect1;
 
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    
    if (segmentInterface.SegmentInterFaceStyle == SegMentInterfaceStylePenetrate ) {
        CGRect rect = CGRectMake(0.0f, 0.0f, 0.3f, 0.3f);
        rect1 = rect;
    }else if (segmentInterface.SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
        CGRect rect = CGRectMake(0.0f, 0.0f, 0.3f, 0.3f);
        rect1 = rect;
    }else{
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        rect1 = rect;
    }
    
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect1);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*!
 *  通过16进制计算颜色
 *  16机制
 *  颜色对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}



@end
