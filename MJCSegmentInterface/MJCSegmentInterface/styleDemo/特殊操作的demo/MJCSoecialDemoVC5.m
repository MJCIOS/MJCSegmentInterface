//
//  MJCSoecialDemoVC5.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/31.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC5.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC5 ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSoecialDemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
    
    
    //标题数据
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    
    //创建添加控制器对象
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        MJCTestTableViewController *vc = [MJCTestTableViewController new];
        vc.title = titlesArr[i];
        NSMutableDictionary *dic = _mainArr[i];
        vc.testData = dic[@"userNm"];
        [vcArr addObject:vc];
    }

    
    //    //    有新手反应看不懂下方的写法,特地写了一份这种的最笨的写法...
//    NSMutableDictionary *testdic;
//    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
//    vc1.title = titlesArr[0];
//    testdic = _mainArr[0];
//    vc1.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
//    vc2.title = titlesArr[1];
//    testdic = _mainArr[1];
//    vc2.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc3 = [[MJCTestTableViewController alloc]init];
//    vc3.title = titlesArr[2];
//    testdic = _mainArr[2];
//    vc3.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc4 = [[MJCTestTableViewController alloc]init];
//    vc4.title = titlesArr[3];
//    testdic = _mainArr[3];
//    vc4.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc5 = [[MJCTestTableViewController alloc]init];
//    vc5.title = titlesArr[4];
//    testdic = _mainArr[4];
//    vc5.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc6 = [[MJCTestTableViewController alloc]init];
//    vc6.title = titlesArr[5];
//    testdic = _mainArr[5];
//    vc6.testData = testdic[@"userNm"];
//    MJCTestTableViewController *vc7 = [[MJCTestTableViewController alloc]init];
//    vc7.title = titlesArr[6];
//    testdic = _mainArr[6];
//    vc7.testData = testdic[@"userNm"];
//    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];

    
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    interFace.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,60);//顶部标题栏frame
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    interFace.defaultShowItemCount = 4;//首页,第一页展示多少个
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
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];

    
}



@end
