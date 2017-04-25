//
//  MJCTESTViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController8.h"
#import "MJCChildScrollView.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"


@interface MJCDemoController8 ()<MJCSlideSwitchViewDelegate>



/** <#  注释  #> */
@property (nonatomic,assign) NSInteger style;


/** <#  注释  #> */
@property (nonatomic,strong) UITestViewController *vc;



@end

@implementation MJCDemoController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
//    NSInteger style = 4;
//    _style = style;
//
//
//    //    NSArray *titlesArr = @[@"啦啦",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
//    
////    [MJCToolClasses useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
//    
//    NSArray *titlesArr = @[@"啦啦",@"啪啪"];
//    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
//    segmentInterface.MJCTitleBarStyles = MJCTitlesNavBarStyle;
//
//    //    segmentsface.MJCIndicatorStyle = MJCIndicatorItemTextStyle;
//    //    segmentsface.titlesScrollEnabled = YES;
//    //    segmentsface.childViewScollAnimal = YES;//是否有滚动动画
//    segmentInterface.slideDelegate = self;
//    
//    segmentInterface.childScollEnabled = YES;//子界面是否用手拖拽滚动
//
//    segmentInterface.titleViewframe = CGRectMake(0,0,180,30);
//    segmentInterface.titleViewColor = [UIColor redColor];
//    segmentInterface.zoomBigEnabled = YES;
//    
//    UIView *titlesView =  [segmentInterface intoFaceView];
//    titlesView.layer.masksToBounds = YES;
//    titlesView.layer.cornerRadius = 5;
//    titlesView.layer.borderWidth = 2;//边框线
//    CGColorRef borderColorRef = [UIColor whiteColor].CGColor;//边框线颜色
//    titlesView.layer.borderColor = borderColorRef;
//    self.navigationItem.titleView = titlesView;
//    
//    
//    
//    
//    [segmentInterface intoTitlesArray:titlesArr];
//    [self.view addSubview:segmentInterface];
//    
//    /** 添加控制器 */
//    UITestViewController *vc = [[UITestViewController alloc]init];
//    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
//    vc1.style = style;
//    
//    
//    
//    [segmentInterface intoChildViewController:vc hostMainController:self];
//    [segmentInterface intoChildViewController:vc1 hostMainController:self];
//    
//    segmentInterface.selectedSegmentIndex = 1;

    
    
//    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
//    [segmentInterface intoChildViewController:vc2 hostMainController:self];
//    
//    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
//    vc3.style = style;
//    [segmentInterface intoChildViewController:vc3 hostMainController:self];
//    
//    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
//    [segmentInterface intoChildViewController:vc4 hostMainController:self];
//    
//    UITestViewController4 *vc5 = [[UITestViewController4 alloc]init];
//    [segmentInterface intoChildViewController:vc5 hostMainController:self];
    
    
    
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
