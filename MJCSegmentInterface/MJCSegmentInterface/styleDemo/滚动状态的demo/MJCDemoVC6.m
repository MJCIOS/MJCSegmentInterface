//
//  MJCDemoVC8.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC6.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC6 ()

@end

@implementation MJCDemoVC6

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
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    
        
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,64,self.view.jc_width,self.view.jc_height-64);
    interFace.imageEffectStyles  = MJCImageUpDownStyle;
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(0, 0, 10,0);
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(0,0,0, 0);
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextSelectedColor = [UIColor purpleColor];
    interFace.isIndicatorFollow = YES;
    interFace.selectedSegmentIndex = 3;
    interFace.defaultShowItemCount = 5;
    interFace.itemBackColor = [UIColor whiteColor];
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2",@"phone-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone"];
    interFace.itemImageNormalArray  = imageArr ;
    interFace.itemImageSelectedArray  = imageArr1;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}

@end
