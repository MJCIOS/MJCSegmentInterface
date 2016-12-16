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
//    有导航栏或者tabbar时,保证标题栏不会被覆盖
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //创建标题栏
    NSArray *titlesArr = @[@"我爱你一辈子",@"你爱我怕啪啪"];
    
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStyleClassic];
    segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:15];
    
    
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
    
}



@end
