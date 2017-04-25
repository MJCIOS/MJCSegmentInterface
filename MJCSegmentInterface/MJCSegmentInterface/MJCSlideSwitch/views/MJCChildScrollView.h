//
//  MJCChildScrollView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCChildScrollView : UIScrollView

-(void)setupTitlesScrollFrame:(UIView *)titilesView mainView:(UIView *)mainView  MJCTitleBarStyles:(MJCTitleBarStyles)MJCTitleBarStyles xibCreateTag:(NSInteger)xibCreateTag;


-(void)setupChildContenSize:(NSArray *)titlesArr;

@property (nonatomic,assign) CGRect childFrame;

@property (nonatomic,assign) BOOL childScollEnabled;


@property(nonatomic,weak) id<UIScrollViewDelegate> scollDelegate;



@end
