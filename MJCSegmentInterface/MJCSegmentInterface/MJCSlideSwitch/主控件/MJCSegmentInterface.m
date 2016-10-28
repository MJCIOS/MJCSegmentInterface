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
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    // 取出子控制器
    UIViewController *childVc = _addChildViewController.childViewControllers[index];
    // 如果view已经被加载过，就直接返回
    if ([childVc isViewLoaded]) return;
    
    //设置子控制器界面的大小位置
    childVc.view.frame = self.scrollView.bounds;
    
    //添加到scollview上面
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    // 不允许自动调整scrollView的内边距
    _addChildViewController.automaticallyAdjustsScrollViewInsets = NO;
    
//    // !!!:子控制器的滚动界面
    MJCChildScrollView *scrollView = [[MJCChildScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor whiteColor];
//    // 设置子界面的frame
    [self isChildViewframe:_isChildViewframe childViewframe:_childViewframe];
//    //是否开启分页
    scrollView.pagingEnabled = YES;
//    //是否允许滑动
    scrollView.scrollEnabled = _childViewEnabled;
//    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
//    //隐藏滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
//    //    scrollView.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部
//    // 添加所有子控制器的view到scrollView中(内容大小)
    scrollView.contentSize = CGSizeMake(scollViewArr.count * scrollView.mjc_width, 0);
    
    [self addSubview:scrollView];
}
//设置子界面的frame
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe
{
    _isChildViewframe = isChildViewframe;
    _childViewframe = childViewframe;
    
    [self.scrollView isChildFrame:isChildViewframe setChildFrame:childViewframe SegmentInterFaceStyle:_SegmentInterFaceStyle];
}


#pragma mark -- 标题栏设置创建
-(void)addTitlesArray:(NSArray *)titlesArray
{
    //添加滚动子控制器
    [self setScollViewArr:titlesArray];
    
    // !!!:添加标题栏
    [self setupTitlesView];
    
    // !!!:设置标题按钮
    [self setupTitlesButton:titlesArray];
    
    // !!!:设置顶部横线
    [self setupTopView:_titlesView];

    // !!!:设置底部横线
    [self setupBottomView:_titlesView];
    
    // !!!:设置底部指示器
    [self setupindicatorView:_titlesView];
    
}
#pragma mark -- 创建标题栏数据
-(void)setupTitlesView
{
    // !!!:标题栏主容器
    MJCTitlesView *titlesView = [[MJCTitlesView alloc] init];
    self.titlesView = titlesView;
    // !!!:设置标题栏数据
    [self setuptitlesViewData:_titlesView];
    [self addSubview:titlesView];
}

//设置标题栏的数据
-(void)setuptitlesViewData:(UIView *)titlesView
{
    //设置标题栏Frame
    [self isTitlesViewframe:_isTitlesViewframe titlesViewframe:_titlesViewframe];
    //设置标题栏颜色
    [self setTitlesViewColor:_titlesViewColor];
}
//设置标题栏的位置
-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe
{
    _isTitlesViewframe = isTitlesViewframe;
    _titlesViewframe = titlesViewframe;
    [self.titlesView isTitlesViewframe:isTitlesViewframe titlesViewframe:titlesViewframe];
}
//设置标题栏的颜色
-(void)setTitlesViewColor:(UIColor *)titlesViewColor
{
    _titlesViewColor = titlesViewColor;
    [self.titlesView setTitlesViewColor:titlesViewColor SegmentInterFaceStyle:_SegmentInterFaceStyle];
}
#pragma mark -- 创建标题按钮数据
// !!!:添加标题按钮
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    //添加标题按钮
    NSArray *titles = titlesArray;
    NSUInteger count = titles.count;
    CGFloat titleButtonW = _titlesView.mjc_width / count;
    self.btnW = titleButtonW;
    CGFloat titleButtonH = _titlesView.mjc_height;
    self.btnH = titleButtonH;
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = titleButton;
        titleButton.backgroundColor = [UIColor redColor];
        //按钮tag值
        titleButton.tag = i;
        self.btnX = i * titleButtonW;
        
        //设置tabitem文字大小
        [self setTabItemTitlesfont:_tabItemTitlesfont];
        //设置item背景色
        [self setTabItemBackColor:_tabItemBackColor];
        //设置item普通状态下的文字颜色
        [self setTabItemTitleNormalColor:_tabItemTitleNormalColor];
        
        //设置item点击状态下的文字颜色
        [self setTabItemTitleSelectedColor:_tabItemTitleSelectedColor];
        
        //设置item普通状态下的图片
        [self setTabItemImageNormal:_tabItemImageNormal];
        //设置item点击状态下的图片
        [self setTabItemImageSelected:_tabItemImageSelected];
        
        //设置item图片数组
        [self setTabItemImageArray:titleButton buttonTag:i];
        
        //设置itemFrame
        [self isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame];

        // !!!:右边竖线
        [self setupRightView:i titlesArr:titles];
        
        
        // 设置按钮数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        //按钮点击事件
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [_titlesView addSubview:titleButton];
    }
}

