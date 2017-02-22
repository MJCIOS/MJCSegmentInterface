//
//  MJCSegmentFaceController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/19.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController6.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController6 ()<MJCSlideSwitchViewDelegate>

@end

@implementation MJCDemoController6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 2;
    
    
    //    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.MJCSeMentTitleBarStyle = MJCSegMentTitlesClassicStyle;
    
    segmentInterface.slideDelegate = self;
    
    segmentInterface.childViewScollAnimal = YES;//是否有滚动动画
    segmentInterface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    //子界面大小
    segmentInterface.childViewframe = CGRectMake(10,MJCTitlesViewH + 10, MJCScreenWidth - 20, MJCScreenHeight);
    
#pragma mark -- 标题栏的属性
    segmentInterface.titleViewColor = [UIColor redColor];
    segmentInterface.titleViewframe = CGRectMake(10, 10, MJCScreenWidth - 20, 50);//滚动标题的位置大小
    
#pragma mark -- 底部指示器属性
    //    segmentInterface.indicatorWidth = 80;
    //    segmentInterface.indicatorColor = [UIColor purpleColor];
    //    segmentInterface.indicatorFrame = CGRectMake(0,0,100, 10);
    //    segmentInterface.indicatorHidden = NO;
    
#pragma mark -- 顶部横线属性
    segmentInterface.topViewColor = [UIColor purpleColor];
    segmentInterface.topViewHegiht = 5;
    segmentInterface.topViewHidden = NO;
    //    segmentInterface.topViewFrame = CGRectMake(0,30, MJCScreenWidth, 20);
    
#pragma mark -- 底部横线属性
    segmentInterface.bottomViewColor = [UIColor blackColor];
    segmentInterface.bottomViewHegiht = 5;
    segmentInterface.bottomViewHidden = NO;
    //    segmentInterface.bottomViewFrame = CGRectMake(0, 30, MJCScreenWidth, 10);
    
#pragma mark -- 标签选项属性
    segmentInterface.tabItemBackColor = [UIColor orangeColor];
    segmentInterface.tabItemWidth = 80;//这个是给滚动标题栏使用的
    //    segmentInterface.tabItemFrame = CGRectMake(10,10,50, 40);
    segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    segmentInterface.tabItemTitleNormalColor = [UIColor purpleColor];
    segmentInterface.tabItemTitleSelectedColor = [UIColor redColor];
    segmentInterface.tabItemBackImageNormal = [UIImage imageNamed:@"diamond"];
    segmentInterface.tabItemBackImageSelected = [UIImage imageNamed:@"diamond-2"];
    
    NSArray *imageArr = @[@"123",
                          @"234",
                          @"345",
                          @"456",
                          @"567"];
    NSArray *imageArr1 = @[@"666",@"777",@"888",@"999",@"1111"];
    
    segmentInterface.tabItemBackImageNormalArray = imageArr;
    segmentInterface.tabItemBackImageSelectedArray = imageArr1;
    
    
#pragma mark -- 竖线属性
    segmentInterface.verticalLineColor = [UIColor purpleColor];
    segmentInterface.verticalLineHegiht = 30;
    segmentInterface.verticalLineHidden = NO;
    
    [segmentInterface intoTitlesArray:titlesArr];
    
    [self.view addSubview:segmentInterface];
    
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentInterface intoChildViewController:vc hostMainController:self];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface intoChildViewController:vc1 hostMainController:self];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface intoChildViewController:vc2 hostMainController:self];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    [segmentInterface intoChildViewController:vc3 hostMainController:self];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc4 hostMainController:self];
    
    
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
