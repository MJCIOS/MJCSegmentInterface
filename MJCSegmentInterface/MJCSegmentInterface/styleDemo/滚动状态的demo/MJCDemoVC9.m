//
//  MJCDemoVC11.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC9.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC9 ()<MJCSegmentDelegate>

@property (nonatomic,weak) MJCSegmentInterface *interFace;

@end

@implementation MJCDemoVC9

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
    NSArray *backimageArr =@[@"111",@"222",@"1111",@"234",@"567",@"666",@"888"];
    NSArray *backimageArr1 = @[@"123",@"333",@"345",@"456",@"777",@"999",@"555"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    NSArray *colorArr = @[[UIColor redColor],[UIColor blackColor],[UIColor purpleColor],[UIColor lightGrayColor],[UIColor orangeColor]];
    NSArray *colorArr1 = @[[UIColor blackColor],[UIColor redColor],[UIColor lightGrayColor],[UIColor purpleColor],[UIColor yellowColor]];
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle] ;
    _interFace = interFace;
    interFace.titlesViewFrame = CGRectMake(0,0,self.view.jc_width,60);//顶部标题栏frame
    interFace.indicatorStyles = MJCIndicatorItemStyle;
    interFace.selectedSegmentIndex = 4;//默认选中第几个
    interFace.defaultShowItemCount = 3;//首页,第一页展示多少个
    interFace.delegate = self;
    interFace.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    interFace.itemTextFontSize = 13;//item文字大小
    interFace.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    interFace.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    interFace.itemBackColor = [UIColor orangeColor];//item背景颜色
    interFace.titlesViewBackImage = [UIImage imageNamed:@"back"];//标题栏背景图片
    interFace.itemBackNormalImage = [UIImage imageNamed:@"222"];//item普通状态下的背景图片
    interFace.itemBackSelectedImage = [UIImage imageNamed:@"456"];//item点击状态下的背景图片
    interFace.itemNormalBackImageArray = backimageArr;//item普通状态下背景图片数组,(为了让item显示不同的图片)
    interFace.itemSelectedBackImageArray = backimageArr1;//item点击状态下背景图片数组,(为了让item显示不同的图片)
    interFace.itemImageSelected = [UIImage imageNamed:@"food-2"];//item普通状态下图片
    interFace.itemImageNormal = [UIImage imageNamed:@"food"];//item点击状态下图片
    interFace.itemImageNormalArray = imageArr1 ;//item普通状态下图片数组,(为了让item显示不同的图片)
    interFace.itemImageSelectedArray = imageArr;//item点击状态下图片数组,(为了让item显示不同的图片)
    interFace.indicatorColor = [UIColor redColor];//底部指示器颜色
    interFace.indicatorImage =[UIImage imageNamed:@"箭头"];//底部指示器图片
    interFace.indicatorHidden = NO;//底部指示器是否隐藏
    interFace.isChildScollEnabled = YES;//是否手拽滚动子界面
    interFace.isChildScollAnimal = YES;//子界面切换是否有动画效果
    interFace.isIndicatorFollow = YES;//底部指示器是否随着滑动而跟随
    interFace.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:NO];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0, 10, 0, 10, 10);
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(10,10,10,0);//item图片位置修改
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(10,10,10,10);//item文字位置修改
    interFace.isFontGradient = YES;//是否渐变
    interFace.isItemTitleTextHidden = NO;
    interFace.isPenetrationEffect = NO;
    interFace.isIndicatorColorEqualTextColor = YES;
    interFace.childsContainerBackColor = [UIColor redColor];
    interFace.itemImageSize  = CGSizeMake(15,15);
    interFace.indicatorFrame = CGRectMake(0,interFace.titlesViewFrame.size.height - 10,30,10);//指示器位置
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];//是否同意字体放大
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:NO];
    interFace.itemTitleNormalColorArray = colorArr;
    interFace.itemTitleSelectedColorArray = colorArr1;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}
-(void)mjc_scrollDidEndDeceleratingWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController indexPage:(NSInteger)indexPage segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%ld",indexPage);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}
-(void)mjc_cancelClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}
-(void)mjc_tabitemDataWithTabitemArray:(NSArray<UIButton *> *)tabItemArray childsVCAarray:(NSArray<UIViewController *> *)childsVCAarray segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%@",tabItemArray);
    NSLog(@"%@",childsVCAarray);
    NSLog(@"%@",segmentInterface);
}
    
-(void)dealloc
{
    NSLog(@"%@销毁了",self);
}
@end
