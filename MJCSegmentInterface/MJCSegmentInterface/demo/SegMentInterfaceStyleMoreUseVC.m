//
//  SegMentInterfaceStyleMoreUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleMoreUseVC.h"
#import "MJCPrefixHeader.pch"

@interface SegMentInterfaceStyleMoreUseVC ()

@end

@implementation SegMentInterfaceStyleMoreUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 1;
    self.view.backgroundColor = [UIColor redColor];
    
    
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor redColor];
    
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *view1 = [segmentsface intoFaceView:SegMentInterfaceStyleMoreUse];
    segmentsface.scrollTitlesEnabled = YES;
//    segmentsface.interFaceControlStyle = SegMentInterfaceStyleMoreUse;
    segmentsface.childScollEnabled = YES;
    segmentsface.childViewScollAnimal = YES;
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:view1];
    
    
    /** 添加控制器 */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentsface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentsface intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentsface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;
    [segmentsface intoChildViewController:vc3];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentsface intoChildViewController:vc4];
    
    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
    [segmentsface intoChildViewController:vc5];
    
    UITestViewController4 *vc6 = [[UITestViewController4 alloc]init];
    [segmentsface intoChildViewController:vc6];
    
    UITestViewController1 *vc7 = [[UITestViewController1 alloc]init];
    [segmentsface intoChildViewController:vc7];
    
}


@end
