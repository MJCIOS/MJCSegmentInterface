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

static const CGFloat rightBottomMargin = 1;
static const CGFloat rightTopMargin = 1;
static const CGFloat rightMargin = 1;


@interface MJCSegmentInterface ()<UIScrollViewDelegate>


//第一个按钮
@property (nonatomic,strong) MJCTabItemButton *firstTitleButton;
/** 标题tabitem */
@property (nonatomic,strong) MJCTabItemButton *titlesButton;
/** 右边竖线 */
@property (nonatomic,strong) MJCRightView *rightView;



/** 标题按钮底部的指示器 */
@property (nonatomic, copy) MJCIndicatorView *indicatorView;

/** 子界面UIScrollView */
@property (nonatomic, copy) MJCChildScrollView *scrollView;

/** 标题栏view */
@property (nonatomic, copy) MJCTitlesView *titlesView;

/** 标题栏view */
@property (nonatomic, copy) MJCTitlesScollView *titlesScrollView;
/** 顶部横线 */
@property (nonatomic,copy) MJCTopView *topView;
/** 底部横线 */
@property (nonatomic,copy) MJCBottomView *bottomView;
/** 右边按钮 */
@property (nonatomic,copy) UIButton *rightMostButton;

/** tabitem宽度 */
@property (nonatomic,assign) CGFloat tabItemW;
/** tabitemH */
@property (nonatomic,assign) CGFloat tabItemH;
/** tabitemX */
@property (nonatomic,assign) CGFloat tabItemX;

@property (nonatomic,strong) UIViewController *viewController;


/** 界面滚动动画世界 */
@property (nonatomic,assign) NSTimeInterval scollAnimal;


/** 按钮tag值 */
@property (nonatomic,assign) NSUInteger btnTag;


/** 数组count */
@property (nonatomic,strong) NSArray *countArr;

@end


@implementation MJCSegmentInterface

//懒加载(因为数据只需要加载一次)
- (UIViewController*)viewController
{
    if (!_viewController) {
        _viewController = [[UIViewController  alloc]init];
    }
    return _viewController;
}

//懒加载(因为数据只需要加载一次)
- (MJCChildScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView = [[MJCChildScrollView  alloc]init];
    }
    return _scrollView;
}
- (MJCTitlesView*)titlesView
{
    if (!_titlesView) {
        _titlesView = [[MJCTitlesView  alloc]init];
    }
    return _titlesView;
}

/** 滚动标题 */
- (MJCTitlesScollView*)titlesScrollView
{
    if (!_titlesScrollView) {
        _titlesScrollView = [[MJCTitlesScollView  alloc]init];
    }
    return _titlesScrollView;
}

- (MJCTabItemButton*)firstTitleButton
{
    if (!_firstTitleButton) {
        if (_scrollTitlesEnabled == kNilOptions) {
            _firstTitleButton = self.titlesView.subviews.firstObject;
        }else{
            _firstTitleButton = self.titlesScrollView.subviews.firstObject;
        }
    }
    return _firstTitleButton;
}
- (MJCTabItemButton*)titlesButton
{
    if (!_titlesButton) {
        _titlesButton = [[MJCTabItemButton  alloc]init];
    }
    return _titlesButton;
}
- (MJCIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[MJCIndicatorView  alloc]init];
    }
    return _indicatorView;
}
- (MJCTopView*)topView
{
    if (!_topView) {
        _topView = [[MJCTopView  alloc]init];
    }
    return _topView;
}
- (MJCBottomView*)bottomView
{
    if (!_bottomView) {
        _bottomView = [[MJCBottomView  alloc]init];
    }
    return _bottomView;
}
- (MJCRightView*)rightView
{
    if (!_rightView) {
        _rightView = [[MJCRightView  alloc]init];
    }
    return _rightView;
}

