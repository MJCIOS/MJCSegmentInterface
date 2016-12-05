//
//  SegMentInterfaceStylePenetrate.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStylePenetrateVC.h"
#import "ViewController.h"
#import "SegMentInterfaceStyleClassicVC.h"
#import "UITestViewController.h"

#import "MJCSegmentInterface.h"
#import "UITestViewController.h"
#import "UITestViewController1.h"
#import "UITestViewController2.h"
#import "UITestViewController3.h"
#import "UITestViewController4.h"


@interface SegMentInterfaceStylePenetrateVC ()<MJCSlideSwitchViewDelegate>

@end

@implementation SegMentInterfaceStylePenetrateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 3;
    self.view.backgroundColor = [UIColor redColor];
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.scrollTitlesEnabled = YES;
    segmentInterface.slideDelegate = self;
    
    //创建标题栏
//    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    //经典样式(如果你什么都不自定义设置,只需几句代码,帮你创建了经典样式的标题栏)
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStylePenetrate];
    segmentInterface.titleScrollColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    segmentInterface.indicatorHidden = NO;
    segmentInterface.bottomViewHidden = NO;
    segmentInterface.tabItemBackColor = [UIColor clearColor];
    segmentInterface.rightViewShow = NO;
    segmentInterface.childViewEnabled = YES;
    segmentInterface.rightMostBtnShow = YES;
    segmentInterface.rightMostBtnImage = [UIImage imageNamed:@"456"];
//    segmentInterface.rightMostBtnColor = [UIColor clearColor];

    [segmentInterface isOpenJump:NO mostLeftPosition:[UIImage imageNamed:@"向右箭头"] mostRightPosition:[UIImage imageNamed:@"向左箭头"]];
    
    //在添加标题栏之前做其他操作
    [segmentInterface intoTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    
    [segmentInterface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    
    vc3.style = style;
    
    [segmentInterface intoChildViewController:vc3];
    
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc4];
    
    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc5];

    UITestViewController4 *vc6 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc6];

    UITestViewController4 *vc7 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc7];

    
}

-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
   
    
    
}

-(void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    
    UITestViewController *vc = [UITestViewController new];
    
    
//    [self.navigationController pushViewController:vc animated:YES];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
