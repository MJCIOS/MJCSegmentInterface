//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC3.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC3 ()

@end

@implementation MJCDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
        
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 64, self.view.mjc_width,200);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.frame = CGRectMake(0,CGRectGetMaxY(view.frame),self.view.mjc_width, self.view.mjc_height-CGRectGetMaxY(view.frame));
    lala.defaultShowItemCount = 3;
    lala.itemTextFontSize = 13;
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.titlesViewFrame = CGRectMake(0, 0, self.view.mjc_width,50);
    lala.titlesViewBackImage = [UIImage imageNamed:@"appStartBackImage"];
    lala.defaultItemNumber = 0;
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart"];
    lala.itemBackNormalImage = [UIImage imageNamed:@"222"];
    lala.itemBackSelectedImage = [UIImage imageNamed:@"456"];
    lala.itemNormalBackImageArray = imageArr;
    lala.itemSelectedBackImageArray = imageArr1;
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
    [lala intoChildControllerArray:vcarrr];;
    
}

-(void)dealloc
{
    NSLog(@"88了");
}



@end
