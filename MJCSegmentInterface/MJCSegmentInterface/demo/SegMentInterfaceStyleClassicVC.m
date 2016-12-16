//
//  SegMentInterfaceStyleClassic.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleClassicVC.h"
#import "MJCPrefixHeader.pch"


@interface SegMentInterfaceStyleClassicVC ()<MJCSlideSwitchViewDelegate>

/** <#  注释  #> */
@property (nonatomic,strong) MJCSegmentInterface *segmentInterface;


@end

@implementation SegMentInterfaceStyleClassicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor redColor];
    
    
    //创建标题栏控件
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    _segmentInterface = segmentInterface;
    segmentInterface.scrollTitlesEnabled = NO;
    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    segmentInterface.childViewEnabled = YES;
    segmentInterface.slideDelegate = self;
    segmentInterface.indicatorHidden = NO;
    segmentInterface.topViewHidden = NO;
    segmentInterface.bottomViewHidden = NO;
 
    //在添加标题栏之前做其他属性操作
    [segmentInterface intoTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentInterface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    [segmentInterface intoChildViewController:vc3];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc4];

    
}

#pragma mark --MJCSlideSwitchViewDelegate
/** 在scrollView滚动的时候动画结束时, 就会调用这个方法 */
- (void)mjc_ScrollViewDidEndScrollingAnimation:(MJCSegmentInterface *)segmentInterface;
{
    _segmentInterface = segmentInterface;
    
    UIView *subview1 = [[UIView alloc]init];
    subview1.backgroundColor = [UIColor orangeColor];
    subview1.frame = CGRectMake(0, 0, self.view.mjc_width, 50);
    
    UIButton *buewe = [UIButton buttonWithType:UIButtonTypeCustom];
    buewe.backgroundColor = [UIColor blueColor];
    buewe.frame = CGRectMake(0, 0, 120, 50);
    [buewe addTarget:self action:@selector(hideDismis1) forControlEvents:UIControlEventTouchUpInside];
    [subview1 addSubview:buewe];
    
    
}
/** 在拖拽scrollView滚动动画结束时, 就会调用这个方法  */
- (void)mjc_scrollViewDidEndDecelerating:(MJCSegmentInterface *)segmentInterface
{
    
}

-(void)hideDismis1
{
    
}




@end
