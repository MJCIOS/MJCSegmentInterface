//
//  MJCTESTViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTESTViewController.h"
#import "MJCChildScrollView.h"
#import "MJCTitlesView.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"
#import "MJCSegmentFaceControl.h"


@interface MJCTESTViewController ()<MJCSlideSwitchViewDelegate>


/** <#  注释  #> */
@property (nonatomic,strong) MJCSegmentFaceControl *segmentsface;

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger style;


/** <#  注释  #> */
@property (nonatomic,strong) UITestViewController *vc;



@end

@implementation MJCTESTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 4;
    _style = style;

    
//    NSArray *titlesArr = @[@"啦啦",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    NSArray *titlesArr = @[@"啦啦",@"啪啪"];
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    UIView *intoView = [segmentsface intoFaceView:SegMentInterfaceStyleNavBar];
    
    segmentsface.slideDelegate = self;

    segmentsface.indicatorStyle = SegMentIndicatorItemTextStyle;
    
//    segmentsface.childViewScollAnimal = YES;//是否有滚动动画
//    segmentsface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    
    //子界面大小
//    segmentsface.childViewframe = CGRectMake(10,MJCTitlesViewH + 10, MJCScreenWidth - 20, MJCScreenHeight);
    
#pragma mark -- 标题栏的属性
//    segmentsface.titleScrollColor = [UIColor redColor];
//    segmentsface.titleScrollframe = CGRectMake(0,0,MJCScreenWidth,30);//滚动标题的位置大小
    segmentsface.titlesViewColor = [UIColor orangeColor];//标题栏颜色
    segmentsface.titlesViewframe = CGRectMake(0,0,150,30);//普通标题栏的大小
    
    
#pragma mark -- 底部指示器属性
        segmentsface.indicatorWidth = 80;
        segmentsface.indicatorColor = [UIColor whiteColor];
//        segmentsface.indicatorFrame = CGRectMake(0,0,100,10);
        segmentsface.indicatorHidden = YES;
    
#pragma mark -- 顶部横线属性
    segmentsface.topViewColor = [UIColor purpleColor];
    segmentsface.topViewHegiht = 5;
    segmentsface.topViewHidden = YES;
//        segmentsface.topViewFrame = CGRectMake(0,0,MJCScreenWidth,20);
    
#pragma mark -- 底部横线属性
    segmentsface.bottomViewColor = [UIColor blackColor];
    segmentsface.bottomViewHegiht = 5;
    segmentsface.bottomViewHidden = YES;
    //    segmentsface.bottomViewFrame = CGRectMake(0, 30, MJCScreenWidth, 10);
    
#pragma mark -- 标签选项属性
//    segmentsface.tabItemBackColor = [UIColor orangeColor];
//    segmentsface.tabItemWidth = 80;//这个是给滚动标题栏使用的
//        segmentsface.tabItemFrame = CGRectMake(10,10,50, 40);
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:13];
    
    segmentsface.tabItemTitleNormalColor = [UIColor whiteColor];
    segmentsface.tabItemTitleSelectedColor = [UIColor whiteColor];
//
    
    segmentsface.tabItemBackImageNormal = [MJCSegmentFaceControl imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
    segmentsface.tabItemBackImageSelected = [MJCSegmentFaceControl imageWithColor:MJCRGBColor(16, 28, 57, 1.0)];

    
#pragma mark -- 竖线属性
    segmentsface.verticalLineColor = [UIColor purpleColor];
    segmentsface.verticalLineHegiht = 100;
    segmentsface.verticalLineHidden = NO;
    
    
    UIView *titlesView =  [segmentsface intoTitlesFace:titlesArr];
    titlesView.layer.masksToBounds = YES;
    titlesView.layer.cornerRadius = 3;
    
    self.navigationItem.titleView = titlesView;
    
    [self.view addSubview:intoView];

    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    _vc = vc;
    [segmentsface intoChildViewController:vc];
    
    UITestViewController3 *vc1 = [[UITestViewController3 alloc]init];
    vc1.style = style;
    [segmentsface intoChildViewController:vc1];
    UITestViewController *vc2 = [[UITestViewController alloc]init];
    _vc = vc2;
    [segmentsface intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;
    [segmentsface intoChildViewController:vc3];

    UITestViewController *vc4 = [[UITestViewController alloc]init];
    _vc = vc4;
    [segmentsface intoChildViewController:vc4];
    
    UITestViewController3 *vc5 = [[UITestViewController3 alloc]init];
    vc5.style = style;
    [segmentsface intoChildViewController:vc5];

    

}

-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    
    
    if (titleButton.tag == 1) {
        [titleButton setTitle:@"消息" forState:UIControlStateNormal];
    }else{
        [titleButton setTitle:@"电话" forState:UIControlStateNormal];
    }
    
    
    [_vc loadData:(int)titleButton.tag];
    
//    [self setupButton:titleButton];
}


-(void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    //    [self setupButton:button];
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
