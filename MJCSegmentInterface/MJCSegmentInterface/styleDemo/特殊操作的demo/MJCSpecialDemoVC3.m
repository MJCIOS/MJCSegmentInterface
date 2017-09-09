//
//  MJCSpecialDemoVC3.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC3.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC3 ()<MJCSegmentDelegate>

@property (nonatomic,weak) MJCSegmentInterface *interFace;


/** <#  注释  #> */
@property (nonatomic,weak) NSArray *titlesArr;

@end

@implementation MJCSpecialDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯",@"诛仙世界"];
    _titlesArr = titlesArr;
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    _interFace = interFace;
    interFace.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,60);//顶部标题栏frame
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    interFace.defaultShowItemCount = 3;//首页,第一页展示多少个
    interFace.delegate = self;
    interFace.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    interFace.itemTextFontSize = 13;//item文字大小
    interFace.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    interFace.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    interFace.itemBackColor = [UIColor whiteColor];//item背景颜色
    interFace.indicatorHidden = NO;//底部指示器是否隐藏
    interFace.isChildScollEnabled = YES;//是否手拽滚动子界面
    interFace.isChildScollAnimal = YES;//子界面切换是否有动画效果
    interFace.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    interFace.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(10,0,10,0);//item图片位置修改
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    interFace.isFontGradient = YES;//是否渐变
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];//是否同意字体放大
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我有意外惊喜" forState:UIControlStateNormal];
    button.frame = CGRectMake(0,0, 0, 0);
    [button sizeToFit];
    button.jc_centerX = self.view.jc_centerX;
    button.jc_centerY = self.view.jc_centerY;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}

-(void)btnClick:(UIButton *)button
{
    if (button.tag >= _titlesArr.count -1) {
        button.tag = 0;
        _interFace.selectedSegmentIndex = button.tag;
    }else{
        button.tag += 1;
        _interFace.selectedSegmentIndex = button.tag;
    }
}


@end
