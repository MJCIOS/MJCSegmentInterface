//
//  SegMentInterfaceStyleMoreUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleMoreUseVC.h"

#import "MJCSegmentInterface.h"
#import "UITestViewController.h"
#import "UITestViewController1.h"
#import "UITestViewController2.h"
#import "UITestViewController3.h"
#import "UITestViewController4.h"

@interface SegMentInterfaceStyleMoreUseVC ()

@end

@implementation SegMentInterfaceStyleMoreUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 3;
    self.view.backgroundColor = [UIColor redColor];
    
    
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor redColor];
    
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //创建标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    //经典样式(如果你什么都不自定义设置,只需几句代码,帮你创建了经典样式的标题栏)
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStyleMoreUse];
    
//    segmentInterface.tabItemImageNormal = [segmentInterface imageWithColor:[UIColor orangeColor]];
    //点击状态下的背景图片(如果你不想用图片,想要用颜色,我也提供一个方法)
//    segmentInterface.tabItemImageSelected = [segmentInterface imageWithColor:[UIColor blueColor]];    
    
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
    
}


@end
