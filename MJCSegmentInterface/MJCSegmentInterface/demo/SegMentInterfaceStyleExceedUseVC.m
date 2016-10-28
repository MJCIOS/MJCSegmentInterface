//
//  SegMentInterfaceStyleExceedUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleExceedUseVC.h"

#import "MJCSegmentInterface.h"
#import "UITestViewController.h"
#import "UITestViewController1.h"
#import "UITestViewController2.h"
#import "UITestViewController3.h"
#import "UITestViewController4.h"


@interface SegMentInterfaceStyleExceedUseVC ()

@end

@implementation SegMentInterfaceStyleExceedUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 5;
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    //    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    ////    }
    self.view.backgroundColor = [UIColor redColor];
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.navigationController.navigationBar setHidden:YES];
    
    
    
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //创建标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStyleExceedUse];
    
    
    //在添加标题栏之前做其他操作
    [segmentInterface addTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentInterface setAddChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface setAddChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface setAddChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;
    [segmentInterface setAddChildViewController:vc3];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface setAddChildViewController:vc4];
    
}



@end
