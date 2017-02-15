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
#import "MJCVerticalLineView.h"
#import "MJCIndicatorView.h"
#import "MJCTitlesScollView.h"
#import "MJCTabItemButton.h"

static const CGFloat rightBottomMargin = 1;
static const CGFloat rightTopMargin = 1;
static const CGFloat rightMargin = 1;

@interface MJCSegmentInterface ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIViewController *viewController;

//第一个按钮
@property (nonatomic,strong) MJCTabItemButton *firstTitleButton;
/** 标题tabitem */
@property (nonatomic,strong) MJCTabItemButton *titlesButton;
/** 右边竖线 */
@property (nonatomic,strong) MJCVerticalLineView *verticalLineView;

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

@property (nonatomic, strong) NSMutableArray *titleButtons;

/** tabitem宽度 */
@property (nonatomic,assign) CGFloat tabItemW;
/** tabitemH */
@property (nonatomic,assign) CGFloat tabItemH;



/** 界面滚动动画时间 */
@property (nonatomic,assign) NSTimeInterval scollAnimal;

/** 按钮tag值 */
@property (nonatomic,assign) NSUInteger btnTag;

/** 数组count */
@property (nonatomic,strong) NSArray *countArr;


#pragma mark -- 重要属性
/** 是否开启用户自己设置子控制器视图界面的frame */
@property(nonatomic,getter = isChildViewframe) BOOL isChildViewframe;

/** 是否自己设置滚动标题栏的frame */
@property(nonatomic,getter = isTitleScrollframe) BOOL isTitleScrollframe;

/** 是否自己设置标题栏的frame */
@property(nonatomic,getter = isTitlesViewframe) BOOL isTitlesViewframe;

/** 是否开启用户修改底部指示器frame */
@property (nonatomic,getter=isindicatorFrame) BOOL isindicatorFrame;

/** 是否开启用户改动顶部线条Frame */
@property (nonatomic,getter=isTopViewFrame) BOOL isTopViewFrame;

/** 是否开启用户改动底部线条Frame */
@property (nonatomic,getter=isBottomViewFrame) BOOL isBottomViewFrame;

/** tabItem的位置(是否开启用户修改tabItem的位置) */
@property (nonatomic,getter=isRightMostBtnFrame) BOOL isRightMostBtnFrame;


@end


@implementation MJCSegmentInterface

- (NSMutableArray *)titleButtons
{
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (UIViewController*)viewController
{
    if (!_viewController) {
        _viewController = [[UIViewController  alloc]init];
    }
    return _viewController;
}

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
        if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
            _firstTitleButton = self.titlesView.subviews[_selectedSegmentIndex];
        }else{
            _firstTitleButton = self.titlesScrollView.subviews[_selectedSegmentIndex];
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
- (MJCVerticalLineView *)verticalLineView
{
    if (!_verticalLineView) {
        _verticalLineView = [[MJCVerticalLineView  alloc]init];
    }
    return _verticalLineView;
}

- (UIButton*)rightMostButton
{
    if (!_rightMostButton) {
        _rightMostButton = [[UIButton  alloc]init];
          _rightMostButton.adjustsImageWhenHighlighted = NO;
    }
    return _rightMostButton;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        
        [self setupData];
        
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupData];
}

-(void)setupData
{
    if (_childViewScollAnimal == YES) {
        _scollAnimal = 0.25;
    }else{
        _scollAnimal = 0;
    }
    _selectedSegmentIndex = 0;
    self.tabItemWidth = 100;
    self.verticalLineHidden = YES;
    self.topViewHidden = YES;
    self.bottomViewHidden = YES;
    self.titlesViewframe = CGRectMake(0,0,MJCScreenWidth, 50);
    self.titleScrollframe = CGRectMake(0,0,MJCScreenWidth, 50);
    self.tabItemTitleNormalColor = [UIColor darkGrayColor];
    self.tabItemTitleSelectedColor = [UIColor blackColor];
    self.tabItemTitlesfont = [UIFont systemFontOfSize:14];
}

+ (instancetype)segmentinitWithFrame:(CGRect)frame MJCSeMentTitleBarStyle:(MJCSeMentTitleBarStyles)MJCSeMentTitleBarStyle
{
    MJCSegmentInterface *interFaceView = [[self alloc] initWithFrame:frame];
    interFaceView.MJCSeMentTitleBarStyle = MJCSeMentTitleBarStyle;

    return interFaceView;
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
    self.scrollView.scrollEnabled = _childScollEnabled;
    
    [self.scrollView setupChildFrame:_childViewframe titlesViewFrame:_titlesViewframe titlesScrollFrame:_titleScrollframe MJCSeMentTitleBarStyle:_MJCSeMentTitleBarStyle];
    
    self.scrollView.contentSize = CGSizeMake(scollViewArr.count * self.scrollView.mjc_width, 0);
    [self addSubview:self.scrollView];
}

