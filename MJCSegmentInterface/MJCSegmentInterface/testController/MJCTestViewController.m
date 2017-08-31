//
//  MJCTestViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestViewController.h"
#import "MJCPrefixHeader.pch"

@interface MJCTestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titlesLable;

@end

@implementation MJCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MJCRandomColor;
    _titlesLable.text = [NSString stringWithFormat:@"%@",self.title];
}

-(void)setStyleId:(NSString *)styleId
{
    _styleId = styleId;
    
    NSLog(@"%@",styleId);
}

-(void)dealloc
{
    NSLog(@"%@销毁",self);
}


@end
