//
//  SegMentInterfaceStyleClassic.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleClassicVC.h"
#import "MJCPrefixHeader.pch"
#import "MJCSegmentFaceControl.h"

@interface SegMentInterfaceStyleClassicVC ()<MJCSlideSwitchViewDelegate>

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
    
    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    
    
    //创建标题栏控件
    MJCSegmentInterface  *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.MJCSeMentTitleBarStyle = MJCSegMentTitlesClassicStyle;
//    segmentInterface.childViewframe = CGRectMake(0,0, MJCScreenWidth, MJCScreenHeight);
    segmentInterface.titlesViewframe = CGRectMake(0,0, MJCScreenWidth, 100);
    segmentInterface.childScollEnabled = YES;
//    segmentInterface.verticalLineHidden = YES;
    segmentInterface.slideDelegate = self;
//    segmentInterface.indicatorHidden = NO;
//    segmentInterface.topViewHidden = NO;
    segmentInterface.topViewColor = [UIColor redColor];
    segmentInterface.bottomViewColor = [UIColor blackColor];
//    segmentInterface.bottomViewHidden=NO;
    segmentInterface.tabItemBackColor = [UIColor redColor];
    segmentInterface.titlesViewColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    
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
-(void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface
{

    NSLog(@"%@",button);
    
}





@end
