//
//  UITableView+PDTableViewPlaceHold.h
//  CSEJClient
//
//  Created by lk on 16/5/10.
//  Copyright © 2016年 PHTData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PDTableViewPlaceHold)
@property (nonatomic, strong) UIView *noDataView;
@property (nonatomic, strong) UIView *noPersonalView;
//- (void)addPlacehold;
//- (void)removePlacehold;
/**
 *  显示敬请期待
 */
- (void)noDataPlaceholdArray:(NSMutableArray *)array;
/**
 *  显示暂无数据
 */
- (void)noNoPersonalPlaceholdArray:(NSMutableArray *)array;

@end
