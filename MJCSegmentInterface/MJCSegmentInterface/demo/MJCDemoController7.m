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
@property (nonatomic,strong) MJCSegmentInterface *segmentInterface;

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger style;


/** <#  注释  #> */
@property (nonatomic,strong) UITestViewController *vc;


@end

@implementation MJCDemoController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    _style = style;
    
    
    [MJCToolClasses useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.MJCTitleBarStyles = MJCTitlesScrollStyle;
    segmentInterface.MJCImageEffectStyle = MJCImageUpDownStyle;
    _segmentInterface = segmentInterface;
    segmentInterface.slideDelegate = self;
    segmentInterface.childViewScollAnimal = YES;//是否有滚动动画
    segmentInterface.childScollEnabled = YES;//子界面是否用手拖拽滚动
    
//    segmentInterface.zoomBigEnabled = YES;
    
#pragma mark -- 标题栏的属性
    segmentInterface.titleViewColor = [UIColor clearColor];
    
#pragma mark -- 标签选项属性
    segmentInterface.tabItemWidth = 100;//这个是给滚动标题栏使用的
    segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    segmentInterface.tabItemTitleNormalColor = [UIColor blackColor];
    segmentInterface.tabItemTitleSelectedColor = [UIColor yellowColor];
    
    NSArray *imageArr =@[@"bulb-2",
                         @"cloud-2",
                         @"diamond-2",
                         @"food-2",
                         @"heart-2",
                         @"phone-2",
                         @"paperplane-2",
                         @"like-2"];
    
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone",@"paperplane",@"like"];
    
    segmentInterface.tabItemImageNormalArray = imageArr;
    segmentInterface.tabItemImageSelectedArray = imageArr1;
    

    
    [segmentInterface intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:segmentInterface];
    
    
    /** 添加控制器 */
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
    
    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc5];
    
    UITestViewController4 *vc6 = [[UITestViewController4 alloc]init];
    [segmentInterface intoChildViewController:vc6];
    
    UITestViewController1 *vc7 = [[UITestViewController1 alloc]init];
    vc7.style = style;
    [segmentInterface intoChildViewController:vc7];
    
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
