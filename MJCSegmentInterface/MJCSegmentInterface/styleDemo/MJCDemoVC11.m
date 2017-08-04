//
//  MJCDemoVC11.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC11.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC11 ()<MJCSegmentDelegate>

@property (nonatomic,weak) MJCSegmentInterface *lala;

@end

@implementation MJCDemoVC11

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
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    _lala = lala;
//    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
//    lala.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    lala.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,100);//顶部标题栏frame
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    lala.selectedSegmentIndex = 4;//默认选中第几个
    lala.defaultShowItemCount = 3;//首页,第一页展示多少个
    lala.delegate = self;
    lala.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    lala.itemTextFontSize = 13;//item文字大小
    lala.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    lala.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    lala.itemBackColor = [UIColor whiteColor];//item背景颜色
    lala.titlesViewBackImage = [UIImage imageNamed:@"appStartBackImage"];//标题栏背景图片
    lala.itemBackNormalImage = [UIImage imageNamed:@"222"];//item普通状态下的背景图片
    lala.itemBackSelectedImage = [UIImage imageNamed:@"456"];//item点击状态下的背景图片
    lala.itemNormalBackImageArray = imageArr;//item普通状态下背景图片数组,(为了让item显示不同的图片)
    lala.itemSelectedBackImageArray = imageArr1;//item点击状态下背景图片数组,(为了让item显示不同的图片)
    lala.itemImageSelected = [UIImage imageNamed:@"food-2"];//item普通状态下图片
    lala.itemImageNormal = [UIImage imageNamed:@"food"];//item点击状态下图片
    lala.itemImageNormalArray = imageArr;//item普通状态下图片数组,(为了让item显示不同的图片)
    lala.itemImageSelectedArray = imageArr1;//item点击状态下图片数组,(为了让item显示不同的图片)
    lala.indicatorColor = [UIColor redColor];//底部指示器颜色
    lala.indicatorImage =[UIImage imageNamed:@"箭头"];//底部指示器图片
    lala.indicatorHidden = NO;//底部指示器是否隐藏
    lala.isChildScollEnabled = YES;//是否手拽滚动子界面
    lala.isChildScollAnimal = YES;//子界面切换是否有动画效果
    lala.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    lala.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    lala.itemImagesEdgeInsets = UIEdgeInsetsMake(10,0,10,0);//item图片位置修改
    lala.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    lala.isFontGradient = YES;//是否渐变
    lala.itemImageSize  = CGSizeMake(10, 10);
    lala.indicatorFrame = CGRectMake(0,lala.titlesViewFrame.size.height - 10,30,10);//指示器位置
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];//是否同意字体放大
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcarrr];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 7;
    button.frame = CGRectMake(0, 200, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(__lalal:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface;
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childViewController);
    NSLog(@"%@",segmentInterface);
}

-(void)__lalal:(UIButton *)button
{
    if (button.tag ==0) {
        _lala.selectedSegmentIndex = button.tag;
        button.tag = 7; 
    }else{
        _lala.selectedSegmentIndex = button.tag;
        button.tag = 0;
    }
}


@end
