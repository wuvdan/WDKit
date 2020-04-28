//
//  TableViewController.h
//  WDKit
//
//  Created by wudan on 2020/4/28.
//  Copyright © 2020 wudan. All rights reserved.
//

#import "Controller.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : Controller<UITableViewDelegate, UITableViewDataSource>
// 仅添加到视图中，未设置frame
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
