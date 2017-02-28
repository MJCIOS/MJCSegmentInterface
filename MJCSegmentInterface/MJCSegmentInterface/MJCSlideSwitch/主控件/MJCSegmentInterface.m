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
#import "MJCRightMostButton.h"
#import "MJCChildScrollView.h"
#import "MJCVerticalLineView.h"
#import "MJCIndicatorView.h"
#import "MJCTitlesScollView.h"
#import "MJCTabItemButton.h"

#define minFont 14
#define maxFont 18

@interface MJCSegmentInterface ()<UIScrollViewDelegate>

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
@property (nonatomic, copy) MJCTitlesScollView *titlesScrollView;
/** 顶部横线 */
@property (nonatomic,copy) MJCTopView *topView;
/** 底部横线 */
@property (nonatomic,copy) MJCBottomView *bottomView;
/** 右边按钮 */
@property (nonatomic,copy) MJCRightMostButton *rightMostButton;


/** tabitem宽度 */
@property (nonatomic,assign) CGFloat tabItemW;
/** tabitemH */
@property (nonatomic,assign) CGFloat tabItemH;

/** 界面滚动动画时间 */
@property (nonatomic,assign) NSTimeInterval scollAnimal;

/** 数组count */
@property (nonatomic,strong) NSArray *countArr;


#pragma mark -- 重要属性

@property (nonatomic,strong) UIViewController *viewController;
/** 子控制器界面的数组 */
@property (nonatomic,strong) NSArray *childControllerArray;

//数组按钮
@property (nonatomic, strong) NSMutableArray *titleButtons;

/** xib创建tag */
@property (nonatomic,assign) NSInteger xibCreateTag;

@end


@implementation MJCSegmentInterface

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
    
    _xibCreateTag = 1;
    
    [self setupData];
}

- (NSMutableArray *)titleButtons
{
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (MJCChildScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView = [[MJCChildScrollView  alloc]init];
        _scrollView.scollDelegate = self;
    }
    return _scrollView;
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
        
        _firstTitleButton = self.titlesScrollView.subviews[_selectedSegmentIndex];
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

- (MJCRightMostButton*)rightMostButton
{
    if (!_rightMostButton) {
        _rightMostButton = [[MJCRightMostButton  alloc]init];
        _rightMostButton.adjustsImageWhenHighlighted = NO;
    }
    return _rightMostButton;
}

+ (instancetype)segmentinitWithFrame:(CGRect)frame MJCSeMentTitleBarStyle:(MJCSeMentTitleBarStyles)MJCSeMentTitleBarStyle
{
    MJCSegmentInterface *interFaceView = [[self alloc] init];
    interFaceView.frame = frame;
    interFaceView.MJCSeMentTitleBarStyle = MJCSeMentTitleBarStyle;
    return interFaceView;
}

-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    
    self.firstTitleButton.selected = NO;
    
    if (_tabItemTitleMinfont) {
        self.firstTitleButton.titleLabel.font = [UIFont systemFontOfSize:_tabItemTitleMinfont];
    }else{
        self.firstTitleButton.titleLabel.font = _tabItemTitlesfont;
    }
    
    
    self.firstTitleButton = self.titlesScrollView.subviews[selectedSegmentIndex];
    self.firstTitleButton.selected = YES;
    [self setupChildViewScollAnimal:self.firstTitleButton];
    [self addChildVcView];
    
//    [self titleClick:button];
}

#pragma mark -- 添加子控制器
-(void)intoChildViewController:(UIViewController *)childViewController hostMainController:(UIViewController *)hostController;
{
    UIViewController *viewController = childViewController;
    
    [hostController addChildViewController:viewController];
    
    self.viewController = hostController;
    
    [self addChildVcView];
}

-(void)intoChildControllerArray:(NSArray *)childControllerArray hostMainController:(UIViewController *)hostController;
{
    _childControllerArray = childControllerArray;
    
    self.viewController = hostController;
    
    [self addChildVcView];
}

