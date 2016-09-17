//
//  ExpandHeaderFooterView.h
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Expand, ExpandHeaderFooterView;

@protocol ExpandHeaderFooterViewDelegate <NSObject>

- (void)didSelectedHeaderFooterView:(ExpandHeaderFooterView *)headerFooterView;
@end

@interface ExpandHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) Expand *expand;
@property (nonatomic, weak) id<ExpandHeaderFooterViewDelegate>delegate;
- (void)changeArrowWithIsOpen:(BOOL)isOpen;
@end
