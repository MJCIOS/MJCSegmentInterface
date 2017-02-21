//
//  MJCImageViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController7.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController7 ()<MJCSlideSwitchViewDelegate>


/** <#  注释  #> */
@property (nonatomic,strong) MJCSegmentInterface *segmentsface;

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger style;


/** <#  注释  #> */
@property (nonatomic,strong) UITestViewController *vc;


@end

@implementation MJCDemoController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 3;
    _style = style;
    
    
    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
    segmentsface.titlesScrollEnabled = YES;
    segmentsface.MJCImageEffectStyle = MJCImageUpDownStyle;
    _segmentsface = segmentsface;
    segmentsface.slideDelegate = self;
    segmentsface.childViewScollAnimal = YES;//是否有滚动动画
    segmentsface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    
    
#pragma mark -- 标题栏的属性
    segmentsface.titleViewColor = [UIColor clearColor];
    
#pragma mark -- 标签选项属性
    segmentsface.tabItemWidth = 100;//这个是给滚动标题栏使用的
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    segmentsface.tabItemTitleNormalColor = [UIColor blackColor];
    segmentsface.tabItemTitleSelectedColor = [UIColor yellowColor];
    
    NSArray *imageArr =@[@"bulb-2",
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
    segmentsface.verticalLineColor = [UIColor blackColor];
    segmentsface.verticalLineHegiht = 30;
    segmentsface.verticalLineHidden = NO;
    
    [segmentsface intoTitlesArray:titlesArr];
    [self.view addSubview:segmentsface];
    
    
    /** 添加控制器 */
    UITestViewController *vc = [[UITestViewController alloc]init];
    _vc = vc;
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
        [titleButton setTitle:@"代理" forState:UIControlStateNormal];
        
    }else{
        [titleButton setTitle:@"请看" forState:UIControlStateNormal];
        
    }
    
    
    if (titleButton.tag == 0) {
        [_vc loadData:(int)titleButton.tag];
    }else{
        [_vc loadData:(int)titleButton.tag];
    }
    
    
    [self setupButton:titleButton];
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