-(void)setChildViewframe:(CGRect)childViewframe
{
    _childViewframe = childViewframe;
    self.scrollView.childFrame = childViewframe;
}

#pragma mark -- 标题栏设置创建
-(void)intoTitlesArray:(NSArray *)titlesArray
{
    _countArr = titlesArray;
    
    [self setScollViewArr:titlesArray];
    
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
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
    [self setupRightData];
    
    [self.rightMostButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    [self isRigthMostFrame:_isRightMostBtnFrame rightMostBtnFrame:_rightMostBtnFrame];
}

-(void)setRightMostBtnImage:(UIImage *)rightMostBtnImage
{
    _rightMostBtnImage = rightMostBtnImage;
    [self.rightMostButton setImage:_rightMostBtnImage forState:UIControlStateNormal];
}

-(void)setRightMostBtnFrame:(CGRect)rightMostBtnFrame
{
    _rightMostBtnFrame = rightMostBtnFrame;
    _isRightMostBtnFrame = YES;
}

-(void)isRigthMostFrame:(BOOL)isRigthMostFrame rightMostBtnFrame:(CGRect)rightMostBtnFrame;
{
    _isRightMostBtnFrame = isRigthMostFrame;
    _rightMostBtnFrame = rightMostBtnFrame;
    
    if (isRigthMostFrame == YES) {
        self.rightMostButton.frame = _rightMostBtnFrame;
    }else{
        
        if (_MJCSeMentTitleBarStyle == MJCSegMentTitlesScrollStyle) {
            
            CGFloat rightMostH = self.titlesButton.mjc_height - (rightTopMargin + rightBottomMargin);
            CGFloat rightMostW = self.titlesButton.mjc_width / 2 ;
            CGFloat rightBtnY = self.titlesScrollView.mjc_y + 1;
            
            self.rightMostButton.frame = CGRectMake(MJCScreenWidth - rightMostW - rightMargin,rightBtnY,rightMostW,rightMostH);
            
        }else if (_MJCSeMentTitleBarStyle == MJCSegMentTitlesClassicStyle){
            
            CGFloat rightMostH = self.titlesButton.mjc_height - (rightTopMargin + rightBottomMargin);
            CGFloat rightMostW = self.titlesButton.mjc_width / 2 ;
            
            CGFloat rightBtnY = self.titlesView.mjc_y + 1;
            
            self.rightMostButton.frame = CGRectMake(MJCScreenWidth - rightMostW - rightMargin,rightBtnY,rightMostW,rightMostH);
        
        }else{
        
            CGFloat HEE = self.titlesButton.mjc_height - (rightTopMargin + rightBottomMargin);
            CGFloat WEE = self.titlesButton.mjc_width / 2 ;
            
            self.rightMostButton.frame = CGRectMake(MJCScreenWidth - WEE - rightMargin,65,WEE,HEE);
        
        }
        
    }
}
#pragma mark --创建滚动标题栏数据
-(void)setupScrollTitlesView
{
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesNavBarStyle) {
        [self addSubview:self.titlesScrollView];
        return;
    }
}

-(void)setTitleScrollColor:(UIColor *)titleScrollColor
{
    _titleScrollColor = titleScrollColor;
    
    self.titlesScrollView.titlesScrollColor = titleScrollColor;
}
-(void)setTitleScrollframe:(CGRect)titleScrollframe
{
    _titleScrollframe = titleScrollframe;
    self.titlesScrollView.titlesScrollFrame = titleScrollframe;
}
#pragma mark -- 创建标题栏数据
-(void)setupTitlesView
{
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesNavBarStyle) {
        [self addSubview:self.titlesView];
        return;
    }
}
-(void)setTitlesViewframe:(CGRect)titlesViewframe
{
    _titlesViewframe = titlesViewframe;
    
    self.titlesView.titlesViewFrame = titlesViewframe;
}

-(void)setTitlesViewColor:(UIColor *)titlesViewColor
{
    _titlesViewColor = titlesViewColor;
    self.titlesView.titlesViewColor = titlesViewColor;
    
}

