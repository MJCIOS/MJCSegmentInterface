//
//  MJCSegmentInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教
//  新增了标题栏滑动功能

#import "MJCSegmentInterface.h"
#import "MJCBottomView.h"
#import "MJCTopView.h"
#import "MJCTitlesView.h"
#import "MJCChildScrollView.h"
#import "MJCRightView.h"
#import "MJCIndicatorView.h"
#import "MJCTitlesScollView.h"
#import "MJCTabItemButton.h"



@interface MJCSegmentInterface ()<UIScrollViewDelegate>

///** 当前选中的标题按钮 */
//@property (nonatomic, strong) UIButton *firstTitleButton;

/** rightButton */
@property (nonatomic,strong) UIButton *rightButton;

//第一个按钮
@property (nonatomic, strong) MJCTabItemButton *firstTitleButton;

/** 标题tabitem */
//@property (nonatomic,strong) UIButton *titlesButton;

@property (nonatomic,strong) MJCTabItemButton *titlesButton;


/** 标题按钮底部的指示器 */
@property (nonatomic, strong) MJCIndicatorView *indicatorView;

/** 子界面UIScrollView */
@property (nonatomic, strong) MJCChildScrollView *scrollView;

/** 标题栏view */
@property (nonatomic, strong) MJCTitlesView *titlesView;

/** 标题栏view */
@property (nonatomic, strong) MJCTitlesScollView *titlesScrollView;

/** 顶部横线 */
@property (nonatomic,strong) MJCTopView *topView;
/** 底部横线 */
@property (nonatomic,strong) MJCBottomView *bottomView;

/** 右边竖线 */
@property (nonatomic,strong) MJCRightView *rightView;



/** tabitem宽度 */
@property (nonatomic,assign) CGFloat btnW;
/** tabitemH */
@property (nonatomic,assign) CGFloat btnH;
/** tabitemX */
@property (nonatomic,assign) CGFloat btnX;


/** 右边按钮的遮挡物 */
@property (nonatomic,strong) UIView *rightMembraneView;
/** 主页面的遮挡物 */
@property (nonatomic,strong) UIView *mainShadeView;

@end


@implementation MJCSegmentInterface


//懒加载(因为数据只需要加载一次)
- (UIView *)mainShadeView
{
    if (!_mainShadeView) {
        _mainShadeView = [[UIView alloc]init];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_mainShadeView addGestureRecognizer:tapGesture];
        _mainShadeView.userInteractionEnabled = YES;
    }
    return _mainShadeView;
}
//懒加载(因为数据只需要加载一次)
- (UIView*)rightMembraneView
{
    if (!_rightMembraneView) {
        _rightMembraneView = [[UIView  alloc]init];
    }
    return _rightMembraneView;
}

//懒加载(因为数据只需要加载一次)
- (MJCChildScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView = [MJCChildScrollView  new];
    }
    return _scrollView;
}
- (UIButton*)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton  new];
    }
    return _rightButton;
}
- (MJCTabItemButton*)firstTitleButton
{
    if (!_firstTitleButton) {
        _firstTitleButton = [MJCTabItemButton  new];
    }
    return _firstTitleButton;
}
- (MJCTabItemButton*)titlesButton
{
    if (!_titlesButton) {
        _titlesButton = [MJCTabItemButton  new];
    }
    return _titlesButton;
}
- (MJCIndicatorView*)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [MJCIndicatorView  new];
    }
    return _indicatorView;
}
- (MJCTitlesView*)titlesView
{
    if (!_titlesView) {
        _titlesView = [MJCTitlesView  new];
    }
    return _titlesView;
}
- (MJCTitlesScollView*)titlesScrollView
{
    if (!_titlesScrollView) {
        _titlesScrollView = [MJCTitlesScollView  new];
    }
    return _titlesScrollView;
}
- (MJCTopView*)topView
{
    if (!_topView) {
        _topView = [MJCTopView  new];
    }
    return _topView;
}
- (MJCBottomView*)bottomView
{
    if (!_bottomView) {
        _bottomView = [MJCBottomView  new];
    }
    return _bottomView;
}
- (MJCRightView*)rightView
{
    if (!_rightView) {
        _rightView = [MJCRightView  new];
    }
    return _rightView;
}


