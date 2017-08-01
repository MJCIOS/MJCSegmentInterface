//
//  MJCDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC10.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC10 ()

@end

@implementation MJCDemoVC10

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
    vc1.titlesCount = 1;
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    vc2.titlesCount = 2;
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    vc3.titlesCount = 3;
    MJCTestViewController *vc4 = [[MJCTestViewController alloc]init];
    vc4.titlesCount = 4;
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    vc5.titlesCount = 5;
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    vc6.titlesCount = 6;
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    vc7.titlesCount = 7;
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];

    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.frame = CGRectMake(0,CGRectGetMaxY(view.frame),self.view.jc_width, self.view.jc_height-CGRectGetMaxY(view.frame));
    lala.defaultShowItemCount = 3;
    lala.itemTextFontSize = 13;
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.titlesViewFrame = CGRectMake(0, 0, self.view.jc_width,50);
    lala.selectedSegmentIndex = 0;
    lala.itemBackNormalImage = [UIImage imageNamed:@"222"];
    lala.itemBackSelectedImage = [UIImage imageNamed:@"456"];
    lala.itemNormalBackImageArray = imageBackArr;
    lala.itemSelectedBackImageArray = imageBackArr1;
    lala.itemImageSelected = [UIImage imageNamed:@"food-2"];
    lala.itemImageNormal = [UIImage imageNamed:@"food"];
    lala.itemImageNormalArray = imageArr;
    lala.itemImageSelectedArray = imageArr1;
    lala.indicatorColor = [UIColor redColor];
    lala.indicatorImage =[UIImage imageNamed:@"箭头"];
    lala.indicatorFrame = CGRectMake(0,0,50,30);
    lala.indicatorHidden = YES;
    lala.isChildScollEnabled = YES;
    lala.isChildScollAnimal = YES;
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:20];
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcarrr];
    
}


@end
