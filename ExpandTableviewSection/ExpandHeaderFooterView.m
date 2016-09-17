//
//  ExpandHeaderFooterView.m
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "ExpandHeaderFooterView.h"
#import "SDAutoLayout.h"
#import "Expand.h"

@interface ExpandHeaderFooterView ()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *arrow;
@property (strong, nonatomic) UIView *line;
@property (nonatomic, assign) BOOL isExpand;
@end

@implementation ExpandHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self buildUI];
    }
    return self;
}

- (void)buildUI {

    self.title = [[UILabel alloc] init];
    self.title.font = [UIFont systemFontOfSize:15];
    self.title.textColor = [UIColor blackColor];
    
    self.arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_arrow_down_accessory"]];
    
    self.line = [[UIView alloc] initWithFrame:CGRectZero];
    self.line.backgroundColor = [UIColor blackColor];
    self.line.alpha = 0.08;
    
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.arrow];
    
    // 设置约束
    self.line.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    self.arrow.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.contentView)
    .widthIs(self.arrow.image.size.width)
    .heightIs(self.arrow.image.size.height);
    
    self.title.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.arrow, 10)
    .heightIs(20);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeader)];
    [self.contentView addGestureRecognizer:tap];
}

- (void)tapHeader {
    
    // 修改箭头方向
    [self changeArrowDirection];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedHeaderFooterView:)]) {
        [self.delegate didSelectedHeaderFooterView:self];
    }
}

- (void)changeArrowDirection {

    self.isExpand = !self.isExpand;
    
    NSString *arrowString = self.isExpand ? @"cell_arrow_up_accessory" : @"cell_arrow_down_accessory";
    
    self.arrow.image = [UIImage imageNamed:arrowString];
}

- (void)changeArrowWithIsOpen:(BOOL)isOpen {

    self.isExpand = isOpen;
    
    NSString *arrowString = isOpen ? @"cell_arrow_up_accessory" : @"cell_arrow_down_accessory";
    
    self.arrow.image = [UIImage imageNamed:arrowString];
}

#pragma mark - 设置数据

- (void)setExpand:(Expand *)expand {
    _expand = expand;
    
    self.title.text = expand.title;
}
@end
