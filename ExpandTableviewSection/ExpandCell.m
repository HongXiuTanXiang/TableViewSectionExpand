//
//  ExpandCell.m
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "ExpandCell.h"
#import "Expand.h"
#import "SDAutoLayout.h"

static NSString *const kCellReusableIdentifier = @"ExpandCell";

@implementation ExpandCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {

//    ExpandCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReusableIdentifier];
//    
//    if (!cell) {
//        cell = [[ExpandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReusableIdentifier];
//    }

    // 此处不做重用
    ExpandCell *cell = [[ExpandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReusableIdentifier];
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self buildUI];
    }
    return self;
}

- (void)buildUI {

}

- (void)setExpand:(Expand *)expand {

    for (int i = 0; i<expand.texts.count; i++) {
        
        CGFloat textY = 0; //texts中存放着多个文本,每个文本创建一个label. labelY坐标
        
        for (int j = 0; j<i; j++) {
            CGFloat textHeight = [expand.everyTextHeightArray[j] floatValue];
            textY += textHeight;
        }
        
        CGFloat textHeight = [expand.everyTextHeightArray[i] floatValue];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, textY, APP_SCREEN_WIDTH - 40, textHeight)];
        textLabel.text = expand.texts[i];
        textLabel.numberOfLines = 0;
        textLabel.textColor = [UIColor grayColor];
        textLabel.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:textLabel];
    }
}
@end
