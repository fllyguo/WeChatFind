//
//  WBStatusTimelineTableViewCell.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/21.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "WBStatusTimelineTableViewCell.h"

@implementation WBStatusTimelineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _textLab = [YYLabel new];
        _textLab.backgroundColor = [UIColor orangeColor];
        _textLab.text = @" ";
        _textLab.numberOfLines = 0;
        _textLab.textColor = [UIColor blackColor];
        _textLab.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _textLab.font = [UIFont fontWithName:@"Heiti SC" size:14.];
        _textLab.displaysAsynchronously = YES;
        _textLab.ignoreCommonProperties = YES;
        _textLab.fadeOnAsynchronouslyDisplay = NO;
        _textLab.fadeOnHighlight = NO;
        _textLab.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            NSLog(@"111111");
        };
        [self.contentView addSubview:_textLab];
    }
    return self;
}
- (void)setLayout:(WBStatusLayout *)layout {
    
    NSLog(@"===%@", layout.statusModel.text);
    
    _textLab.left = kTextLeftAndRight;
    _textLab.top = kTextTopAndBottom;
    _textLab.size = CGSizeMake([UIScreen mainScreen].bounds.size.width - kTextLeftAndRight * 2, layout.height - kTextTopAndBottom * 2);
    _textLab.text = layout.statusModel.text;

    self.height = layout.height;
    self.contentView.height = layout.height;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
