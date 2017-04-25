//
//  MJCSegmentInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教
//  新增了标题栏滑动功能

#import "MJCSegmentInterface.h"
#import "MJCRightMostButton.h"
#import "MJCChildScrollView.h"
#import "MJCIndicatorView.h"
#import "MJCTitlesScollView.h"
#import "MJCTabItemButton.h"
#import "sys/utsname.h"

#define minFont 14
#define maxFont 18

#define animalTime 0.25

@interface MJCSegmentInterface ()<UIScrollViewDelegate>

//第一个按钮
@property (nonatomic,strong) MJCTabItemButton *selectedTitleButton;

/** 标题tabitem */
@property (nonatomic,strong) MJCTabItemButton *titlesButton;

/** 标题按钮底部的指示器 */
@property (nonatomic, copy) MJCIndicatorView *indicatorView;

/** 子界面UIScrollView */
@property (nonatomic, copy) MJCChildScrollView *scrollView;

/** 标题栏view */
@property (nonatomic, copy) MJCTitlesScollView *titlesScrollView;

/** 右边按钮 */
@property (nonatomic,copy) MJCRightMostButton *rightMostButton;

/** 界面滚动动画时间 */
@property (nonatomic,assign) NSTimeInterval scollAnimal;

/** 数组count */
@property (nonatomic,strong) NSArray *titlesArray;

#pragma mark -- 重要属性
@property (nonatomic,strong) UIViewController *viewController;
/** 子控制器界面的数组 */
@property (nonatomic,strong) NSArray *childControllerArray;
//数组按钮
@property (nonatomic, strong) NSMutableArray *titleButtons;

/** 标题按钮缩放效果 */
@property (nonatomic,assign) BOOL zoomBigEnabled;
/** 最大字体 */
@property (nonatomic,assign) CGFloat tabItemTitleMaxfont;
/** 最小字体 */
@property (nonatomic,assign) CGFloat tabItemTitleMinfont;


/** xib创建tag */
@property (nonatomic,assign) NSInteger xibCreateTag;

/** 为了让它少执行一些不必要的代码 */
@property (nonatomic,assign) NSInteger defultTag;

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
- (MJCTabItemButton*)selectedTitleButton
{
    if (!_selectedTitleButton) {
        _selectedTitleButton = self.titlesScrollView.subviews[_selectedSegmentIndex];
    }
    return _selectedTitleButton;
}
- (MJCIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[MJCIndicatorView  alloc]init];
    }
    return _indicatorView;
}
- (MJCRightMostButton*)rightMostButton
{
    if (!_rightMostButton) {
        _rightMostButton = [[MJCRightMostButton  alloc]init];
        _rightMostButton.adjustsImageWhenHighlighted = NO;
    }
    return _rightMostButton;
}

+ (instancetype)segmentinitWithFrame:(CGRect)frame MJCTitleBarStyle:(MJCTitleBarStyles)MJCTitleBarStyle;
{
    MJCSegmentInterface *interFaceView = [[self alloc] init];
    interFaceView.frame = frame;
    interFaceView.MJCTitleBarStyles = MJCTitleBarStyle;
    return interFaceView;
}

- (instancetype)initWithFrame:(CGRect)frame MJCTitleBarStyle:(MJCTitleBarStyles)MJCTitleBarStyles;
{
    if (self = [super initWithFrame:frame]) {
        self.MJCTitleBarStyles = MJCTitleBarStyles;
    }
    return self;
}

-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _defultTag = 1;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _selectedSegmentIndex = selectedSegmentIndex;
        //之前选中的按钮
        self.selectedTitleButton.selected = NO;
        //修改文字大小
        [self setupSelectedButtonZoomFont:_tabItemTitleMinfont];
        
        //最新选中的按钮
        self.selectedTitleButton = self.titlesScrollView.subviews[selectedSegmentIndex];
        self.selectedTitleButton.selected = YES;
        //修改文字大小
        [self setupSelectedButtonZoomFont:_tabItemTitleMaxfont];
    
        [self setupTitleCenter:self.selectedTitleButton];
    
        [self setupChildViewScollAnimal:self.selectedTitleButton];
        
        [self setupDefaultChildVcView];
        
    });
}

