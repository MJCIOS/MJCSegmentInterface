//
//  MJCImageViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCImageViewController.h"
#import "MJCPrefixHeader.pch"

@interface MJCImageViewController ()<MJCSlideSwitchViewDelegate>

@end

@implementation MJCImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger style = 3;

    [MJCSegmentFaceControl useNavOrTabbarNotBeCover:self];
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *intoView = segmentsface.intoFaceView;
//    segmentsface.faceViewFrame = CGRectMake(0,64,MJCScreenWidth, MJCScreenHeight);
    segmentsface.slideDelegate = self;
    segmentsface.interFaceControlStyle = SegMentInterfaceStylePenetrate;//样式
    segmentsface.indicatorStyle = SegMentIndicatorItemTextStyle;
    segmentsface.imageEffectStyle = MJCImageUpDownStyle;
    segmentsface.scrollTitlesEnabled = YES;//标题栏是否滚动
    segmentsface.childViewScollAnimal = YES;//是否有滚动动画
    segmentsface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    
    
#pragma mark -- 标题栏的属性
    segmentsface.titleScrollColor = [UIColor clearColor];
    segmentsface.titlesViewColor = [UIColor clearColor];//标题栏颜色
    
#pragma mark -- 标签选项属性
    segmentsface.tabItemWidth = 80;//这个是给滚动标题栏使用的
    //    segmentsface.tabItemFrame = CGRectMake(10,10,50, 40);
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    segmentsface.tabItemTitleNormalColor = [UIColor blackColor];
    segmentsface.tabItemTitleSelectedColor = [UIColor yellowColor];
    //    segmentsface.tabItemImageNormal = [UIImage imageNamed:@"diamond"];
    //    segmentsface.tabItemImageSelected = [UIImage imageNamed:@"diamond-2"];
    
    NSArray *imageArr = @[@"bulb-2",
                          @"cloud-2",
                          @"diamond-2",
                          @"food-2",
                          @"heart-2",
                          @"phone-2",
                          @"paperplane-2",
                          @"like-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone",@"paperplane",@"like"];
    
    segmentsface.tabItemImageNormalArray = imageArr;
    segmentsface.tabItemImageSelectedArray = imageArr1;
    
#pragma mark -- 竖线属性
    segmentsface.verticalLineShow = YES;
    segmentsface.verticalLineColor = [UIColor blackColor];
    segmentsface.verticalLineHegiht = 30;
//    segmentsface.verticalLineHidden = NO;
    
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:intoView];
    
    
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
    vc7.style = style;
    [segmentsface intoChildViewController:vc7];
    
    
}


-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    
    if (titleButton.tag == 1) {
        [titleButton setTitle:@"代理方法" forState:UIControlStateNormal];
    }else{
        [titleButton setTitle:@"请看代码" forState:UIControlStateNormal];
    }
}

-(void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    [self setupButton:button];
}


-(void)setupButton:(UIButton *)button
{
    if (button.tag == 0) {
        button.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.7];
    }else if (button.tag == 1){
        button.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0];
    }else if (button.tag == 2){
        button.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    }else if (button.tag == 3){
        button.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    }else{
        button.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.7];
    }
    
}



@end
