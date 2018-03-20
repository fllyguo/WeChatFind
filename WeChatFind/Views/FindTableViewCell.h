//
//  FindTableViewCell.h
//  WeChatFind
//
//  Created by flyrees on 2018/2/26.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectCloseDelegate  <NSObject>

- (void)selectCloseSwitch:(UISwitch *)switchSender;

@end

@interface FindTableViewCell : UITableViewCell

@property (nonatomic, strong)NSDictionary *infoDic;
@property (nonatomic, strong)NSString *arrow;//是否有switch开关
@property (nonatomic, assign)id<selectCloseDelegate> delegate;

@end