#pragma mark -- 创建标题按钮数据
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
        self.tabItemW = _titlesView.mjc_width / titlesArray.count;
        self.tabItemH = _titlesView.mjc_height;
    }else{
        [self setTabItemWidth:_tabItemWidth];
        self.tabItemH = _titlesScrollView.mjc_height;
    }
    
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        
        MJCTabItemButton *tabbutton = [MJCTabItemButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = tabbutton;
        
        // 把标题按钮保存到对应的数组
        [self.titleButtons addObject:tabbutton];

        
        [tabbutton arraycount:i buttonW:_tabItemW buttonH:_tabItemH titlesScrollView:_titlesScrollView titlesView:_titlesView titlesArr:titlesArray imageStyle:_MJCImageEffectStyle MJCSeMentTitleBarStyle:_MJCSeMentTitleBarStyle];
        
        tabbutton.tabItemTitlesfont = _tabItemTitlesfont;
        tabbutton.tabItemBackColor = _tabItemBackColor;
        tabbutton.tabItemTitleNormalColor = _tabItemTitleNormalColor;
        tabbutton.tabItemTitleSelectedColor = _tabItemTitleSelectedColor;
        tabbutton.tabItemImageNormal = _tabItemImageNormal;
        tabbutton.tabItemImageSelected = _tabItemImageSelected;
        tabbutton.tabItemBackImageNormal = _tabItemBackImageNormal;
        tabbutton.tabItemBackImageSelected = _tabItemBackImageSelected;
        [tabbutton setupTabItemNormalBackImageArray:_tabItemBackImageNormalArray buttonTag:i];
        [tabbutton setupTabItemBackImageSelectedArray:_tabItemBackImageSelectedArray buttonTag:i];
        [tabbutton setupTabItemNormalImageArray:_tabItemImageNormalArray buttonTag:i];
        [tabbutton setupTabItemImageSelectedArray:_tabItemImageSelectedArray buttonTag:i];
        
        [self.titlesButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setupRightView:i titlesArr:titlesArray];
    }
    
    self.titlesScrollView.contentSize = CGSizeMake(titlesArray.count * _tabItemW, 0);
}

//设置tabItem的宽度
-(void)setTabItemWidth:(CGFloat)tabItemWidth
{
    _tabItemWidth = tabItemWidth;
    self.tabItemW = tabItemWidth;
}

#pragma mark -- 右边竖线的设置创建
-(void)setupRightView:(NSUInteger)inter titlesArr:(NSArray *)titlesArr
{
    MJCVerticalLineView *verticalLineView = [[MJCVerticalLineView alloc]init];
    self.verticalLineView = verticalLineView;
    verticalLineView.rightBackgroundColor = _verticalLineColor;
    [self.verticalLineView setupRightHeght:_verticalLineHegiht titlesButton:self.titlesButton];
    [self.verticalLineView inter:inter titlesArr:titlesArr rightViewHidden:_verticalLineHidden];
    [self.titlesButton addSubview:verticalLineView];
}

#pragma mark -- 顶部横线的设置创建
-(void)setupTopView:(MJCTitlesView *)titleView
{
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
        self.topView.titlesView = self.titlesView;
        [titleView addSubview:self.topView];
    }else{
        self.topView.titlesScrollView = self.titlesScrollView;
        [_titlesScrollView addSubview:self.topView];
    }
}
-(void)setTopViewHidden:(BOOL)topViewHidden
{
    _topViewHidden = topViewHidden;
    self.topView.topHidden = topViewHidden;
}

-(void)setTopViewColor:(UIColor *)topViewColor
{
    _topViewColor = topViewColor;
    self.topView.topBackgroundColor = topViewColor;
}

-(void)setTopViewHegiht:(CGFloat)topViewHegiht
{
    _topViewHegiht = topViewHegiht;
    self.topView.topHeight = topViewHegiht;
}

-(void)setTopViewFrame:(CGRect)topViewFrame
{
    _topViewFrame = topViewFrame;
    self.topView.topFrame = topViewFrame;
}

#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIView *)titleView
{
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
        self.bottomView.titlesView = self.titlesView;
        [titleView addSubview:self.bottomView];
    }else{
        self.bottomView.titlesScrollView = self.titlesScrollView;
        [self.titlesScrollView addSubview:self.bottomView];
    }
}

-(void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _bottomViewHidden = bottomViewHidden;
    self.bottomView.bottomHidden = bottomViewHidden;
}
-(void)setBottomViewColor:(UIColor *)bottomViewColor
{
    _bottomViewColor = bottomViewColor;
    self.bottomView.bottomBackgroundColor = bottomViewColor;
}

-(void)setBottomViewFrame:(CGRect)bottomViewFrame
{
    _bottomViewFrame = bottomViewFrame;
    self.bottomView.bottomFrame = bottomViewFrame;
}
-(void)setBottomViewHegiht:(CGFloat)bottomViewHegiht
{
    _bottomViewHegiht = bottomViewHegiht;
    self.bottomView.bottomHeight = bottomViewHegiht;
}

#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    [self.firstTitleButton.titleLabel sizeToFit];
    self.firstTitleButton.selected = YES;
    
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
        [self.indicatorView titlesView:titlesView firstButton:_firstTitleButton SegmentInterFaceStyle:_MJCIndicatorStyle];
        [titlesView addSubview:self.indicatorView];
    }else{
        [self.indicatorView titlesScroll:self.titlesScrollView firstButton:_firstTitleButton SegmentInterFaceStyle:_MJCIndicatorStyle];
        [self.titlesScrollView addSubview:self.indicatorView];
    }
}