- (void)addChildVcView
{
    //为什么一定要不让系统自动修改布局呢,如果不设为NO,会导致外界其他子控件每次滚动会调用我们这里scrollView的一个代理方法
    self.viewController.automaticallyAdjustsScrollViewInsets = NO;
    
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    if (_selectedSegmentIndex != 0) {
        index = _selectedSegmentIndex;
        _selectedSegmentIndex = 0;
    }
    
    UIViewController *childVc;
    if (_childControllerArray) {
        childVc = _childControllerArray[index];
    }else{
        childVc = self.viewController.childViewControllers[index];
    }
    
    if ([childVc isViewLoaded]) return;
    
    childVc.view.frame = self.scrollView.bounds;
    
//    这个防止以后有布局问题,暂时不删
//    CGFloat childX = self.scrollView.bounds.origin.x;
//    CGFloat childW = self.scrollView.bounds.size.width;
//    CGFloat childH = self.scrollView.bounds.size.height;
//    if (self.viewController.edgesForExtendedLayout == UIRectEdgeNone) {
//        childVc.view.frame = self.scrollView.bounds;
//    }else{
//        if (index == 0) {
//            childVc.view.frame = CGRectMake(childX,0,childW,childH);
//        }else{
//            if (_selectedSegmentIndex != 0) {
//                childVc.view.frame = CGRectMake(childX,0,childW,childH);
//            }else{
//                childVc.view.frame = self.scrollView.bounds;
//            }
//        }
//    }
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
//    [self.scrollView setupTitlesScrollFrame:self.titlesScrollView mainView:self MJCSeMentTitleBarStyle:_MJCSeMentTitleBarStyle xibCreateTag:_xibCreateTag];
    
    self.scrollView.childScollEnabled = _childScollEnabled;
    [self.scrollView setupChildContenSize:scollViewArr];
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
    [self setupScrollTitlesView];
    [self setupTitlesButton:titlesArray];
    [self setupTopView:_titlesScrollView];
    [self setupBottomView:_titlesScrollView];
    [self setupindicatorView:_titlesScrollView];
    [self setupRightButton];
}

#pragma mark -- 最右边按钮
-(void)setupRightButton
{
    if (self.rightMostBtnImage) {
        self.rightMostButton.rightMostBtnImage = _rightMostBtnImage;
    }else{
        self.rightMostButton.rightMostBtnImage = _rightMostLeftSide;
    }
    
    self.rightMostButton.rightBtnHidden = _rightMostBtnHidden;
    self.rightMostButton.rightBtnBackColor = _rightMostBtnColor;
    [self. rightMostButton setupRightFrame:self.titlesButton titlesScrollView:self.titlesScrollView];
    [self.rightMostButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightMostButton];
}
-(void)setRightMostBtnImage:(UIImage *)rightMostBtnImage
{   //为了修改它第0页和最后一页的图片而重写它的set方法
    _rightMostBtnImage = rightMostBtnImage;
    
    self.rightMostButton.rightMostBtnImage = rightMostBtnImage;
}
-(void)setRightMostBtnFrame:(CGRect)rightMostBtnFrame
{
    _rightMostBtnFrame = rightMostBtnFrame;
    self.rightMostButton.rightMostBtnFrame = rightMostBtnFrame;
}

#pragma mark --创建滚动标题栏数据
-(void)setupScrollTitlesView
{
    self.titlesScrollView.titlesScrollColor = _titleViewColor;
    self.titlesScrollView.titlesScrollFrame = _titleViewframe;
    
    if (_MJCSeMentTitleBarStyle != MJCSegMentTitlesNavBarStyle) {
        
        [self addSubview:self.titlesScrollView];
    }
    
    [self.scrollView setupTitlesScrollFrame:self.titlesScrollView mainView:self MJCSeMentTitleBarStyle:_MJCSeMentTitleBarStyle xibCreateTag:_xibCreateTag];
}

