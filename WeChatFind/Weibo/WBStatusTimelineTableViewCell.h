//
//  WBStatusTimelineTableViewCell.h
//  WeChatFind
//
//  Created by flyrees on 2018/3/21.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBStatusLayout.h"

@interface WBStatusTimelineTableViewCell : UITableViewCell

@property (nonatomic, strong)YYLabel *textLab;

- (void)setLayout:(WBStatusLayout *)layout;
@property (nonatomic, strong)WBStatusLayout *layout;

@end
