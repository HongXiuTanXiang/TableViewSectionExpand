//
//  ExpandCell.h
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Expand;

@interface ExpandCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) Expand *expand;
@end