#pragma mark -- 创建标题按钮数据
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    if (_titlesScrollEnabled == NO) {
        self.tabItemW = _titlesScrollView.mjc_width / titlesArray.count;
        self.tabItemH = _titlesScrollView.mjc_height;
        self.titlesScrollView.contentSize = self.titlesScrollView.mjc_size;
    }else{
        self.tabItemW = _tabItemWidth;
        self.tabItemH = _titlesScrollView.mjc_height;
        self.titlesScrollView.contentSize = CGSizeMake(titlesArray.count * _tabItemW, 0);
    }
        
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        
        MJCTabItemButton *tabbutton = [MJCTabItemButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = tabbutton;
        
        // 把标题按钮保存到对应的数组
        [self.titleButtons addObject:tabbutton];
        
        [tabbutton arraycount:i buttonW:_tabItemW buttonH:_tabItemH titlesScrollView:_titlesScrollView titlesArr:titlesArray imageStyle:_MJCImageEffectStyle];
        
        
        if (_zoomBigEnabled == YES) {
            
            if (_tabItemTitleMinfont) {
                self.tabItemTitlesfont = [UIFont systemFontOfSize:_tabItemTitleMinfont];
            }else{
                self.tabItemTitlesfont = [UIFont systemFontOfSize:minFont];
            }
            
            if (_tabItemTitleMaxfont) {
                [tabbutton setuptabItemTitlesFont:_tabItemTitleMaxfont tabItemTitlesfont:_tabItemTitlesfont];
            }else{
                [tabbutton setuptabItemTitlesFont:maxFont tabItemTitlesfont:_tabItemTitlesfont];
            }
        }else{
            tabbutton.tabItemTitlesfont = _tabItemTitlesfont;
        }
        
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
-(void)setupTopView:(MJCTitlesScollView *)titleView
{
    self.topView.topBackgroundColor = _topViewColor;
    self.topView.titlesScrollView = titleView;
    self.topView.topHeight = _topViewHegiht;
    self.topView.topHidden = _topViewHidden;
    [_titlesScrollView addSubview:self.topView];
}
-(void)setTopViewFrame:(CGRect)topViewFrame
{
    _topViewFrame = topViewFrame;
    self.topView.topFrame = topViewFrame;
}
#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIScrollView *)titleView
{
    self.bottomView.bottomHeight = _bottomViewHegiht;
    self.bottomView.bottomBackgroundColor = self.bottomViewColor;
    self.bottomView.titlesScrollView = titleView;
    self.bottomView.bottomHidden = _bottomViewHidden;
    [self.titlesScrollView addSubview:self.bottomView];
}
-(void)setBottomViewFrame:(CGRect)bottomViewFrame
{
    _bottomViewFrame = bottomViewFrame;
    self.bottomView.bottomFrame = bottomViewFrame;
}

#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    [self.firstTitleButton.titleLabel sizeToFit];
    self.firstTitleButton.selected = YES;
    
    self.indicatorView.indicatorHidden = _indicatorHidden;
    self.indicatorView.indicatorHeight = _indicatorHeight;
    
    [self.indicatorView titlesScroll:self.titlesScrollView firstButton:_firstTitleButton SegmentInterFaceStyle:_MJCIndicatorStyle];

    [self.titlesScrollView addSubview:self.indicatorView];
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    self.indicatorView.indicatorBackgroundColor = indicatorColor;
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
    //最右边按钮切换界面的方法
    if (_isOpenJump == YES) {
        
        //第二种:根据内偏移量x来算页码(如果是第一页那内偏移为0,如果是第二页,那就是第二块内容)
        NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
        if(index != 0) {//不等于第0页
            //这是回到第一个界面的方法
            [UIView animateWithDuration:_scollAnimal animations:^{
                CGPoint offset = self.scrollView.contentOffset;
                offset.x = 0;//第0页
                //切换到第0页
                [self.scrollView setContentOffset:offset animated:NO];
            }];
        }else {
            //这是跳到最后一个界面的方法
            CGPoint offset = self.scrollView.contentOffset;
            //算出最后一页
            offset.x = self.titlesButton.tag * self.scrollView.mjc_width;
            [UIView animateWithDuration:_scollAnimal animations:^{
                //切换到最后一页
                [self.scrollView setContentOffset:offset animated:NO];
            }];
        }
        //标题居中
        [self setupScollTitlesButton:_scrollView];

    }else{
        
        if ([self.slideDelegate respondsToSelector:@selector(mjc_MostClickEvent:segmentInterface:)]) {
            [self.slideDelegate mjc_MostClickEvent:_rightMostButton segmentInterface:self];
        }
    }
}

