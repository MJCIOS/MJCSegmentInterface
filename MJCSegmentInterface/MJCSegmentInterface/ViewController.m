//
//  ViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/28.
//  Copyright © 2016年 MJC. All rights reserved.
//
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "ViewController.h"

#import "SegMentInterfaceStyleClassicVC.h"
#import "SegMentInterfaceStyleLessVC.h"
#import "SegMentInterfaceStylePenetrateVC.h"
#import "SegMentInterfaceStyleMoreUseVC.h"
#import "SegMentInterfaceStyleExceedUseVC.h"
#import "MJCCustomController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)button11:(id)sender {
    
    SegMentInterfaceStyleClassicVC *vc1 = [SegMentInterfaceStyleClassicVC new];
    
    [self.navigationController pushViewController:vc1 animated:YES];
    
    
}
- (IBAction)button22:(id)sender {
    SegMentInterfaceStyleLessVC *vc2 = [SegMentInterfaceStyleLessVC new];
    
    [self.navigationController pushViewController:vc2 animated:YES];
}
- (IBAction)button33:(id)sender {
    SegMentInterfaceStylePenetrateVC *vc3 = [SegMentInterfaceStylePenetrateVC new];
    
    [self.navigationController pushViewController:vc3 animated:YES];
    
    
}
- (IBAction)button44:(id)sender {
    
    SegMentInterfaceStyleMoreUseVC *vc4 = [SegMentInterfaceStyleMoreUseVC new];
    
    [self.navigationController pushViewController:vc4 animated:YES];
    
}
- (IBAction)button55:(id)sender {
    
    SegMentInterfaceStyleExceedUseVC *vc5 = [SegMentInterfaceStyleExceedUseVC new];
    
    [self.navigationController pushViewController:vc5 animated:YES];
    
}
- (IBAction)custombutton:(id)sender {
    
    MJCCustomController *custon = [MJCCustomController new];
    
    [self.navigationController pushViewController:custon animated:YES];
    
}




@end