-(void)setupDefaultChildVcView
{
//    NSUInteger index;//页码
//    index = _selectedSegmentIndex;
//    CGPoint offset = self.scrollView.contentOffset;
//    offset.x = index * self.scrollView.mjc_width;
//    [self.scrollView setContentOffset:offset animated:NO];
    UIViewController *childVc;
    childVc = self.viewController.childViewControllers[_selectedSegmentIndex];
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 添加子控制器
-(void)intoChildViewController:(UIViewController *)childViewController
{
    UIViewController *viewController = childViewController;
    [self.viewController addChildViewController:viewController];
    [self addChildVcView];
}

-(void)intoChildControllerArray:(NSArray *)childControllerArray
{   _childControllerArray = childControllerArray;
    if (self.viewController.childViewControllers.count == 0) {
        for (int i = 0; i < childControllerArray.count; i++) {
            [self.viewController addChildViewController:childControllerArray[i]];
        }
        [self addChildVcView];
    }
}

//设置获取控制器的代理方法
-(void)setupIntoChildVCDelegate
{
    if (self.viewController.childViewControllers.count == 0) {
        if ([self.slideDelegate respondsToSelector:@selector(mjc_intoChildControllerArrayHostMainController)]) {
            _childControllerArray = [self.slideDelegate mjc_intoChildControllerArrayHostMainController];
            for (int i = 0; i < _childControllerArray.count; i++) {
                [self.viewController addChildViewController:_childControllerArray[i]];
            }
        }
    }
}

//设置获取初始默认选中的item的值的代理方法
-(void)setupInitialSelectedTitleButton
{
    if (_defultTag != 1) {
        if (self.viewController.childViewControllers.count != 0) {
            if ([self.slideDelegate respondsToSelector:@selector(mjc_defaultSelectedTabItem)]) {
                NSInteger defulttag =  [self.slideDelegate mjc_defaultSelectedTabItem];
                [self setSelectedSegmentIndex:defulttag];
            }
        }
    }
}

- (void)addChildVcView
{
    //为什么一定要不让系统自动修改布局呢,如果不设为NO,会导致外界其他子控件每次滚动会调用我们这里scrollView的一个代理方法
    self.viewController.automaticallyAdjustsScrollViewInsets = NO;
    
    //子界面的页码
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    UIViewController *childVc;
    
    if (index >= self.viewController.childViewControllers.count) {
        NSLog(@"您的控制器数量不够:控制器数量:%ld个 tabItem数量:%ld个",self.viewController.childViewControllers.count,self.titlesArray.count);
        return;
    }
    
    childVc = self.viewController.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    //重新设置childView的大小位置
    [self.scrollView setupTitlesScrollFrame:self.titlesScrollView mainView:self MJCTitleBarStyles:_MJCTitleBarStyles xibCreateTag:_xibCreateTag];
    
    self.scrollView.childScollEnabled = _childScollEnabled;
    [self.scrollView setupChildContenSize:scollViewArr];
    [self addSubview:self.scrollView];
}

#pragma mark -- 标题栏设置创建
-(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController
{   self.titlesArray = titlesArray;
    self.viewController = hostController;
    if (_childViewScollAnimal == YES) {
        _scollAnimal = animalTime;
    }else{
        _scollAnimal = 0;
    }
    //设置获取控制器的代理方法
    [self setupIntoChildVCDelegate];
    [self setScollViewArr:titlesArray];
    [self setupScrollTitlesView];
    [self setupTitlesButton:titlesArray];
    [self setupindicatorView:_titlesScrollView];
    [self setupRightButton];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //设置获取初始默认选中哪个item数值的代理方法
        [self setupInitialSelectedTitleButton];
    });
}

