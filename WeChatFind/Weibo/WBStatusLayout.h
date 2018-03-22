//
//  WBStatusLayout.h
//  WeChatFind
//
//  Created by flyrees on 2018/3/21.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#define kTextLeftAndRight 10
#define kTextTopAndBottom 20
#define kWBCellTitlebarFontSize 14

#import <Foundation/Foundation.h>
#import "WBStatusModel.h"

@interface WBStatusLayout : NSObject

- (instancetype)initWithStatusModel:(WBStatusModel *)statusModel;
- (void)layout; ///< 计算布局
- (void)updateDate; ///< 更新时间字符串

// 数据
@property (nonatomic, strong)WBStatusModel *statusModel;
// 文本高度
@property (nonatomic, strong)YYTextLayout *textLayout;
// 总高度
@property (nonatomic, assign)CGFloat height;

@end

/**
 文本 Line 位置修改
 将每行文本的高度和位置固定下来，不受中英文/Emoji字体的 ascent/descent 影响
 */
@interface WBTextLinePositionModifier : NSObject <YYTextLinePositionModifier>
@property (nonatomic, strong) UIFont *font; // 基准字体 (例如 Heiti SC/PingFang SC)
@property (nonatomic, assign) CGFloat paddingTop; //文本顶部留白
@property (nonatomic, assign) CGFloat paddingBottom; //文本底部留白
@property (nonatomic, assign) CGFloat lineHeightMultiple; //行距倍数
- (CGFloat)heightForLineCount:(NSUInteger)lineCount;

@end