- (UIButton*)rightMostButton
{
    if (!_rightMostButton) {
        _rightMostButton = [[UIButton  alloc]init];
    }
    return _rightMostButton;
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
-(void)intoChildViewController:(UIViewController *)childViewController;
{
    self.viewController = childViewController;
    self.viewController = [self viewController:self];
    [self.viewController addChildViewController:childViewController];
    [self addChildVcView];
}

- (void)addChildVcView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    _btnTag = index;
    
    UIViewController *childVc = self.viewController.childViewControllers[index];
    
    if ([childVc isViewLoaded]) return;
    
    if (self.viewController.edgesForExtendedLayout == UIRectEdgeNone) {
        childVc.view.frame = self.scrollView.bounds;
    }else{
        if (index == 0) {
            childVc.view.frame = CGRectMake(0,-64,MJCScreenWidth, MJCScreenHeight);
        }else{
            childVc.view.frame = self.scrollView.bounds;
        }
    }
    
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    self.viewController.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = _childViewEnabled;
    [self isChildViewframe:_isChildViewframe childViewframe:_childViewframe];
    self.scrollView.contentSize = CGSizeMake(scollViewArr.count * self.scrollView.mjc_width, 0);
    [self addSubview:self.scrollView];
}
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe
{
    _isChildViewframe = isChildViewframe;
    _childViewframe = childViewframe;
    [self.scrollView isChildFrame:isChildViewframe setChildFrame:childViewframe SegmentInterFaceStyle:_SegmentInterFaceStyle];
}
#pragma mark -- 标题栏设置创建
-(void)intoTitlesArray:(NSArray *)titlesArray
{
    _countArr = titlesArray;
    
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
#pragma mark -- 最右边按钮
-(void)setupRightButton
{
    [self.rightMostButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if (_childViewScollAnimal == YES) {
        _scollAnimal = 0.25;
    }else{
        _scollAnimal = 0;
    }

    [self setupRightData];
    
    [self addSubview:self.rightMostButton];
}

-(void)setupRightData
{
    
    if (_rightMostBtnColor == kNilOptions) {
        self.rightMostButton.backgroundColor = [UIColor clearColor];
    }else{
        self.rightMostButton.backgroundColor = _rightMostBtnColor;
    }
    
    if (_rightMostBtnShow == NO) {
        self.rightMostButton.hidden = YES;
    }else{
        self.rightMostButton.hidden = NO;
    }
    
    if (_rightMostBtnImage == kNilOptions) {
        [self.rightMostButton setImage:[UIImage imageNamed:@"向右箭头"] forState:UIControlStateNormal];
    }else{
        [self.rightMostButton setImage:_rightMostBtnImage forState:UIControlStateNormal];
    }
    
    
    [self isRigthMostFrame:_isrightMostBtnFrame rightMostBtnFrame:_rightMostBtnFrame];
    
    
}
-(void)isRigthMostFrame:(BOOL)isRigthMostFrame rightMostBtnFrame:(CGRect)rightMostBtnFrame;
{
    _isrightMostBtnFrame = isRigthMostFrame;
    _rightMostBtnFrame = rightMostBtnFrame;
    
    if (isRigthMostFrame == YES) {
        self.rightMostButton.frame = _rightMostBtnFrame;
    
    }else{
        
        CGFloat HEE = self.titlesButton.mjc_height - (rightTopMargin + rightBottomMargin);
        CGFloat WEE = self.titlesButton.mjc_width / 2 ;
        self.rightMostButton.frame = CGRectMake(MJCScreenWidth - WEE - rightMargin - _rightBtnRightMargin ,rightTopMargin +_rightBtnTopMargin ,WEE,HEE - _rightBtnBottomMargin);
    
    }
}


#pragma mark --创建滚动标题栏数据
-(void)setupScrollTitlesView
{
    [self setuptitleScrollViewData:self.titlesScrollView];
    
    [self addSubview:self.titlesScrollView];
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
    [self setuptitlesViewData:self.titlesView ];
    [self addSubview:self.titlesView ];
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
        self.tabItemW = _titlesView.mjc_width / titlesArray.count;
        self.tabItemH = _titlesView.mjc_height;
    }else{
        [self setTabItemWidth:_tabItemWidth];
        self.tabItemH = _titlesScrollView.mjc_height;
    }
    
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        
        MJCTabItemButton *tabbutton = [MJCTabItemButton buttonWithType:UIButtonTypeCustom];
        
        [tabbutton arraycount:i buttonW:_tabItemW buttonH:_tabItemH scrollTitlesEnabled:_scrollTitlesEnabled titlesScrollView:_titlesScrollView titlesView:_titlesView titlesArr:titlesArray imageStyle:_MJCImageEffectStyle];
        [tabbutton isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame];
        [tabbutton setTabItemTitlesfont:_tabItemTitlesfont];
        [tabbutton setTabItemBackColor:_tabItemBackColor SegmentInterFaceStyle:_SegmentInterFaceStyle];
        [tabbutton setTabItemTitleNormalColor:_tabItemTitleNormalColor];
        [tabbutton setTabItemTitleSelectedColor:_tabItemTitleSelectedColor];
        [tabbutton setTabItemImageNormal:_tabItemImageNormal];
        [tabbutton setTabItemImageSelected:_tabItemImageSelected];
        [tabbutton setTabItemNormalImageArray:_tabItemImageNormalArray buttonTag:i];
        [tabbutton setTabItemImageSelectedArray:_tabItemImageSelectedArray buttonTag:i];
        [tabbutton setTabItemBackImageNormal:_tabItemBackImageNormal];
        [tabbutton setTabItemBackImageSelected:_tabItemBackImageSelected];
        [tabbutton setTabItemNormalBackImageArray:_tabItemBackImageNormalArray buttonTag:i];
        [tabbutton setTabItemBackImageSelectedArray:_tabItemBackImageSelectedArray buttonTag:i];
        self.titlesButton = tabbutton;
        
        [self setupRightView:i titlesArr:titlesArray];
        [self.titlesButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.titlesScrollView.contentSize = CGSizeMake(titlesArray.count * _tabItemW, 0);
}

-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;
{
    _isTabItemFrame = isTabItemFrame;
    _tabItemFrame = tabItemFrame;
    [self.titlesButton isTabItemFrame:isTabItemFrame tabItemFrame:tabItemFrame];
}

//设置tabItem的宽度
-(void)setTabItemWidth:(CGFloat)tabItemWidth
{
    _tabItemWidth = tabItemWidth;

    if (_tabItemWidth == kNilOptions) {
        self.tabItemW = 100;
    }else{
        self.tabItemW = tabItemWidth;
    }
}

#pragma mark -- 右边竖线的设置创建
-(void)setupRightView:(NSUInteger)inter titlesArr:(NSArray *)titlesArr
{
    MJCRightView *rightView = [[MJCRightView alloc]init];
    self.rightView = rightView;
    [self.rightView setRightBackgroundColor:_rightColor];
    [self.rightView setRightHeght:_rightViewHegiht titlesButton:self.titlesButton];
    [self.titlesButton addSubview:self.rightView];
    [self.rightView setRightViewHidden:_rightViewHidden setRightViewShow:_rightViewShow inter:inter titlesArr:titlesArr SegmentInterFaceStyle:_SegmentInterFaceStyle];
}

#pragma mark -- 顶部横线的设置创建
-(void)setupTopView:(MJCTitlesView *)titleView
{
    [self setTopViewColor:_topViewColor];
    [self isTopViewFrame:_isTopViewFrame setTopViewFrame:_topViewFrame];
    [self setTopViewHidden:_topViewHidden];
    if (_scrollTitlesEnabled == kNilOptions) {
        
        [titleView addSubview:self.topView];
    }else{
        [_titlesScrollView addSubview:self.topView];
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
    [self setBottomViewColor:_bottomViewColor];
    [self setBottomViewHidden:_bottomViewHidden];
    [self isBottomViewFrame:_isBottomViewFrame setBottomViewFrame:_bottomViewFrame];
    if (_scrollTitlesEnabled == kNilOptions) {
        [titleView addSubview:self.bottomView];
    }else{
        [self.titlesScrollView addSubview:self.bottomView];
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
    
    [self.firstTitleButton.titleLabel sizeToFit];
    self.firstTitleButton.selected = YES;
    
    [self setIndicatorColor:_indicatorColor];
    [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
    if (_scrollTitlesEnabled == kNilOptions) {
        [titlesView addSubview:self.indicatorView];
    }else{
        [_titlesScrollView addSubview:self.indicatorView];
    }
    [self.indicatorView setIndicatorViewHidden:_indicatorHidden];
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
    
    [self isOpenJump:_isOpenJump mostLeftPosition:_mostLeftPosition mostRightPosition:_mostRightPosition];
    
    if (_isOpenJump == NO) {
        if ([self.slideDelegate respondsToSelector:@selector(mjc_MostClickEvent:segmentInterface:)]) {
            [self.slideDelegate mjc_MostClickEvent:_rightMostButton segmentInterface:self];
        }
        return;
    }
    
}


-(void)isOpenJump:(BOOL)isOpenJump mostLeftPosition:(UIImage *)mostLeftPosition mostRightPosition:(UIImage *)mostRightPosition
{
    _isOpenJump = isOpenJump;
    _mostLeftPosition = mostLeftPosition;
    _mostRightPosition = mostRightPosition;
    
    if (isOpenJump == YES) {
        
        CGFloat scrollViewWidth = _scrollView.contentSize.width;
        CGFloat scrollViewContentX = _scrollView.contentOffset.x;
        
        /**
         *最后一个子界面的X值的计算方法是:scrollview的宽度 - 整个屏幕的宽度,那就等于我们所想要的最后那个子界面的X值...
         *比如说一开始初始第一个界面X等于0.那就肯定是执行else后的那方法,一旦执行了里面的方法,我们就跳到最后一个子界面,那scrollViewX值也随之等于了
         *
         */
        //_scrollView的内边距X值一旦等于最后一个子界面的X值,那就会执行这个方法
        if(scrollViewContentX >= scrollViewWidth - MJCScreenWidth) {
            
            [UIView animateWithDuration:_scollAnimal animations:^{
                //这是回到第一个界面的方法
                CGPoint offset = self.scrollView.contentOffset;
                offset.x = 0;
                [self.scrollView setContentOffset:offset animated:NO];
            }];
            
            [self setupScollTitlesButton:_scrollView];
            
        }else { //如果是没有等于最后一个子界面的X值,那就执行这个方法
            
            //这是跳到最后一个界面的方法
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = self.titlesButton.tag * self.scrollView.mjc_width;
            [UIView animateWithDuration:_scollAnimal animations:^{
                [self.scrollView setContentOffset:offset animated:NO];
            }];
            
            [self setupScollTitlesButton:_scrollView];
        }

        return;
    }
    

}

//点击标题的点击事件
- (void)titleClick:(MJCTabItemButton *)titleButton
{

    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    
    if (_childViewScollAnimal == YES) {
        
        [UIView animateWithDuration:0.25 animations:^{
            [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
            self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        }];
        
        [UIView animateWithDuration:0.25 animations:^{
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = titleButton.tag * self.scrollView.mjc_width;
            [self.scrollView setContentOffset:offset animated:NO];
        }];
        
    }else{
        
        [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.mjc_width;
        [self.scrollView setContentOffset:offset animated:NO];
    }
    
    [self addChildVcView];
    
    [self setupTitleCenter:titleButton];
    
    if (_btnTag == (_countArr.count - 1)) {
        [self.rightMostButton setImage:_mostLeftPosition forState:UIControlStateNormal];
    }else{
        [self.rightMostButton setImage:_mostRightPosition forState:UIControlStateNormal];
    }


    if ([self.slideDelegate respondsToSelector:@selector(mjc_ClickEvent:segmentInterface:)]) {
    
        [self.slideDelegate mjc_ClickEvent:titleButton segmentInterface:self];
    
    }
    
}



#pragma mark -- <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupScollTitlesButton:scrollView];
    [self addChildVcView];

    if ([self.slideDelegate respondsToSelector:@selector(mjc_scrollDidEndDecelerating:segmentInterface:)]) {
        [self.slideDelegate mjc_scrollDidEndDecelerating:self.firstTitleButton segmentInterface:self];
    }
}


//设置滚动的时候的点击方法以及标题居中的方法
-(void)setupScollTitlesButton:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;

    if (_scrollTitlesEnabled == kNilOptions) {
        MJCTabItemButton *titleButton = self.titlesView.subviews[index];
        [self titleClick:titleButton];
        self.firstTitleButton = titleButton;
//        [self setupTitleCenter:titleButton];
    }else{
        MJCTabItemButton *titleButton = self.titlesScrollView.subviews[index];
        [self titleClick:titleButton];
        [self setupTitleCenter:titleButton];
        self.firstTitleButton = titleButton;
    }

}

//选中滚动标题居中效果的方法的效果
- (void)setupTitleCenter:(UIButton *)button
{
    // 本质:修改titleScrollView偏移量
    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth + _titleCenterMargin;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [self.titlesScrollView setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}


#pragma mark -- 工具方法



@end
