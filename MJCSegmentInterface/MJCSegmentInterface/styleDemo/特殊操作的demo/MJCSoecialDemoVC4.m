//
//  MJCSoecialDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/31.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC4.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC4 ()

@end

@implementation MJCSoecialDemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯",@"诛仙世界"];

    //有新手反应看不懂下方的写法,特地写了一份这种的...
    //    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
//    vc1.title = titlesArr[0];
//    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
//    vc2.title = titlesArr[1];
//    MJCTestTableViewController *vc3 = [[MJCTestTableViewController alloc]init];
//    vc3.title = titlesArr[2];
//    MJCTestTableViewController *vc4 = [[MJCTestTableViewController alloc]init];
//    vc4.title = titlesArr[3];
//    MJCTestTableViewController *vc5 = [[MJCTestTableViewController alloc]init];
//    vc5.title = titlesArr[4];
//    MJCTestTableViewController *vc6 = [[MJCTestTableViewController alloc]init];
//    vc6.title = titlesArr[5];
//    MJCTestTableViewController *vc7 = [[MJCTestTableViewController alloc]init];
//    vc7.title = titlesArr[6];
//    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    
    //创建添加控制器对象
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        MJCTestTableViewController *vc = [MJCTestTableViewController new];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }

    MJCSegmentInterface *lala = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    lala.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,60);//顶部标题栏frame
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    lala.defaultShowItemCount = 3;//首页,第一页展示多少个
    lala.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    lala.itemTextFontSize = 13;//item文字大小
    lala.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    lala.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    lala.itemBackColor = [UIColor whiteColor];//item背景颜色
    lala.indicatorHidden = NO;//底部指示器是否隐藏
    lala.isChildScollEnabled = YES;//是否手拽滚动子界面
    lala.isChildScollAnimal = YES;//子界面切换是否有动画效果
    lala.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    lala.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    lala.itemImagesEdgeInsets = UIEdgeInsetsMake(10,0,10,0);//item图片位置修改
    lala.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    lala.isFontGradient = YES;//是否渐变
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];//是否同意字体放大
    [self.view addSubview:lala];
    [lala intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];

    
}


@end