//点击标题的点击事件
- (void)titleClick:(MJCTabItemButton *)titleButton
{
    self.firstTitleButton.selected = NO;//之前选中的按钮
    [self.firstTitleButton setTitleColor:_tabItemTitleNormalColor forState:UIControlStateNormal];
    
    if (_zoomBigEnabled == YES) {
        if (_tabItemTitleMinfont) {
            self.firstTitleButton.titleLabel.font = [UIFont systemFontOfSize:_tabItemTitleMinfont];
        }else{
            self.firstTitleButton.titleLabel.font = [UIFont systemFontOfSize:minFont];
        }
    }
    
    self.firstTitleButton = titleButton;//现在选中的按钮
    titleButton.selected = YES;
    [titleButton setTitleColor:_tabItemTitleSelectedColor forState:UIControlStateSelected];
    
    if (_zoomBigEnabled == YES) {
        if (_tabItemTitleMaxfont) {
            titleButton.titleLabel.font = [UIFont systemFontOfSize:_tabItemTitleMaxfont];
        }else{
            titleButton.titleLabel.font = [UIFont systemFontOfSize:maxFont];
        }
    }
    
    [self setupChildViewScollAnimal:titleButton];//设置的动画效果
    
    if (_followScrollEnabled == YES) {
        if (_MJCIndicatorStyle == MJCIndicatorItemTextStyle) {// 下划线动态跟随滚动
            self.indicatorView.mjc_width = titleButton.titleLabel.mjc_width;
            self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        }
    }
    
    [self addChildVcView];//添加子页面
    
    [self setupTitleCenter:titleButton]; //按钮居中,传入当前点击的按钮
    
    if (_isOpenJump == YES) {
        [self setupRightMostBtn:titleButton];//右边按钮切换图片的效果
    }
    
    if ([self.slideDelegate respondsToSelector:@selector(mjc_ClickEvent:segmentInterface:)]) {
        [self.slideDelegate mjc_ClickEvent:titleButton segmentInterface:self];
    }
    
}

#pragma mark -- <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_zoomBigEnabled == YES) {
        [self setupZoomFont:scrollView];
    }
    
    if (_followScrollEnabled == YES) {
    
        [self setupIndicatorViewScroll:scrollView];
    }
}