//设置itemFrame
-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame
{
    _isTabItemFrame = isTabItemFrame;
    _tabItemFrame = tabItemFrame;
    
    if (_isTabItemFrame == kNilOptions) {
        // 设置frame
        self.titlesButton.frame = CGRectMake(self.btnX, 0, self.btnW, self.btnH);
        
    }else{
        self.titlesButton.frame = tabItemFrame;
    }

}

//设置tabitem的文字大小
-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _tabItemTitlesfont = tabItemTitlesfont;
    //如果没传,为14
    if (_tabItemTitlesfont == kNilOptions) {
        self.titlesButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }else{
        self.titlesButton.titleLabel.font = _tabItemTitlesfont;
    }
    
}
//设置tabitem的背景色
-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _tabItemBackColor = tabItemBackColor;
    
    //如果用户没传东西(我们来设置)
    if (_tabItemBackColor == kNilOptions) {
        //如果是SegMentInterfaceStyleMoreUse,SegMentInterfaceStylePenetrate类型
        if (self.SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse) {
            self.titlesButton.backgroundColor = [UIColor clearColor];
        }else if (self.SegmentInterFaceStyle == SegMentInterfaceStylePenetrate){
            self.titlesButton.backgroundColor = [UIColor clearColor];
        }else{
            //其余类型统一设置为白色
            self.titlesButton.backgroundColor = [UIColor whiteColor];
        }
    }else{
        //获取用户传的颜色
        self.titlesButton.backgroundColor = tabItemBackColor;
    }
}
//设置tabitem的普通状态下文字颜色
-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _tabItemTitleNormalColor = tabItemTitleNormalColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }
}
//设置tabitem点击状态下的文字颜色
-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _tabItemTitleSelectedColor = tabItemTitleSelectedColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }
    
}
//设置tabitem普通状态下的图片
-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _tabItemImageNormal = tabItemImageNormal;
    
    if (_tabItemImageNormal == kNilOptions) {
        [self.titlesButton setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self.titlesButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}

//设置tabitem点击状态下的图片
-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    
    if (_tabItemImageSelected == kNilOptions) {
        [self.titlesButton setBackgroundImage:nil forState:UIControlStateSelected];
    }else{
        [self.titlesButton setBackgroundImage:tabItemImageSelected forState:UIControlStateSelected];
    }
}


//设置tabitem的图片数组
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
    // !!!:右边竖线
    MJCRightView *rightView = [[MJCRightView alloc]init];
    self.rightView = rightView;
    //设置右边竖线的颜色
    [rightView setRightBackgroundColor:_rightColor];
    [rightView setRightHeght:_rightViewHegiht titlesButton:self.titlesButton];
    [_titlesButton addSubview:rightView];
    //设置右边竖线是否隐藏
    [rightView setRightViewHidden:_rightViewHidden setRightViewShow:_rightViewShow inter:inter titlesArr:titlesArr SegmentInterFaceStyle:_SegmentInterFaceStyle];
}


#pragma mark -- 顶部横线的设置创建
-(void)setupTopView:(UIView *)titleView
{
    // !!!:头部横线
    MJCTopView *topView = [[MJCTopView alloc]init];
    self.topView = topView;
    //设置头部横线的颜色
    [self setTopViewColor:_topViewColor];
    //设置头部横线的位置
    [self isTopViewFrame:_isTopViewFrame setTopViewFrame:_topViewFrame];
    //设置头部横线是否隐藏
    [self setTopViewHidden:_topViewHidden];
    
    [titleView addSubview:topView];
}

