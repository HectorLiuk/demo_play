//
//  UITableView+PDTableViewPlaceHold.m
//  CSEJClient
//
//  Created by lk on 16/5/10.
//  Copyright © 2016年 PHTData. All rights reserved.
//

#import "UITableView+PDTableViewPlaceHold.h"
#import <objc/runtime.h>



static NSString *cName= @"strKey";
static NSString *noName = @"noData";
@implementation UITableView (PDTableViewPlaceHold)
- (UIView *)noDataView{
    return objc_getAssociatedObject(self, &cName);

}
- (void)setNoDataView:(UIView *)noDataView{
    objc_setAssociatedObject(self, &cName, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)noPersonalView{
    return objc_getAssociatedObject(self, &noName);
}
- (void)setNoPersonalView:(UIView *)noPersonalView{
    objc_setAssociatedObject(self, &noName, noPersonalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (void)noDataPlaceholdArray:(NSMutableArray *)array{
    if (array.count == 0) {
        if (!self.noDataView) {
            self.noDataView = MBNoResultView(self, nil,@"tableViewNoData");
        }
        [self addSubview:self.noDataView];
    }else{
        [self.noDataView removeFromSuperview];

    }
}



- (void)noNoPersonalPlaceholdArray:(NSMutableArray *)array{
    if (array.count == 0) {
        if (!self.noPersonalView) {
            self.noPersonalView = MBNoResultView(self, nil,@"noPersonalData");
        }
        [self addSubview:self.noPersonalView];
    }else{
        [self.noPersonalView removeFromSuperview];
    }
}



UIView* MBNoResultView(UITableView *tableView,NSString *msg,NSString *imageStr){
    UIView *resultView = [[UIView alloc]init];
    resultView.backgroundColor = [UIColor clearColor];
    CGFloat resultX;
    CGFloat resultY;
    CGFloat resultYHeight;
    CGFloat resultYWidth;
    
    
    
    CGFloat tableViewHeaderHeight = tableView.tableHeaderView.height;
    if ([tableView.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        tableViewHeaderHeight = tableViewHeaderHeight+[tableView.delegate tableView:tableView heightForHeaderInSection:0];
    }
    
    CGFloat tableViewFooterHeight = tableView.tableFooterView.height;
    
    resultYHeight = tableView.frame.size.height -tableViewHeaderHeight-tableViewFooterHeight;
    resultYWidth = tableView.frame.size.width;
    
    resultX = 0;
    resultY =tableView.frame.origin.y +tableViewHeaderHeight;
    
    resultView.frame = CGRectMake(resultX, resultY, resultYWidth, resultYHeight);
    
    UIView *resultContentView =[[UIView alloc]initWithFrame:CGRectMake(0, 0,resultYWidth, resultYHeight)];
    resultContentView.backgroundColor = [UIColor clearColor];
    [resultView addSubview:resultContentView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 233, 108)];
    if (iPhone6Plus) {
        imageView.frame = CGRectMake(0,0, 233+54, 108+27);
    }
    [imageView setImage:[UIImage imageNamed:imageStr]];
    imageView.center = resultContentView.center;
    [resultView addSubview:imageView];
    
    UILabel *lblView = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.height+imageView.frame.origin.y, resultYWidth, 30)];
    lblView.textAlignment = NSTextAlignmentCenter;
    lblView.textColor = [UIColor grayColor];
    lblView.font = FONT(13);
    
    
    lblView.text =msg;
    
    [resultView addSubview:lblView];
    
    imageView.y -=  30;
    
    //    if (imageView.frame.origin.y < 0) {
    //        resultView.frame = CGRectOffset(resultView.frame, 0, abs((int)imageView.frame.origin.y));
    //    }else if (imageView.frame.origin.y > 60){
    //        resultView.frame = CGRectOffset(resultView.frame, 0, -30);
    //
    //    }
    
    //    [tableView addSubview:resultView];
    
    return resultView;
}


@end