/** 在scrollView滚动动画结束时, 就会调用这个方法,拖拽scrollView产生的滚动动画 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupScollTitlesButton:scrollView];//设置滚动栏,按钮居中的的效果
}

-(UIView *)intoFaceView;
{
    [self setupScrollTitlesView];
    
    return _titlesScrollView;
}


#pragma mark -- 封装方法
//基础数据设置
-(void)setupData
{
    if (_childViewScollAnimal == YES) {
        _scollAnimal = 0.25;
    }else{
        _scollAnimal = 0;
    }
    
    self.titleViewframe = CGRectMake(0,0,MJCScreenWidth,50);
    self.topViewHegiht = 1;
    self.indicatorHeight = 1;
    self.bottomViewHegiht = 1;
    self.tabItemWidth = 100;
    self.verticalLineHidden = YES;
    self.topViewHidden = YES;
    self.bottomViewHidden = YES;
    self.tabItemTitleNormalColor = [UIColor blackColor];
    self.tabItemTitleSelectedColor = [UIColor grayColor];
    self.rightMostBtnHidden = YES;
    
}

//设置底部指示器与按钮的居中效果,以及是否有动画效果
-(void)setupChildViewScollAnimal:(MJCTabItemButton *)titleButton
{
    if (_childViewScollAnimal == YES) {
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.mjc_width;
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
            [self.scrollView setContentOffset:offset animated:NO];
        }];
    }else{
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.mjc_width;
        [self.scrollView setContentOffset:offset animated:NO];
    }
}

// !!!:最右边点击切换按钮图片效果
-(void)setupRightMostBtn:(UIButton *)titleBtn
{
    if (titleBtn.tag == (_countArr.count - 1)) {//最右边图片转换
        self.rightMostBtnImage = _rightMostLeftSide;
    }else{
        self.rightMostBtnImage = _rightMostRightSide;
    }
}

//设置滚动的时候的点击方法以及标题居中的方法
-(void)setupScollTitlesButton:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    MJCTabItemButton *titleButton = self.titlesScrollView.subviews[index];
    [self titleClick:titleButton];
//    self.firstTitleButton = titleButton;
    if (_titlesScrollEnabled == NO) {
    }else{
        [self setupTitleCenter:titleButton];
    }
}

//选中滚动标题居中效果的方法的效果(与上面那方法有关联的)
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

//设置文字缩放效果(这个方法不太好)
//-(void)setupTransformBtn:(UIScrollView *)scrollView
//{
    //颜色渐变(用这个方法不太好)
//    UIColor *rightColor = [UIColor colorWithRed:scaleR green:0 blue:0 alpha:0.5];
//    UIColor *leftColor = [UIColor colorWithRed:scaleL green:0 blue:0 alpha:0.5];
//    [rightBtn setTitleColor:rightColor forState:UIControlStateNormal];
//    [leftBtn setTitleColor:leftColor forState:UIControlStateNormal];

//    缩放按钮(用这个方法不太好)
//    leftBtn.transform = CGAffineTransformMakeScale(scaleL * 0.3 + 1, scaleL * 0.3 + 1);
//    rightBtn.transform = CGAffineTransformMakeScale(scaleR * 0.3 + 1, scaleR * 0.3 + 1);
//    [self setupZoomFont:scrollView];
//    [self setupIndicatorViewScroll:scrollView];
//}

//缩放字体方法
-(void)setupZoomFont:(UIScrollView *)scrollView
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
    //    CGFloat scaleL = 1 - scaleR;
    
    //缩放字体
    CGFloat fontSize1;
    CGFloat fontSize2;
    CGFloat p = fmod(scrollView.contentOffset.x,self.titlesScrollView.mjc_width) / self.titlesScrollView.mjc_width;
    
    if (_tabItemTitleMaxfont) {
        fontSize2 = p * (_tabItemTitleMaxfont - _tabItemTitleMinfont) + _tabItemTitleMinfont;
    }else{
        fontSize2 = p * (maxFont - minFont) + minFont;
    }
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize2];
    
    if (_tabItemTitleMinfont) {
        fontSize1 = (1- p) * (_tabItemTitleMaxfont - _tabItemTitleMinfont) + _tabItemTitleMinfont;
    }else{
        fontSize1 = (1- p) * (maxFont - minFont) + minFont;
    }
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize1];
    
}

//底部指示器随着滚动
-(void)setupIndicatorViewScroll:(UIScrollView *)scrollView
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
    
    if (_MJCIndicatorStyle == MJCIndicatorItemStyle) {
        self.indicatorView.mjc_centerX = leftBtn.mjc_centerX + (rightBtn.mjc_centerX - leftBtn.mjc_centerX) * scaleR;
        self.indicatorView.mjc_width   = leftBtn.mjc_width +(rightBtn.mjc_width - leftBtn.mjc_width) * scaleR;
    }else{
        self.indicatorView.mjc_centerX = leftBtn.mjc_centerX + (rightBtn.mjc_centerX - leftBtn.mjc_centerX) * scaleR;
        self.indicatorView.mjc_width   = leftBtn.titleLabel.mjc_width +(rightBtn.titleLabel.mjc_width - leftBtn.titleLabel.mjc_width) * scaleR;
    }
}


@end
