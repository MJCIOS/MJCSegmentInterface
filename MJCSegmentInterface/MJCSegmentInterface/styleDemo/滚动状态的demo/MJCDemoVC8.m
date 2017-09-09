//
//  MJCDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC8.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC8 ()

@end

@implementation MJCDemoVC8

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 64, self.view.jc_width,200);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    NSArray *imageBackArr =@[@"111",@"222",@"567",@"1111",@"567"];
    NSArray *imageBackArr1 = @[@"567",@"111",@"222",@"1111",@"111"];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,CGRectGetMaxY(view.frame),self.view.jc_width, self.view.jc_height-CGRectGetMaxY(view.frame));
    interFace.itemImageSelected = [UIImage imageNamed:@"food-2"];
    interFace.itemImageNormal = [UIImage imageNamed:@"food"];
    interFace.defaultShowItemCount = 3;
    interFace.itemTextFontSize = 13;
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextSelectedColor = [UIColor purpleColor];
    interFace.titlesViewFrame = CGRectMake(0, 0, self.view.jc_width,50);
    interFace.selectedSegmentIndex = 0;
    interFace.itemBackNormalImage = [UIImage imageNamed:@"222"];
    interFace.itemBackSelectedImage = [UIImage imageNamed:@"456"];
    interFace.itemNormalBackImageArray = imageBackArr;
    interFace.itemSelectedBackImageArray = imageBackArr1;
    interFace.itemImageSize = CGSizeMake(20,20);
    interFace.imageEffectStyles = MJCImageClassicStyle;//item图片类型
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(0,0,10,10);
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(10,10,0,0);
    interFace.itemImageNormalArray = imageArr;
    interFace.itemImageSelectedArray = imageArr1;
    interFace.indicatorColor = [UIColor redColor];
    interFace.indicatorImage =[UIImage imageNamed:@"箭头"];
    interFace.indicatorFrame = CGRectMake(0,0,50,30);
    interFace.indicatorHidden = YES;
    interFace.isChildScollEnabled = YES;
    interFace.isChildScollAnimal = YES;
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:20];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}


@end
