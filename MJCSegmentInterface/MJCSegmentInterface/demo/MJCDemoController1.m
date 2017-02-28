//
//  SegMentInterfaceStylePenetrate.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController1.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController1 ()<MJCSlideSwitchViewDelegate>

@end

@implementation MJCDemoController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    [MJCToolClasses useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    //创建标题栏控件
    MJCSegmentInterface  *segmentInterface = [[MJCSegmentInterface alloc]init];
    
    segmentInterface.titlesScrollEnabled = YES;
    segmentInterface.titleViewColor = [[UIColor blueColor]colorWithAlphaComponent:0.5];
    segmentInterface.childViewScollAnimal = YES;
    //    segmentInterface.tabItemWidth = 200;
    segmentInterface.slideDelegate = self;
    segmentInterface.childScollEnabled = YES;
    segmentInterface.verticalLineHidden = YES;
    segmentInterface.rightMostBtnHidden = NO;
    segmentInterface.rightMostBtnColor = [UIColor purpleColor];
    segmentInterface.isOpenJump = YES;
    
    segmentInterface.rightMostBtnImage = [UIImage imageNamed:@"向右箭头"];//默认图片
    segmentInterface.rightMostRightSide = [UIImage imageNamed:@"向右箭头"];
    segmentInterface.rightMostLeftSide = [UIImage imageNamed:@"向左箭头"];
    
    segmentInterface.zoomBigEnabled = YES;
    
    //在添加标题栏之前做其他属性操作
    [segmentInterface intoTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    
    /** 添加控制器 */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentInterface intoChildViewController:vc hostMainController:self];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface intoChildViewController:vc1 hostMainController:self];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface intoChildViewController:vc2 hostMainController:self];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;
    [segmentInterface intoChildViewController:vc3 hostMainController:self];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc4 hostMainController:self];
    
    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc5 hostMainController:self];
    
    UITestViewController4 *vc6 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc6 hostMainController:self];
    
    UITestViewController1 *vc7 = [[UITestViewController1 alloc]init];
    vc7.style = style;
    [segmentInterface intoChildViewController:vc7 hostMainController:self];
    
}

-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    
    
    
}

-(void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    UITestViewController *vc = [UITestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    //    [self presentViewController:vc animated:YES completion:nil];
}


@end