//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //如果外界没有设置frame,那我们这里面要设置下
        self.frame = [UIScreen mainScreen].bounds;
        
    }
    return self;
}

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
    _addChildViewController = [self viewController:self];
    [_addChildViewController addChildViewController:addChildViewController];
    [self addChildVcView];
}
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
    scrollView.bounces = YES;
    scrollView.directionalLockEnabled = YES;
    //    scrollView.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部
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
    
    if (_scrollTitlesEnabled == kNilOptions) {
        [self setupTitlesView];
    }else{
        [self setupScrollTitlesView];
    }
    [self setupTitlesButton:titlesArray];
    
    [self setupTopView:_titlesView];
    [self setupBottomView:_titlesView];
    [self setupindicatorView:_titlesView];
    
    [self setupRightButton];
    
}

-(void)setupRightButton
{
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _rightButton.backgroundColor = [UIColor redColor];
    
    _rightButton.frame = CGRectMake(MJCScreenWidth - self.titlesButton.mjc_height-1,0,self.titlesButton.mjc_height,self.titlesButton.mjc_height);
    
    [self addSubview:_rightButton];

}



#pragma mark --创建滚动标题栏数据
-(void)setupScrollTitlesView
{
    MJCTitlesScollView *titleScrollView = [[MJCTitlesScollView alloc] init];
    _titlesScrollView = titleScrollView;
    
    [self setuptitleScrollViewData:titleScrollView];
    
    titleScrollView.showsVerticalScrollIndicator = NO;
    titleScrollView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:titleScrollView];
}
-(void)setuptitleScrollViewData:(MJCTitlesScollView *)titleScrollView
{
    [self isTitlesScrollframe:_isTitleScrollframe titlesScrollframe:_titleScrollframe];
    
    [self setTitleScrollColor:_titleScrollColor];
}
-(void)isTitlesScrollframe:(BOOL)isTitlesScrollframe titlesScrollframe:(CGRect)titlesScrollframe;
{
    _isTitleScrollframe = isTitlesScrollframe;
    _titleScrollframe = titlesScrollframe;
    
    [self.titlesScrollView isTitlesScrollViewframe:isTitlesScrollframe titlesViewframe:titlesScrollframe];
    
}
-(void)setTitleScrollColor:(UIColor *)titleScrollColor
{
    _titleScrollColor = titleScrollColor;
    [self.titlesScrollView setTitlesScrollViewColor:titleScrollColor SegmentInterFaceStyle:_SegmentInterFaceStyle];
    
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
    if (_scrollTitlesEnabled == kNilOptions) {
        self.btnW = _titlesView.mjc_width / titlesArray.count;
        self.btnH = _titlesView.mjc_height;
    }else{
        [self setTabItemWidth:_tabItemWidth];
        self.btnH = _titlesScrollView.mjc_height;
    }
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        MJCTabItemButton *tabbutton = [MJCTabItemButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = tabbutton;
        [tabbutton setTitle:titlesArray[i] forState:UIControlStateNormal];
        [tabbutton arraycount:i buttonW:_btnW buttonH:_btnH scrollTitlesEnabled:_scrollTitlesEnabled titlesScrollView:_titlesScrollView titlesView:_titlesView isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame tabItemTitlesfont:_tabItemTitlesfont SegmentInterFaceStyle:_SegmentInterFaceStyle tabItemBackColor:_tabItemBackColor tabItemTitleNormalColor:_tabItemTitleNormalColor tabItemTitleSelectedColor:_tabItemTitleSelectedColor tabItemImageNormal:_tabItemImageNormal tabItemImageSelected:_tabItemImageSelected tabItemNormalImageArray:_tabItemImageNormalArray tabItemImageSelectedArray:_tabItemImageSelectedArray];
        [self isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame];
        [self setupRightView:i titlesArr:titlesArray];
        [tabbutton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    self.titlesScrollView.contentSize = CGSizeMake(titlesArray.count * _btnW, 0);
}
-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;
{
    _isTabItemFrame = isTabItemFrame;
    _tabItemFrame = tabItemFrame;
    [_titlesButton isTabItemFrame:isTabItemFrame tabItemFrame:tabItemFrame];
}

//设置tabItem的宽度
-(void)setTabItemWidth:(CGFloat)tabItemWidth
{
    _tabItemWidth = tabItemWidth;

    if (_tabItemWidth == kNilOptions) {
        self.btnW = MJCTabitemW;
    }else{
        self.btnW = tabItemWidth;
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
-(void)setupTopView:(MJCTitlesView *)titleView
{
    MJCTopView *topView = [[MJCTopView alloc]init];
    self.topView = topView;
    [self setTopViewColor:_topViewColor];
    [self isTopViewFrame:_isTopViewFrame setTopViewFrame:_topViewFrame];
    [self setTopViewHidden:_topViewHidden];
    if (_scrollTitlesEnabled == kNilOptions) {
        // !!!:添加标题栏
        [titleView addSubview:topView];
    }else{
        [_titlesScrollView addSubview:topView];
    }

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
    
    if (_scrollTitlesEnabled == kNilOptions) {
        [self.topView isTopFrame:isTopViewFrame settopFrame:topViewFrame topHegiht:_topViewHegiht titlesView:self.titlesView];
    }else{
        [self.topView isTopFrame:isTopViewFrame settopFrame:topViewFrame topHegiht:_topViewHegiht titlesScroll:_titlesScrollView];
    }
}

#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIView *)titleView
{
    MJCBottomView *bottomView = [[MJCBottomView alloc]init];
    self.bottomView = bottomView;
    [self setBottomViewColor:_bottomViewColor];
    [self setBottomViewHidden:_bottomViewHidden];
    [self isBottomViewFrame:_isBottomViewFrame setBottomViewFrame:_bottomViewFrame];
    if (_scrollTitlesEnabled == kNilOptions) {
        [titleView addSubview:bottomView];
    }else{
        [_titlesScrollView addSubview:bottomView];
    }

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
    
    if (_scrollTitlesEnabled ==kNilOptions) {
        [self.bottomView isBottomFrame:isBottomViewFrame setBottomFrame:bottomViewFrame bottomHegiht:_bottomViewHegiht titlesView:self.titlesView];
    }else{
        [self.bottomView isBottomFrame:isBottomViewFrame setBottomFrame:bottomViewFrame bottomHegiht:_bottomViewHegiht titlesScroll:_titlesScrollView];
    }
}

#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    if (_scrollTitlesEnabled == kNilOptions) {
        MJCTabItemButton *firstTitleButton = _titlesView.subviews.firstObject;
        self.firstTitleButton = firstTitleButton;
    }else{
        MJCTabItemButton *firstTitleButton = _titlesScrollView.subviews.firstObject;
        self.firstTitleButton = firstTitleButton;
    }
    [_firstTitleButton.titleLabel sizeToFit];
    _firstTitleButton.selected = YES;
    MJCIndicatorView *indicatorView = [[MJCIndicatorView alloc] init];
    self.indicatorView = indicatorView;
    [self setIndicatorColor:_indicatorColor];
    [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
    if (_scrollTitlesEnabled == kNilOptions) {
        [titlesView addSubview:indicatorView];
    }else{
        [_titlesScrollView addSubview:indicatorView];
    }
    [indicatorView setIndicatorViewHidden:_indicatorHidden];
}
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame
{
    _isindicatorFrame = isindicatorFrame;
    _indicatorFrame = indicatorFrame;
    
    if (_scrollTitlesEnabled == kNilOptions) {
        [self.indicatorView isindicatorFrame:isindicatorFrame indicatorFrame:indicatorFrame indicatorWidth:_indicatorWidth titlesView:_titlesView firstTitleButton:_firstTitleButton SegmentInterFaceStyle:_SegmentIndicatorStyle];
    }else{
        [self.indicatorView isindicatorFrame:isindicatorFrame indicatorFrame:indicatorFrame indicatorWidth:_indicatorWidth titlesScroll:_titlesScrollView firstTitleButton:_firstTitleButton SegmentInterFaceStyle:_SegmentIndicatorStyle];
    }
    
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    [self.indicatorView setIndicatorColor:indicatorColor firstTitleButton:self.firstTitleButton];
}


//右边按钮的点击事件
- (void)rightClick:(UIButton *)button
{
    CGFloat scrollViewWidth = _scrollView.contentSize.width;
    CGFloat scrollViewContentX = _scrollView.contentOffset.x;
    
    _rightButton.enabled = NO;
    
    self.rightMembraneView.frame = MJCScreenbound;
    self.rightMembraneView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.rightMembraneView];
    
    /**
     *最后一个子界面的X值的计算方法是:scrollview的宽度 - 整个屏幕的宽度,那就等于我们所想要的最后那个子界面的X值...
     *比如说一开始初始第一个界面X等于0.那就肯定是执行else后的那方法,一旦执行了里面的方法,我们就跳到最后一个子界面,那scrollViewX值也随之等于了
     *
     */
    //_scrollView的内边距X值一旦等于最后一个子界面的X值,那就会执行这个方法
    if(scrollViewContentX >= scrollViewWidth - MJCScreenWidth) {
        //这是回到第一个界面的方法
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = 0;
        [self.scrollView setContentOffset:offset animated:YES];
    }else { //如果是没有等于最后一个子界面的X值,那就执行这个方法
        
        //这是跳到最后一个界面的方法
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = self.titlesButton.tag * self.scrollView.mjc_width;
        [self.scrollView setContentOffset:offset animated:YES];
        
    }
}

//点击标题的点击事件
- (void)titleClick:(MJCTabItemButton *)titleButton
{
    self.mainShadeView.frame = MJCScreenbound;
    self.mainShadeView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.mainShadeView];

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
    
    [self setupTitleCenter:titleButton];
}

//手势方法
-(void)tap
{
    //    [NSThread sleepForTimeInterval:0.05];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.mainShadeView removeFromSuperview];
    });
}