#pragma mark -- 最右边按钮
-(void)setupRightButton
{
    if (self.rightMostBtnImage) {
        self.rightMostButton.rightMostBtnImage = _rightMostBtnImage;
    }else{
        self.rightMostButton.rightMostBtnImage = _pointedRightImage;
    }
    self.rightMostButton.rightBtnHidden = _rightMostBtnHidden;
    self.rightMostButton.rightBtnBackColor = _rightMostBtnColor;
    [self. rightMostButton setupRightFrame:self.selectedTitleButton titlesScrollView:self.titlesScrollView];
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
    self.titlesScrollView.mainViews = self;
    self.titlesScrollView.titlesScrollColor = _titleViewColor;
    self.titlesScrollView.titlesScrollFrame = _titleViewframe;
    [self addSubview:self.titlesScrollView];
    
    //重新设置childView的大小位置
    [self.scrollView setupTitlesScrollFrame:self.titlesScrollView mainView:self MJCTitleBarStyles:_MJCTitleBarStyles xibCreateTag:_xibCreateTag];
}

#pragma mark -- 创建标题按钮数据
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    CGFloat tabItemW;
    CGFloat tabItemH;
    
    if (_MJCTitleBarStyles == MJCTitlesClassicStyle) {
        tabItemW = _titlesScrollView.mjc_width / titlesArray.count;
        tabItemH = _titlesScrollView.mjc_height;
        self.titlesScrollView.contentSize = self.titlesScrollView.mjc_size;
    }else{
        if (_tabItemWidth) {
            tabItemW = _tabItemWidth;
        }else{
            if (_initialShowItem) {
                tabItemW = self.titlesScrollView.mjc_width / _initialShowItem;
            }else{
                if (titlesArray.count > 5) {
                    tabItemW = self.titlesScrollView.mjc_width / 4;
                }else{
                    tabItemW = self.titlesScrollView.mjc_width / titlesArray.count;
                }
            }
        }
        tabItemH = _titlesScrollView.mjc_height;
        self.titlesScrollView.contentSize = CGSizeMake(titlesArray.count * tabItemW, 0);
    }
    
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        MJCTabItemButton *tabbutton = [MJCTabItemButton buttonWithType:UIButtonTypeCustom];
        tabbutton.titleArr = self.titlesArray;
        tabbutton.imageStyle = _MJCImageEffectStyle;
        self.titlesButton = tabbutton;
        [self.titleButtons addObject:tabbutton];// 把标题按钮保存到对应的数组
        
        [tabbutton buttonW:tabItemW buttonH:tabItemH titlesScrollView:self.titlesScrollView buttonTag:i];
        
        [self setupButton:tabbutton i:i];
        
        [tabbutton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];

        if (i == 0) {
            self.selectedTitleButton = tabbutton;
        }
    }
    
}

-(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont tabItemTitleMinfont:(CGFloat)tabItemTitleMinfont
{
    _zoomBigEnabled = zoomBigEnabled;
    _tabItemTitleMinfont = tabItemTitleMinfont;
    _tabItemTitleMaxfont = tabItemTitleMaxfont;
}

#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    [self.selectedTitleButton.titleLabel sizeToFit];
    self.selectedTitleButton.selected = YES;
    
    self.indicatorView.indicatorHidden = _indicatorHidden;
    self.indicatorView.selectedTitleButton = self.selectedTitleButton;
    self.indicatorView.MJCIndicatorStyle = _MJCIndicatorStyle;
    self.indicatorView.indicatorHeight = _indicatorHeight;
    self.indicatorView.titlesScrollView = self.titlesScrollView;
    self.indicatorView.indicatorBackgroundColor = self.indicatorColor;
    self.indicatorView.indicatorWidth = _indicatorWidth;
    [self.titlesScrollView addSubview:self.indicatorView];
}

//-(void)setIndicatorFrame:(CGRect)indicatorFrame
//{
//    _indicatorFrame= indicatorFrame;
//    self.indicatorView.indicatorFrame = indicatorFrame;
//}