-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _indicatorHidden = indicatorHidden;
    
    self.indicatorView.indicatorHidden = indicatorHidden;
}

-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    
    self.indicatorView.indicatorBackgroundColor = indicatorColor;
}

-(void)setIndicatorHeight:(CGFloat)indicatorHeight
{
    _indicatorHeight = indicatorHeight;
    
    self.indicatorView.indicatorHeight = indicatorHeight;
}

-(void)setIndicatorWidth:(CGFloat)indicatorWidth
{
    _indicatorWidth = indicatorWidth;
    
    self.indicatorView.indicatorWidth = indicatorWidth;
    
}
-(void)setIndicatorFrame:(CGRect)indicatorFrame
{
    _indicatorFrame= indicatorFrame;

    self.indicatorView.indicatorFrame = indicatorFrame;
}

//右边按钮的点击事件
- (void)rightClick:(UIButton *)button
{
    [self isOpenJump:_isOpenJump mostLeftPosition:_mostLeftSide mostRightPosition:_mostRightSide];
    
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
    _mostLeftSide = mostLeftPosition;
    _mostRightSide = mostRightPosition;
    
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
 
    self.firstTitleButton.transform = CGAffineTransformIdentity;
    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    
    titleButton.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
    if (_childViewScollAnimal == YES) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
            
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = titleButton.tag * self.scrollView.mjc_width;
            [self.scrollView setContentOffset:offset animated:NO];

        }];
        
    }else{
        
//        [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.mjc_width;
        [self.scrollView setContentOffset:offset animated:NO];
    }
    
    [self addChildVcView];
    
    [self setupTitleCenter:titleButton];
    
    if (_btnTag == (_countArr.count - 1)) {//最右边图片转换
        if (_mostRightSide == kNilOptions) {
            [self.rightMostButton setImage:_rightMostBtnImage forState:UIControlStateNormal];
        }else{
            [self.rightMostButton setImage:_mostLeftSide forState:UIControlStateNormal];
        }
    }else{
        if (_mostLeftSide == kNilOptions) {
            [self.rightMostButton setImage:_rightMostBtnImage forState:UIControlStateNormal];
        }else{
            [self.rightMostButton setImage:_mostRightSide forState:UIControlStateNormal];
        }
    }

    if ([self.slideDelegate respondsToSelector:@selector(mjc_ClickEvent:segmentInterface:)]) {
    
        [self.slideDelegate mjc_ClickEvent:titleButton segmentInterface:self];
    
    }
    
}


#pragma mark -- <UIScrollViewDelegate>

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger leftI = scrollView.contentOffset.x / MJCScreenWidth;
    NSInteger rightI = leftI + 1;
    
    // 获取左边的按钮
    UIButton *leftBtn =  self.titleButtons[leftI];
    
    NSInteger count = self.titleButtons.count;
    
    // 获取右边的按钮
    UIButton *rightBtn;
    if (rightI < count) {
        rightBtn = self.titleButtons[rightI];
    }
    
    // 0 ~ 1 =>  1 ~ 1.3
    CGFloat scaleR =  scrollView.contentOffset.x / MJCScreenWidth;
    
    scaleR -= leftI;
    
    CGFloat scaleL = 1 - scaleR;
    
    // 缩放按钮
    leftBtn.transform = CGAffineTransformMakeScale(scaleL * 0.1 + 1, scaleL * 0.1 + 1);
    rightBtn.transform = CGAffineTransformMakeScale(scaleR * 0.1 + 1, scaleR * 0.1 + 1);
}

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

    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesScrollStyle) {
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
    CGFloat offsetX = button.center.x - self.titlesScrollView.mjc_width * 0.4;
//    CGFloat offsetX = button.center.x - MJCScreenWidth * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - self.titlesScrollView.mjc_width;
//    CGFloat maxOffsetX = self.titlesScrollView.contentSize.width - MJCScreenWidth + _titleCenterMargin;
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [self.titlesScrollView setContentOffset: CGPointMake(offsetX, 0) animated:YES];
}


#pragma mark -- 工具方法
// 图片转换颜色
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect1 = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect1);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIView *)intoFaceView:(NSArray *)titlesArr
{
    if (_MJCSeMentTitleBarStyle == MJCSegMentTitlesNavBarStyle) {
        
        [self setupTitlesView];;
    }
    
    return _titlesView;
}

-(UIScrollView *)intoFaceScoll:(NSArray *)titlesArr;
{
    if (_MJCSeMentTitleBarStyle == MJCSegMentTitlesNavBarStyle) {
        [self setupScrollTitlesView];
    }
    return _titlesScrollView;
}


+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}


@end