//设置头部横线是否隐藏
-(void)setTopViewHidden:(BOOL)topViewHidden
{
    _topViewHidden = topViewHidden;
    [self.topView settopHidden:topViewHidden SegmentInterFaceStyle:_SegmentInterFaceStyle];
}

//设置头部横线的颜色
-(void)setTopViewColor:(UIColor *)topViewColor
{
    _topViewColor = topViewColor;
    [self.topView setTopBackgroundColor:topViewColor];
}

//设置头部横线的frame
-(void)isTopViewFrame:(BOOL)isTopViewFrame setTopViewFrame:(CGRect)topViewFrame
{
    self.isTopViewFrame = isTopViewFrame;
    self.topViewFrame = topViewFrame;
    [self.topView isTopFrame:isTopViewFrame settopFrame:topViewFrame topHegiht:_topViewHegiht titlesView:self.titlesView];
}

#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIView *)titleView
{
    // !!!:底部横线
    MJCBottomView *bottomView = [[MJCBottomView alloc]init];
    self.bottomView = bottomView;
    //设置底部横线颜色
    [self setBottomViewColor:_bottomViewColor];
    //设置底部横线是否隐藏
    [self setBottomViewHidden:_bottomViewHidden];
    //设置底部横线的位置
    [self isBottomViewFrame:_isBottomViewFrame setBottomViewFrame:_bottomViewFrame];
    [titleView addSubview:bottomView];
}
//设置底部横线是否隐藏
-(void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _bottomViewHidden = bottomViewHidden;
    [self.bottomView setBottomHidden:bottomViewHidden SegmentInterFaceStyle:_SegmentInterFaceStyle];
    
}
//设置底部横线的颜色
-(void)setBottomViewColor:(UIColor *)bottomViewColor
{
    _bottomViewColor = bottomViewColor;
    [self.bottomView setBottomBackgroundColor:bottomViewColor];
}

//设置底部横线的frame
-(void)isBottomViewFrame:(BOOL)isBottomViewFrame setBottomViewFrame:(CGRect)bottomViewFrame
{
    self.isBottomViewFrame = isBottomViewFrame;
    self.bottomViewFrame = bottomViewFrame;
    [self.bottomView isBottomFrame:isBottomViewFrame setBottomFrame:bottomViewFrame bottomHegiht:_bottomViewHegiht titlesView:self.titlesView];
}


#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIView *)titlesView
{
    // !!!:这是第一个按钮
    UIButton *firstTitleButton = _titlesView.subviews.firstObject;
    // 立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    // 默认情况: 选中最前面的标题按钮
    firstTitleButton.selected = YES;
    self.firstTitleButton = firstTitleButton;
    
    // !!!: 底部的指示器
    MJCIndicatorView *indicatorView = [[MJCIndicatorView alloc] init];
    self.indicatorView = indicatorView;
    //设置底部指示器的颜色
    [self setIndicatorColor:_indicatorColor];
    //设置底部指示器的frame
    [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
    [_titlesView addSubview:indicatorView];
    //设置底部指示器是否显示
    [indicatorView setIndicatorViewHidden:_indicatorHidden];
}
//设置底部指示器的frame
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame
{
    _isindicatorFrame = isindicatorFrame;
    _indicatorFrame = indicatorFrame;
    
    [self.indicatorView isindicatorFrame:isindicatorFrame indicatorFrame:indicatorFrame indicatorWidth:_indicatorWidth titlesView:_titlesView firstTitleButton:_firstTitleButton SegmentInterFaceStyle:_SegmentIndicatorStyle];
}

//设置底部指示器的颜色
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    [self.indicatorView setIndicatorColor:indicatorColor firstTitleButton:self.firstTitleButton];
}

/** 按钮的点击事件 */
- (void)titleClick:(UIButton *)titleButton
{
    // 控制按钮状态
    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    
    // 指示器动画
    [UIView animateWithDuration:0.25 animations:^{
        [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
    }];
    
    // 让UIScrollView滚动到对应位置
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
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    UIButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
    
    // 添加子控制器的view
    [self addChildVcView];
    
}



#pragma mark -- 工具方法
//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect1;
 
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //判断啥样式
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