//右边按钮的点击事件
- (void)rightClick:(UIButton *)button
{
    //最右边按钮切换界面的方法
    if (_isOpenJump == YES) {
        //第二种:根据内偏移量x来算页码(如果是第一页那内偏移为0,如果是第二页,那就是第二块内容)
        NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
        if(index != 0) {//不等于第0页
            [UIView animateWithDuration:_scollAnimal animations:^{//这是回到第一个界面的方法
                CGPoint offset = self.scrollView.contentOffset;
                offset.x = 0;
                [self.scrollView setContentOffset:offset animated:NO];//切换到第0页
            }];
            self.rightMostBtnImage = _pointedRightImage;
        }else {//这是跳到最后一个界面的方法
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = self.titlesButton.tag * self.scrollView.mjc_width;//算出最后一页
            [UIView animateWithDuration:_scollAnimal animations:^{
                //切换到最后一页
                [self.scrollView setContentOffset:offset animated:NO];
            }];
            self.rightMostBtnImage = _pointedLeftImage;
        }
        
        //标题居中
        [self setupScollTitlesButton:_scrollView rightMostButton:button];
        
    }else{
        if ([self.slideDelegate respondsToSelector:@selector(mjc_MostClickEvent:segmentInterface:)]) {
            [self.slideDelegate mjc_MostClickEvent:_rightMostButton segmentInterface:self];
        }
    }
}

//点击标题的点击事件
- (void)titleClick:(MJCTabItemButton *)titleButton
{
    //按钮居中,传入当前点击的按钮
    [self setupTitleCenter:titleButton];
    
    /**
     * 之前选中的按钮
     */
    if (titleButton == self.selectedTitleButton) return;
    [self setupSelectedButtonZoomFont:_tabItemTitleMinfont];
    //之前选中的按钮(设置为不选中)
    self.selectedTitleButton.selected = NO;
   
    /**
     * 现在选中的按钮
     */
    self.selectedTitleButton = titleButton;
    titleButton.selected = YES;
    [self setupSelectedButtonZoomFont:_tabItemTitleMaxfont];
    
    //设置底部指示器与按钮的居中效果,以及是否有动画效果
    [self setupChildViewScollAnimal:titleButton];
    
    //添加子页面
    [self addChildVcView];
    
    //右边按钮切换图片的效果判断(防止多走无用的代码,进行了判断)
    if (titleButton.tag == 0) {
        if (_isOpenJump == YES) {
            self.rightMostBtnImage = _pointedRightImage;
        }
    }else if (titleButton.tag == _titlesArray.count - 1){
        if (_isOpenJump == YES) {
            self.rightMostBtnImage = _pointedLeftImage;
        }
    }
    
    if ([self.slideDelegate respondsToSelector:@selector(mjc_ClickEvent:segmentInterface:)]) {
        [self.slideDelegate mjc_ClickEvent:titleButton segmentInterface:self];
    }
    
}

// !!!:最右边点击切换按钮图片效果
-(void)setupRightMostBtn:(UIButton *)titleBtn
{
    if (titleBtn.tag == (_titlesArray.count - 1)) {//最右边图片转换
        self.rightMostBtnImage = _pointedLeftImage;
    }else{
        self.rightMostBtnImage = _pointedRightImage;
    }
}


