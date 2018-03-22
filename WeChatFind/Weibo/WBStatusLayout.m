//
//  WBStatusLayout.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/21.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "WBStatusLayout.h"

/*
 将每行的 baseline 位置固定下来，不受不同字体的 ascent/descent 影响。
 
 注意，Heiti SC 中，    ascent + descent = font size，
 但是在 PingFang SC 中，ascent + descent > font size。
 所以这里统一用 Heiti SC (0.86 ascent, 0.14 descent) 作为顶部和底部标准，保证不同系统下的显示一致性。
 间距仍然用字体默认
 */
@implementation WBTextLinePositionModifier

- (instancetype)init {
    self = [super init];
    
    if (kiOS9Later) {
        _lineHeightMultiple = 1.34;   // for PingFang SC
    } else {
        _lineHeightMultiple = 1.3125; // for Heiti SC
    }
    
    return self;
}

- (void)modifyLines:(NSArray *)lines fromText:(NSAttributedString *)text inContainer:(YYTextContainer *)container {
    //CGFloat ascent = _font.ascender;
    CGFloat ascent = _font.pointSize * 0.86;
    
    CGFloat lineHeight = _font.pointSize * _lineHeightMultiple;
    for (YYTextLine *line in lines) {
        CGPoint position = line.position;
        position.y = _paddingTop + ascent + line.row  * lineHeight;
        line.position = position;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    WBTextLinePositionModifier *one = [self.class new];
    one->_font = _font;
    one->_paddingTop = _paddingTop;
    one->_paddingBottom = _paddingBottom;
    one->_lineHeightMultiple = _lineHeightMultiple;
    return one;
}

- (CGFloat)heightForLineCount:(NSUInteger)lineCount {
    if (lineCount == 0) return 0;
    //    CGFloat ascent = _font.ascender;
    //    CGFloat descent = -_font.descender;
    CGFloat ascent = _font.pointSize * 0.86;
    CGFloat descent = _font.pointSize * 0.14;
    CGFloat lineHeight = _font.pointSize * _lineHeightMultiple;
    return _paddingTop + _paddingBottom + ascent + descent + (lineCount - 1) * lineHeight;
}

@end


@implementation WBStatusLayout

- (instancetype)initWithStatusModel:(WBStatusModel *)statusModel {
    if (!statusModel) return nil;
    self = [super init];
    _statusModel = statusModel;
    [self layout];
    return self;
}
- (void)layout {
    [self _layout];
}
- (void)updateDate {
    
}
- (void)_layout {
    _height = 0;
    _textLayout = nil;
    
    [self _layoutText];
}
- (void)_layoutText {
    if (_statusModel.text.length == 0) return;
        
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_statusModel.text];
    text.color = [UIColor redColor];
    text.font = [UIFont systemFontOfSize:kWBCellTitlebarFontSize];
    
    WBTextLinePositionModifier *modifier = [WBTextLinePositionModifier new];
    modifier.font = [UIFont fontWithName:@"Heiti SC" size:14.];
    modifier.paddingTop = kTextTopAndBottom;
    modifier.paddingBottom = kTextTopAndBottom;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake([UIScreen mainScreen].bounds.size.width - kTextLeftAndRight * 2, HUGE);
    container.linePositionModifier = modifier;
    
    _textLayout = [YYTextLayout layoutWithContainer:container text:text];
    if (!_textLayout) return;
    
    _height = [modifier heightForLineCount:_textLayout.rowCount];
}


@end
