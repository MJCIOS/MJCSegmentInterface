//
//  UIView+MJCExtension.h
//
//  Created by majiachen on 16/11/6.
//  Copyright © 2016年 majiachen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MJCExtension)
@property (nonatomic, assign) CGSize mjc_size;//尺寸
@property (nonatomic, assign) CGFloat mjc_width;//宽度
@property (nonatomic, assign) CGFloat mjc_height;//高度
@property (nonatomic, assign) CGFloat mjc_x;//X
@property (nonatomic, assign) CGFloat mjc_y;//y
@property (nonatomic, assign) CGFloat mjc_centerX;//X中心
@property (nonatomic, assign) CGFloat mjc_centerY;//Y中心
@property (nonatomic, assign) CGFloat mjc_right;//右边
@property (nonatomic, assign) CGFloat mjc_bottom;//底部
@end
