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
//
    MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
    

    
    UIView *intoView = [segmentsface intoFaceView:SegMentInterfaceStyleNavBar];

    
    segmentsface.tabItemTitlesfont = [UIFont systemFontOfSize:15];

    
    
    segmentsface.slideDelegate = self;
//    segmentsface.interFaceControlStyle = SegMentInterfaceStyleNavBar;
    

    segmentsface.childViewframe = CGRectMake(0,64,MJCScreenWidth, MJCScreenHeight-64);
    segmentsface.titlesViewframe = CGRectMake(0,0,200,30);
    
    
//    segmentsface.tabItemBackImageNormal = [UIImage imageNamed:@"123"];
//    segmentsface.tabItemBackImageSelected = [UIImage imageNamed:@"333"];

    

    
//    segmentsface.tabItemBackColor = [UIColor redColor];
//    segmentsface.verticalLineHidden = NO;
//    segmentsface.verticalLineColor = [UIColor blackColor];
//    segmentsface.verticalLineHegiht = 100;
//    segmentsface.topViewHidden = NO;
//    segmentsface.topViewHegiht = 5;
//    segmentsface.topViewColor = [UIColor blackColor];
//    segmentsface.tabItemTitleNormalColor = [UIColor blueColor];
    


    segmentsface.tabItemBackImageNormal = [MJCSegmentFaceControl imageWithColor:[UIColor redColor]];
    segmentsface.tabItemBackImageSelected = [MJCSegmentFaceControl imageWithColor:[UIColor blueColor]];

    
    
    //    segmentsface.tabItemImageNormal = [UIImage imageNamed:@"123"];
    
    //    segmentsface.tabItemImageSelected = [UIImage imageNamed:@"333"];
    
    NSArray *imageArr1 = @[@"111",
                           @"222"];
    NSArray *imageArr1111 = @[@"123",@"333"];
    
    
    
//    segmentsface.tabItemImageNormalArray = imageArr1;
//    segmentsface.tabItemImageSelectedArray = imageArr1111;

    
    segmentsface.tabItemBackImageNormalArray = imageArr1;
    segmentsface.tabItemBackImageSelectedArray = imageArr1111;
    
    


    
    UIView *titlesView =  [segmentsface intoTitlesFace:titlesArr];
    
    self.navigationItem.titleView = titlesView;

    

    
    
//    [segmentsface intoTitlesArray:titlesArr];
    
    
    
    [self.view addSubview:intoView];

    
    
//    MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
//    segmentsface.SegmentInterFaceStyle = SegMentInterfaceStyleNavBar;
//    segmentsface.slideDelegate = self;
//    
//    segmentsface.tabItemBackColor = [UIColor redColor];
//    segmentsface.tabItemBackImageNormal = [MJCSegmentInterface imageWithColor:[UIColor redColor]];
//    segmentsface.tabItemBackImageSelected = [MJCSegmentInterface imageWithColor:[UIColor blueColor]];
//    segmentsface.childViewEnabled = YES;
//    segmentsface.topViewHidden = YES;
//    segmentsface.bottomViewHidden = YES;
//    segmentsface.indicatorHidden = YES;
//    segmentsface.scrollTitlesEnabled = YES;
////    segmentsface.rightViewShow = NO;
//    segmentsface.rightViewHidden = YES;
//
//    [segmentsface isChildViewframe:YES childViewframe:CGRectMake(0,64,MJCScreenWidth, MJCScreenHeight)];
//    [segmentsface isTitlesViewframe:YES titlesViewframe:CGRectMake(0,0,150,30)];
//    [segmentsface isTitlesScrollframe:YES titlesScrollframe:CGRectMake(0,0,MJCScreenWidth,30)];
//    
//    
//    
//    UIScrollView *view1 = [segmentsface intoFaceScoll:titlesArr];
//    
//    view1.layer.cornerRadius = 10;//圆角
//    view1.layer.masksToBounds = YES;
//    self.navigationItem.titleView = view1;
//    
//    [self.view addSubview:segmentsface];
//
//    //添加控制器
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
    
//    [titleButton setBackgroundImage:[MJCSegmentFaceControl imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
//    
//    [titleButton setBackgroundImage:[MJCSegmentFaceControl imageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];

    
    if (titleButton.tag == 1) {
        [titleButton setTitle:@"代理" forState:UIControlStateNormal];
    }else{
        [titleButton setTitle:@"请看" forState:UIControlStateNormal];
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
