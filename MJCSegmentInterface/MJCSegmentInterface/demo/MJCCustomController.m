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
    
    
    //    有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.scrollTitlesEnabled = YES;
    segmentInterface.slideDelegate = self;
    
    //创建标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    //经典样式(如果你什么都不自定义设置,只需几句代码,帮你创建了经典样式的标题栏)
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStyleClassic];
    segmentInterface.indicatorHidden = NO;
    segmentInterface.bottomViewHidden = NO;
    segmentInterface.rightViewShow = NO;
    segmentInterface.childViewEnabled = YES;
    segmentInterface.rightMostBtnShow = YES;
    segmentInterface.childViewScollAnimal = YES;
    
    segmentInterface.titleScrollColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    segmentInterface.tabItemBackColor = [UIColor clearColor];
    
    segmentInterface.isOpenJump = YES;
    segmentInterface.rightMostBtnColor = [UIColor whiteColor];
    segmentInterface.rightMostBtnImage = [UIImage imageNamed:@"向右箭头"];
    segmentInterface.mostLeftPosition = [UIImage imageNamed:@"向右箭头"];
    segmentInterface.mostRightPosition = [UIImage imageNamed:@"向左箭头"];
    
    //在添加标题栏之前做其他操作
    [segmentInterface intoTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    
    
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    
    [segmentInterface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    [segmentInterface intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    [segmentInterface intoChildViewController:vc3];
    
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc4];
    
    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc5];
    
    UITestViewController4 *vc6 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc6];
    
    UITestViewController1 *vc7 = [[UITestViewController1 alloc]init];
    [segmentInterface intoChildViewController:vc7];
    
}


/**
 * 点击item的时候调用的代理方法
 */
-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    if (titleButton.tag == 1) {
        [titleButton setTitle:@"代理方法" forState:UIControlStateNormal];
    }else{
        [titleButton setTitle:@"请看代码" forState:UIControlStateNormal];
    }
}

/**
 *  当isOpenJump为NO的时候,点击左右切换界面效果无效,会走代理方法
 *  这个代理方法就是让你自己处理最右边按钮实现的效果...可用来耶耶耶
 */
-(void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    UITestViewController *vc = [UITestViewController new];
        [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}

/** 在拖拽界面滚动结束时, 就会调用这个方法  */
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
