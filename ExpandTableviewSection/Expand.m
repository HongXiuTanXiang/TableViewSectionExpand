//
//  Expand.m
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "Expand.h"

@implementation Expand

- (NSArray *)everyTextHeightArray {

    NSMutableArray *tmpMarray = [NSMutableArray array];
    
    _cellHeight = 0;
    
    for (int i = 0; i<_texts.count; i++) {
        
        NSString *text = _texts[i];
        
        CGFloat textHeight = [text boundingRectWithSize:CGSizeMake(APP_SCREEN_WIDTH - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height + 15; // 加15: 每个label之间的距离
        
        _cellHeight += textHeight;
        
        [tmpMarray addObject:@(textHeight)];
    }
    
    return tmpMarray;
}
@end
