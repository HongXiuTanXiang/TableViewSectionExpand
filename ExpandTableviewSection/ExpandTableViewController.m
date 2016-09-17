//
//  ExpandTableViewController.m
//  ExpandTableviewSection
//
//  Created by Hongfs on 16/8/26.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "ExpandTableViewController.h"
#import "MJExtension.h"
#import "Expand.h"
#import "ExpandHeaderFooterView.h"
#import "ExpandCell.h"

//static NSString *const kHeaderFooterReusableIdentifier = @"ExpandHeaderFooterView";

@interface ExpandTableViewController ()<ExpandHeaderFooterViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger lastSelectedSection; //记录最后一次点击的indexpath
@end

@implementation ExpandTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastSelectedSection = 0;
    
    self.datas = [Expand mj_objectArrayWithFilename:@"HelpPlist.plist"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isOpen && self.lastSelectedSection == section) {
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExpandCell *cell = [ExpandCell cellWithTableView:tableView];
    
    cell.expand = self.datas[indexPath.section];
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isOpen && self.lastSelectedSection == indexPath.section) {
        Expand *expand = self.datas[indexPath.section];
        return expand.cellHeight;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

//    ExpandHeaderFooterView *view = [[ExpandHeaderFooterView alloc] initWithReuseIdentifier:kHeaderFooterReusableIdentifier];
    ExpandHeaderFooterView *view = [[ExpandHeaderFooterView alloc] init];
    
    view.tag = section; // 用于后面记录所点击组的标记
    view.delegate = self;
    view.expand = self.datas[section];
    
    return view;
}

#pragma mark - ExpandHeaderFooterViewDelegate

- (void)didSelectedHeaderFooterView:(ExpandHeaderFooterView *)headerFooterView {

/// 顺序
    
    // 1.关闭展开的组
    if (self.isOpen && self.lastSelectedSection != headerFooterView.tag) {
        
        self.isOpen = NO;
        
        // 先收起之前组的箭头
        ExpandHeaderFooterView *view = (ExpandHeaderFooterView *)[self.tableView headerViewForSection:self.lastSelectedSection];
        [view changeArrowWithIsOpen:NO];
        
        // 删除所展开的cell
        NSIndexPath *deleteIndexPath = [NSIndexPath indexPathForRow:0 inSection:self.lastSelectedSection];
        [self.tableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    // 2.点击同一组处理
    if (self.isOpen && self.lastSelectedSection == headerFooterView.tag) {
        self.isOpen = NO;
        // 删除所展开的cell
        NSIndexPath *deleteIndexPath = [NSIndexPath indexPathForRow:0 inSection:self.lastSelectedSection];
        [self.tableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        return ;
    }
    
    // 3.展开所点击的组(非同一组)
    self.isOpen = YES;
    self.lastSelectedSection = headerFooterView.tag;

    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:0 inSection:headerFooterView.tag];
    [self.tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