#pragma mark -- <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.rightButton.enabled = NO;
}

/**
 * 在scrollView滚动动画结束时, 点击按钮动画滚动结束时,就会调用这个方法
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    [self setupScollTitlesButton:scrollView];
    
    [self addChildVcView];
    
    [self.mainShadeView removeFromSuperview];
    
    [self setupMembrane];
    
    if ([self.slideDelegate respondsToSelector:@selector(mjc_ScrollViewDidEndScrollingAnimation:)]) {
        [self.slideDelegate mjc_ScrollViewDidEndScrollingAnimation:self];
    }
    
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupScollTitlesButton:scrollView];
    
    [self addChildVcView];
    
    //销毁
    [self.mainShadeView removeFromSuperview];

    if ([self.slideDelegate respondsToSelector:@selector(mjc_scrollViewDidEndDecelerating:)]) {
        [self.slideDelegate mjc_scrollViewDidEndDecelerating:self];
    }
    
}

//设置滚动的时候的点击方法以及标题居中的方法
-(void)setupScollTitlesButton:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    if (_scrollTitlesEnabled == kNilOptions) {
        MJCTabItemButton *titleButton = self.titlesView.subviews[index];
        [self titleClick:titleButton];
        [self setupTitleCenter:titleButton];
    }else{
        MJCTabItemButton *titleButton = self.titlesScrollView.subviews[index];
        [self titleClick:titleButton];
        [self setupTitleCenter:titleButton];
    }

}
//选中标题居中效果的方法的效果
- (void)setupTitleCenter:(UIButton *)button
{
    // 本质:修改titleScrollView偏移量
    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [self.titlesScrollView setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}

//设置遮挡物
-(void)setupMembrane
{
    CGFloat scrollViewWidth = _scrollView.contentSize.width;
    CGFloat scrollViewContentX = _scrollView.contentOffset.x;
    if(scrollViewContentX <= scrollViewWidth - MJCScreenWidth) {
        [self.rightMembraneView removeFromSuperview];
        _rightButton.enabled = YES;
        return;
    }
    if (scrollViewContentX == 0) {
        [self.rightMembraneView removeFromSuperview];
        return;
    }

}


#pragma mark -- 工具方法
// 图片转换颜色
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect1;
 
    if (_SegmentInterFaceStyle == SegMentInterfaceStylePenetrate ) {
        CGRect rect = CGRectMake(0.0f, 0.0f, 0.3f, 0.3f);
        rect1 = rect;
    }else if (_SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse){
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
