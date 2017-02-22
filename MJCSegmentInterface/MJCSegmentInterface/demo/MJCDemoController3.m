//
//  SegMentInterfaceStyleMoreUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController3.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController3 ()

@end

@implementation MJCDemoController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    
    //创建标题栏控件
    MJCSegmentInterface  *segmentInterface = [[MJCSegmentInterface alloc]init];
    
    segmentInterface.titlesScrollEnabled = YES;
    
    segmentInterface.titleViewColor = [[UIColor blueColor]colorWithAlphaComponent:0.2];
    
    segmentInterface.verticalLineHidden = NO;
    segmentInterface.childScollEnabled = YES;
    segmentInterface.childViewScollAnimal = YES;
    
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


@end
