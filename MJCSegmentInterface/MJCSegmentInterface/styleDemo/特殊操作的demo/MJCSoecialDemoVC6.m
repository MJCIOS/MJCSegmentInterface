//
//  MJCSoecialDemoVC6.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/31.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC6.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC6 ()

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSoecialDemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
 
    NSMutableArray *titlesArr = [NSMutableArray array];
    for (int i = 0 ; i < _mainArr.count; i++) {
        NSMutableDictionary *dic = _mainArr[i];
        [titlesArr addObject:dic[@"userNm"]];
    }
    //创建添加控制器对象
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        MJCTestTableViewController *vc = [MJCTestTableViewController new];
        vc.title = titlesArr[i];
        NSMutableDictionary *dic = _mainArr[i];
        vc.testData = dic[@"userId"];
        [vcArr addObject:vc];
    }

    MJCSegmentInterface *lala = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    lala.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,60);//顶部标题栏frame
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    lala.defaultShowItemCount = 4;//首页,第一页展示多少个
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
