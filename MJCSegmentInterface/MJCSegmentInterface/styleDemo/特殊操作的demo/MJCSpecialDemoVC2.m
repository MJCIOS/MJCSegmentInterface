
//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/3.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC2.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC2 ()<MJCSegmentDelegate>

@property (weak, nonatomic) IBOutlet MJCSegmentInterface *interFace;

@end

@implementation MJCSpecialDemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc8 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"诛仙世界",@"飞车",@"炫舞",@"天涯"];
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    
    //以下是我的控件中的代码
    _interFace.titleBarStyles = MJCTitlesScrollStyle;
    _interFace.titlesViewFrame = CGRectMake(0,0,MJCScreenWidth,100);//顶部标题栏frame
    _interFace.selectedSegmentIndex = 0;//默认选中第几个
    _interFace.defaultShowItemCount = 3;//首页,第一页展示多少个
    _interFace.delegate = self;
    _interFace.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    _interFace.itemTextFontSize = 13;//item文字大小
    _interFace.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    _interFace.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    _interFace.itemBackColor = [UIColor whiteColor];//item背景颜色
    _interFace.titlesViewBackImage = [UIImage imageNamed:@"appStartBackImage"];//标题栏背景图片
    _interFace.itemBackNormalImage = [UIImage imageNamed:@"222"];//item普通状态下的背景图片
    _interFace.itemBackSelectedImage = [UIImage imageNamed:@"456"];//item点击状态下的背景图片
    _interFace.itemNormalBackImageArray = imageArr;//item普通状态下背景图片数组,(为了让item显示不同的图片)
    _interFace.itemSelectedBackImageArray = imageArr1;//item点击状态下背景图片数组,(为了让item显示不同的图片)
    _interFace.itemImageSelected = [UIImage imageNamed:@"food-2"];//item普通状态下图片
    _interFace.itemImageNormal = [UIImage imageNamed:@"food"];//item点击状态下图片
    _interFace.itemImageNormalArray = imageArr;//item普通状态下图片数组,(为了让item显示不同的图片)
    _interFace.itemImageSelectedArray = imageArr1;//item点击状态下图片数组,(为了让item显示不同的图片)
    _interFace.indicatorColor = [UIColor redColor];//底部指示器颜色
    _interFace.indicatorImage = [UIImage imageNamed:@"箭头"] ;//底部指示器图片
    _interFace.indicatorHidden = NO;//底部指示器是否隐藏
    _interFace.isChildScollEnabled = YES;//是否手拽滚动子界面
    _interFace.isChildScollAnimal = YES;//子界面切换是否有动画效果
    _interFace.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    _interFace.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    
    _interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(10,0,10,0);//item图片位置修改
    _interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    _interFace.isFontGradient = YES;
    _interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    _interFace.indicatorFrame = CGRectMake(0,20,30,10);//指示器位置
    [_interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];//是否同意字体放大
//    [_interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
    [_interFace intoTitlesArray:titlesArr hostController:self];
    [_interFace intoChildControllerArray:vcarrr];
    
}


-(void)dealloc
{
    NSLog(@"销毁了");
}


@end
