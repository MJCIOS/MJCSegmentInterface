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
@property (nonatomic, copy) MJCTitlesScollView *titlesScrollView;
/** 顶部横线 */
@property (nonatomic,copy) MJCTopView *topView;
/** 底部横线 */
@property (nonatomic,copy) MJCBottomView *bottomView;
/** 右边按钮 */
@property (nonatomic,copy) MJCRightMostButton *rightMostButton;

//数组按钮
@property (nonatomic, strong) NSMutableArray *titleButtons;

/** tabitem宽度 */
@property (nonatomic,assign) CGFloat tabItemW;
/** tabitemH */
@property (nonatomic,assign) CGFloat tabItemH;

/** 界面滚动动画时间 */
@property (nonatomic,assign) NSTimeInterval scollAnimal;

/** 数组count */
@property (nonatomic,strong) NSArray *countArr;


#pragma mark -- 重要属性


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
    [self setupData];
}

- (UIViewController *)viewController:(UIView *)view{
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    return nil;
}


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
    MJCSegmentInterface *interFaceView = [[self alloc] initWithFrame:frame];
    interFaceView.MJCSeMentTitleBarStyle = MJCSeMentTitleBarStyle;
    
    return interFaceView;
}

-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    
    MJCTabItemButton *button = self.titlesScrollView.subviews[selectedSegmentIndex];
    
    [self titleClick:button];
}

#pragma mark -- 添加子控制器
-(void)intoChildViewController:(UIViewController *)childViewController;
{
    self.viewController = [self viewController:self];
    
    [self.viewController addChildViewController:childViewController];
    
    [self addChildVcView];
}

- (void)addChildVcView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    UIViewController *childVc = self.viewController.childViewControllers[index];
    
    if ([childVc isViewLoaded]) return;
    
    CGFloat childX = self.scrollView.bounds.origin.x;
    CGFloat childW = self.scrollView.bounds.size.width;
    CGFloat childH = self.scrollView.bounds.size.height;
    
    if (self.viewController.edgesForExtendedLayout == UIRectEdgeNone) {
        childVc.view.frame = self.scrollView.bounds;
    }else{
        if (index == 0) {
            childVc.view.frame = CGRectMake(childX,-64,childW, childH);
        }else{
            if (_selectedSegmentIndex != 0) {
                childVc.view.frame = CGRectMake(childX,-64,childW,childH);
            }else{
                childVc.view.frame = self.scrollView.bounds;
            }
        }
    }
    
    [self.scrollView addSubview:childVc.view];
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    self.scrollView.delegate = self;
    self.scrollView.childScollEnabled = _childScollEnabled;
    [self.scrollView setupTitlesScrollFrame:_titleViewframe MJCSeMentTitleBarStyle:_MJCSeMentTitleBarStyle];
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
    self.rightMostButton.rightBtnHidden = _rightMostBtnHidden;
    self.rightMostButton.rightBtnBackColor = _rightMostBtnColor;
    [self. rightMostButton setupRightFrame:self.titlesButton titlesScrollView:self.titlesScrollView];
    [self.rightMostButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightMostButton];
}
-(void)setRightMostBtnImage:(UIImage *)rightMostBtnImage
{   //为了修改它第0页和最后一页而重写它的set方法
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
        return;
    }
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
//        // !!!:第一种算页数的方法
//        CGFloat scrollViewWidth = _scrollView.contentSize.width;
//        //当前页数,第一页 (这个为第一页)
//        CGFloat scrollViewContentX = _scrollView.contentOffset.x;
//        //最后一页
//        CGFloat lastPage = scrollViewContentX >= scrollViewWidth - MJCScreenWidth;
        
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
    //按钮字体恢复
//    self.firstTitleButton.transform = CGAffineTransformIdentity;
    
    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    
    //按钮字体放大
//    titleButton.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
    [self setupChildViewScollAnimal:titleButton];//设置的动画效果
    
    [self addChildVcView];//添加子页面
    
    [self setupTitleCenter:titleButton]; //按钮居中
    
    if (_isOpenJump == YES) {
        [self setupRightMostBtn:titleButton];//右边按钮切换图片的效果
    }
    
    if ([self.slideDelegate respondsToSelector:@selector(mjc_ClickEvent:segmentInterface:)]) {
        [self.slideDelegate mjc_ClickEvent:titleButton segmentInterface:self];
    }
    
}


#pragma mark -- <UIScrollViewDelegate>

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [self setupTransformBtn:scrollView];
//}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupScollTitlesButton:scrollView];//设置滚动栏,按钮居中的的效果
    [self addChildVcView];//每次滚动添加子页面
    
    if ([self.slideDelegate respondsToSelector:@selector(mjc_scrollDidEndDecelerating:segmentInterface:)]) {
        [self.slideDelegate mjc_scrollDidEndDecelerating:self.firstTitleButton segmentInterface:self];
    }
}

-(UIScrollView *)intoFaceView;
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
//    _selectedSegmentIndex = 0;
    self.topViewHegiht = 1;
    self.indicatorHeight = 1;
    self.bottomViewHegiht = 1;
    self.tabItemWidth = 100;
    self.verticalLineHidden = YES;
    self.topViewHidden = YES;
    self.bottomViewHidden = YES;
    self.titleViewframe = CGRectMake(0,0,MJCScreenWidth,50);
    self.tabItemTitleNormalColor = [UIColor darkGrayColor];
    self.tabItemTitleSelectedColor = [UIColor blackColor];
    self.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    self.rightMostBtnHidden = YES;
    
}

//设置底部指示器与按钮的居中效果,以及是否有动画效果
-(void)setupChildViewScollAnimal:(UIButton *)titleBtn
{
    if (_childViewScollAnimal == YES) {
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.mjc_centerX = titleBtn.mjc_centerX;
            CGPoint offset = self.scrollView.contentOffset;
            offset.x = titleBtn.tag * self.scrollView.mjc_width;
            [self.scrollView setContentOffset:offset animated:NO];
        }];
    }else{
        self.indicatorView.mjc_centerX = titleBtn.mjc_centerX;
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = titleBtn.tag * self.scrollView.mjc_width;
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
    
    if (_titlesScrollEnabled == NO) {
        MJCTabItemButton *titleButton = self.titlesScrollView.subviews[index];
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

//设置文字缩放效果
-(void)setupTransformBtn:(UIScrollView *)scrollView
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

//防止导航栏挡住的方法
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}

@end
