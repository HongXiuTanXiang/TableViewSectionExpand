//
//  Expand.h
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define APP_SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define APP_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define APP_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface Expand : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *texts;

/// 自定义属性
/// 存放每个组中文本的计算高度, 用于在cell中创建label时设置高度
@property (nonatomic, strong, readonly) NSArray *everyTextHeightArray;
/// 每个cell的最终高度
@property (nonatomic, assign) CGFloat cellHeight;
@end
