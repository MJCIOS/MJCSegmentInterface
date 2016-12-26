//
//  SegMentInterfaceStyleExceedUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleExceedUseVC.h"
#import "MJCPrefixHeader.pch"


@interface SegMentInterfaceStyleExceedUseVC ()

@end

@implementation SegMentInterfaceStyleExceedUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    

    [MJCSegmentFaceControl useNavOrTabbarNotBeCover:self];
    NSArray *titlesArr = @[@"我爱你一辈子",@"你爱我怕啪啪"];//创建标题栏
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *view1 = [segmentsface intoFaceView:SegMentInterfaceStyleExceedUse];
    segmentsface.scrollTitlesEnabled = NO;
//    segmentsface.interFaceControlStyle = SegMentInterfaceStyleExceedUse;
    segmentsface.childScollEnabled = YES;
    segmentsface.childViewScollAnimal = YES;
    segmentsface.verticalLineHidden = YES;
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:view1];
    
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentsface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentsface intoChildViewController:vc1];
    
}



@end