#pragma mark -- <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 防止在最左侧的时候再滑
    if (value < 0) return;
    // 防止在最右侧的时候再滑
    if (value > self.titlesArray.count - 1)return;
    
    UIButton *leftBtn;
    UIButton *rightBtn;
    CGFloat scaleRight = 0;
    CGFloat scaleLeft = 0;
    
    if (_zoomBigEnabled == YES || _followScrollEnabled == YES) {
        //左边索引
        NSUInteger leftIndex = (int)value;
        //右边索引
        NSUInteger rightIndex = leftIndex + 1;
        //滑动比例值计算
        scaleRight = value - leftIndex;
        
        //左比例值计算(是为了判断,点击按钮的时候,返回,不执行后面的代码)
        scaleLeft  = 1 - scaleRight;
        //点击按钮的时候,返回,不执行下面的代码
        if (scaleLeft == 1 && scaleRight == 0)return;
        
        //获取左边的按钮
        leftBtn =  self.titleButtons[leftIndex];
        //获取右边的按钮
        if (rightIndex < self.titleButtons.count) {
            rightBtn = self.titleButtons[rightIndex];
        }
    }
    
    if (_zoomBigEnabled == YES) {
        [self setupZoomFont:scrollView leftBtn:leftBtn rightBtn:rightBtn scaleR:scaleRight];
    }
    
    if (_followScrollEnabled == YES) {
        [self setupIndicatorViewScroll:scrollView leftBtn:leftBtn rightBtn:rightBtn scaleR:scaleRight];
    }
    
}

