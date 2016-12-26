//
//  UITestViewController.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/9.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "UITestViewController.h"
#import "MJCPrefixHeader.pch"

@interface UITestViewController ()

/** <#  注释  #> */
@property (nonatomic,copy) UIButton *button1;

@end

@implementation UITestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.view.frame = MJCScreenbound;
    
    
    UIButton *butatat = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _button1 = butatat;
    
    butatat.backgroundColor = [UIColor redColor];
    [butatat addTarget:self action:@selector(dismisadasd) forControlEvents:UIControlEventTouchUpInside];
    butatat.frame = CGRectMake(30,100, 50, 50);
    
    [self.view addSubview:butatat];
    
}

-(void)loadData:(int)lalla
{
    if (lalla == 1) {
        _button1.backgroundColor = [UIColor orangeColor];
    }else{
        _button1.backgroundColor = [UIColor redColor];
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)dismisadasd
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
