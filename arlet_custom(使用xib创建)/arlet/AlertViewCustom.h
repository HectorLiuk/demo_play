//
//  AlertViewCustom.h
//  arlet
//
//  Created by lk on 16/6/15.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  自定义警告窗
 */
@interface AlertViewCustom : UIView
/**
 *  标题 用于支持富文本
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  详情  如何不传高度缩小并且只显示标题
 */
@property (nonatomic, copy) NSString *detail;
/**
 *  确认成功 回调
 */
@property (nonatomic, copy) void(^sureClickBlock)(void);
/**
 *  显示于哪个视图之上
 *
 *  @param view atView
 */
- (void)showToView:(UIView*)view;
@end
