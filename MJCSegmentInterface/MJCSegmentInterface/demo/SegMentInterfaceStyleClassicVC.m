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
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    self.view.backgroundColor = [UIColor redColor];
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *view1 = segmentsface.intoFaceView;
    segmentsface.faceViewFrame = CGRectMake(0,64,MJCScreenWidth, MJCScreenHeight);
    segmentsface.slideDelegate = self;
    segmentsface.childScollEnabled = YES;
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:view1];

    //添加控制器
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentsface intoChildViewController:vc1];
    
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentsface intoChildViewController:vc];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentsface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    [segmentsface intoChildViewController:vc3];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentsface intoChildViewController:vc4];

    
}



#pragma mark --MJCSlideSwitchViewDelegate
-(void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface
{

    NSLog(@"%@",button);
    
}





@end
