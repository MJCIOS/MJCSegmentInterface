//
//  SegMentInterfaceStyleClassic.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController ()<MJCSlideSwitchViewDelegate>


/** <#  注释  #> */
@property (nonatomic,strong) MJCSegmentInterface *segmentInterface;

@end

@implementation MJCDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    //    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    
    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    
    //创建标题栏控件
    MJCSegmentInterface  *segmentInterface = [[MJCSegmentInterface alloc]init];
    _segmentInterface = segmentInterface;

    segmentInterface.titleViewColor = [UIColor orangeColor];
    
    segmentInterface.MJCSeMentTitleBarStyle = MJCSegMentTitlesClassicStyle;
    segmentInterface.titleViewframe = CGRectMake(0,64,MJCScreenWidth,50);
    //    segmentInterface.childViewframe = CGRectMake(0,100,MJCScreenWidth, MJCScreenHeight-64);
    segmentInterface.childScollEnabled = YES;
    segmentInterface.verticalLineHidden = YES;
//    segmentInterface.slideDelegate = self;
    
    segmentInterface.tabItemBackColor = [UIColor purpleColor];
    
    
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
    
//    _segmentInterface.selectedSegmentIndex = 2;
    
}


#pragma mark --MJCSlideSwitchViewDelegate
-(void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    
    NSLog(@"%@",button);
    
}





@end
