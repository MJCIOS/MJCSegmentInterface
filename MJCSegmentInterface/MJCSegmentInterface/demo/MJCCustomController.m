//
//  MJCCustomController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/16.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCCustomController.h"
#import "MJCPrefixHeader.pch"

@interface MJCCustomController ()<MJCSlideSwitchViewDelegate>

@end

@implementation MJCCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *view1 = segmentsface.intoFaceView;
    segmentsface.slideDelegate = self;
    segmentsface.interFaceControlStyle = SegMentInterfaceStyleClassic;//样式
    segmentsface.indicatorStyle = SegMentIndicatorItemTextStyle;
    segmentsface.scrollTitlesEnabled = YES;//标题栏是否滚动
    segmentsface.childViewScollAnimal = YES;//是否有滚动动画
    segmentsface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    
    //(自定义)子界面大小
//    segmentsface.childViewframe = CGRectMake(10,MJCTitlesViewH + 10, MJCScreenWidth - 20, MJCScreenHeight);
    
#pragma mark -- 标题栏的属性
//    segmentsface.titleCenterMargin = 20;//标题居中间距
    segmentsface.titleScrollColor = [UIColor redColor];
//    segmentsface.titleScrollframe = CGRectMake(10, 10, MJCScreenWidth - 20, 50);//(自定义)滚动标题的位置大小
    segmentsface.titlesViewColor = [UIColor redColor];//标题栏颜色
//    segmentsface.titlesViewframe = CGRectMake(10, 10, MJCScreenWidth - 20, 50);//(自定义)普通标题栏的大小
    
    
#pragma mark -- 底部指示器属性
    //    segmentsface.indicatorWidth = 80;
    //    segmentsface.indicatorColor = [UIColor purpleColor];
    //    segmentsface.indicatorFrame = CGRectMake(0,0,100, 10);
    //    segmentsface.indicatorHidden = NO;
    
#pragma mark -- 顶部横线属性
    segmentsface.topViewColor = [UIColor purpleColor];
    segmentsface.topViewHegiht = 5;
    segmentsface.topViewHidden = NO;
    //    segmentsface.topViewFrame = CGRectMake(0,30, MJCScreenWidth, 20);
    
#pragma mark -- 底部横线属性
    segmentsface.bottomViewColor = [UIColor blackColor];
    segmentsface.bottomViewHegiht = 5;
    segmentsface.bottomViewHidden = NO;
    //    segmentsface.bottomViewFrame = CGRectMake(0, 30, MJCScreenWidth, 10);
    
#pragma mark -- 标签选项属性
    segmentsface.tabItemBackColor = [UIColor orangeColor];
    segmentsface.tabItemWidth = 100;//(只限于)滚动标题使用
    //    segmentsface.tabItemFrame = CGRectMake(10,10,50, 40);
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    segmentsface.tabItemTitleNormalColor = [UIColor purpleColor];
    segmentsface.tabItemTitleSelectedColor = [MJCSegmentFaceControl colorFromHexRGB:@"#CC00FF"];
    segmentsface.tabItemImageNormal = [MJCSegmentFaceControl imageWithColor:[[UIColor yellowColor] colorWithAlphaComponent:0.3]];
    segmentsface.tabItemImageSelected = [MJCSegmentFaceControl imageWithColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
    
    //    NSArray *imageArr = @[@"555",@"666",@"567",@"啪啪",@"啪啪"];
    //    NSArray *imageArr1 = @[@"999",@"888",@"777",@"啪啪",@"啪啪"];
    //    segmentsface.tabItemImageNormalArray = imageArr;
    //    segmentsface.tabItemImageSelectedArray = imageArr1;
    
    
#pragma mark -- 竖线属性
    //    segmentsface.verticalLineShow = YES;
    segmentsface.verticalLineColor = [UIColor purpleColor];
    segmentsface.verticalLineHegiht = 30;
    segmentsface.verticalLineHidden = NO;
    
#pragma mark -- 最右边滚动切换按钮属性
    segmentsface.rightMostBtnShow = YES;
    segmentsface.isOpenJump = YES;
    //    segmentsface.rightMostBtnFrame = CGRectMake(MJCScreenWidth-50/2 - 15,15,25,50 - 10);
    segmentsface.rightMostBtnColor = [UIColor clearColor];
    segmentsface.rightMostBtnImage = [UIImage imageNamed:@"向右箭头"];
    segmentsface.mostLeftPosition = [UIImage imageNamed:@"向左箭头"];
    segmentsface.mostRightPosition = [UIImage imageNamed:@"向右箭头"];
    
//    segmentsface.rightBtnTopMargin = 10;
//    segmentsface.rightBtnRightMargin = 0;
    
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:view1];
    
    
    /** 添加控制器 */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentsface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    [segmentsface intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentsface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
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

-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    if (titleButton.tag == 1) {
        [titleButton setTitle:@"代理方法" forState:UIControlStateNormal];
    }else{
        [titleButton setTitle:@"请看代码" forState:UIControlStateNormal];
    }
}

-(void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    UITestViewController *vc = [UITestViewController new];
    //        [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
    
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