/** 在scrollView滚动动画结束时, 就会调用这个方法,拖拽scrollView产生的滚动动画 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupScollTitlesButton:scrollView rightMostButton:nil];//设置滚动栏,按钮居中的的效果
}

#pragma mark -- 封装方法
//基础数据设置
-(void)setupData
{
    self.titleViewframe = CGRectMake(0,0,MJCScreenWidth,50);
    self.rightMostBtnHidden = YES;
}

//设置底部指示器与按钮的居中效果,以及是否有动画效果
-(void)setupChildViewScollAnimal:(MJCTabItemButton *)titleButton
{
    [titleButton.titleLabel sizeToFit];
    
    if (_MJCIndicatorStyle == MJCIndicatorItemTextStyle) {// 下划线动态跟随滚动
        self.indicatorView.mjc_width = titleButton.titleLabel.mjc_width;
    }
    
    if (_childViewScollAnimal == YES) {
        [UIView animateWithDuration:_scollAnimal animations:^{
            self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = titleButton.tag * self.scrollView.mjc_width;
            [self.scrollView setContentOffset:offset animated:NO];
        }];
    }else{
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleButton.tag * self.scrollView.mjc_width;
        [self.scrollView setContentOffset:offset animated:NO];
    }
}

//滚动完成之后的操作方法
-(void)setupScollTitlesButton:(UIScrollView *)scrollView rightMostButton:(UIButton*)rightMostButton
{
    //之前选中的按钮(设置为不选中)
    self.selectedTitleButton.selected = NO;
    
    //点击最右边指向按钮调用的方法
    if (rightMostButton == self.rightMostButton) { //之前选中的按钮
        [self setupSelectedButtonZoomFont:_tabItemTitleMinfont];
    }
    
    //现在的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    MJCTabItemButton *titleButton = self.titlesScrollView.subviews[index];
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    //添加子页面
    [self addChildVcView];
    
    //点击最右边指向按钮调用的方法
    if (rightMostButton == self.rightMostButton) {
        [self setupSelectedButtonZoomFont:_tabItemTitleMaxfont];
    }

    //设置底部指示器
    [self setupChildViewScollAnimal:titleButton];
    
    //标题栏按钮随着变化
    [self setupTitleCenter:titleButton];

}

//选中滚动标题居中效果的方法的效果
- (void)setupTitleCenter:(UIButton *)titleButton
{
    if (_MJCTitleBarStyles != MJCTitlesClassicStyle) {
        [MJCToolClasses selectedTitleCenter:titleButton titlesScrollView:self.titlesScrollView];
    }
}

//缩放字体方法
-(void)setupZoomFont:(UIScrollView *)scrollView leftBtn:(UIButton *)leftBtn rightBtn:(UIButton *)rightBtn scaleR:(CGFloat)scaleR
{
    //缩放字体
    CGFloat leftFontSize;
    CGFloat righFontSize;
    //计算出左边按钮的字体大小
    if (_tabItemTitleMinfont) {
        leftFontSize = (1- scaleR) * (_tabItemTitleMaxfont - _tabItemTitleMinfont) + _tabItemTitleMinfont;
    }else{
        leftFontSize = (1- scaleR) * (maxFont - minFont) + minFont;
    }
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:leftFontSize];
    
    //计算出右边按钮的字体大小
    if (_tabItemTitleMaxfont) {
        righFontSize = scaleR * (_tabItemTitleMaxfont - _tabItemTitleMinfont) + _tabItemTitleMinfont;
    }else{
        righFontSize = scaleR * (maxFont - minFont) + minFont;
    }
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:righFontSize];
}

//底部指示器随着滚动
-(void)setupIndicatorViewScroll:(UIScrollView *)scrollView leftBtn:(UIButton *)leftBtn rightBtn:(UIButton *)rightBtn scaleR:(CGFloat)scaleR
{
    
    if (_MJCIndicatorStyle == MJCIndicatorItemStyle) {
        self.indicatorView.mjc_width   = leftBtn.mjc_width - (rightBtn.mjc_width - self.titlesButton.mjc_width / 2) * scaleR;
        self.indicatorView.mjc_centerX = leftBtn.mjc_centerX + (rightBtn.mjc_centerX - leftBtn.mjc_centerX) * scaleR;
    }else{
        
        self.indicatorView.mjc_centerX = leftBtn.mjc_centerX + (rightBtn.mjc_centerX - leftBtn.mjc_centerX) * scaleR;
        
        self.indicatorView.mjc_width  = leftBtn.titleLabel.mjc_width +(rightBtn.titleLabel.mjc_width - leftBtn.titleLabel.mjc_width) * scaleR;
    }
}

//设置按钮的各种属性的方法
-(void)setupButton:(MJCTabItemButton *)tabbutton i:(NSInteger)i
{
    if (_zoomBigEnabled == YES) {
        if (_tabItemTitleMinfont){self.tabItemTitlesfont = [UIFont systemFontOfSize:_tabItemTitleMinfont];}
        if (_tabItemTitleMaxfont){[tabbutton setuptabItemTitlesFont:_tabItemTitleMaxfont tabItemTitlesfont:_tabItemTitlesfont];}
    }else{
        tabbutton.tabItemTitlesfont = _tabItemTitlesfont;
    }
    tabbutton.tabItemBackColor = _tabItemBackColor;
    tabbutton.tabItemTitleNormalColor = _tabItemTitleNormalColor;
    tabbutton.tabItemTitleSelectedColor =_tabItemTitleSelectedColor;
    if (_tabItemImageNormal) {tabbutton.tabItemImageNormal = _tabItemImageNormal;}
    if (_tabItemImageSelected) {tabbutton.tabItemImageSelected = _tabItemImageSelected;}
    if (_tabItemBackImageNormal) {tabbutton.tabItemBackImageNormal = _tabItemBackImageNormal;}
    if (_tabItemBackImageSelected) {tabbutton.tabItemBackImageSelected = _tabItemBackImageSelected;}
    if (_tabItemImageNormalArray) {tabbutton.tabItemNormalImageArray = _tabItemImageNormalArray;}
    if (_tabItemImageSelectedArray) {tabbutton.tabItemSelectedImageArray =_tabItemImageSelectedArray;}
    if (_tabItemBackImageNormalArray) {tabbutton.tabItemNormalBackImageArray = _tabItemBackImageNormalArray;}
    if (_tabItemBackImageSelectedArray) {tabbutton.tabItemSelectedBackImageArray  = _tabItemBackImageSelectedArray;}
}

//修改选中按钮放大字体的方法
-(void)setupSelectedButtonZoomFont:(CGFloat)tabItemTitleTypefont
{
    if (_zoomBigEnabled == YES) {
        if (tabItemTitleTypefont) {//修改它的文字大小
            self.selectedTitleButton.titleLabel.font = [UIFont systemFontOfSize:tabItemTitleTypefont];
        }
    }
//    }else{
//        self.selectedTitleButton.titleLabel.font = _tabItemTitlesfont;;
//    }
}




@end
