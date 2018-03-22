//
//  FindTableViewCell.m
//  WeChatFind
//
//  Created by flyrees on 2018/2/26.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "FindTableViewCell.h"



@interface FindTableViewCell ()
@property (nonatomic, strong)UIImageView *iconImageView;//头像
@property (nonatomic, strong)UILabel *titleLabel;//标题
@property (nonatomic, strong)UISwitch *isNoFindSwitch;//发现页开关
@property (nonatomic, strong)UIView *lineV;

@end

@implementation FindTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.lineV];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[iconImage(30)]-10-[titleLabel]-100-|" options:0 metrics:nil views:@{@"iconImage":self.iconImageView, @"titleLabel":self.titleLabel}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineV]|" options:0 metrics:nil views:@{@"lineV":_lineV}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[iconImage]-10-|" options:0 metrics:nil views:@{@"iconImage":self.iconImageView}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[titleLabel]-10-|" options:0 metrics:nil views:@{@"titleLabel":self.titleLabel}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineV(1)]|" options:0 metrics:nil views:@{@"lineV":_lineV}]];
    }
    return self;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:16.]];
    }
    return _titleLabel;
}
- (UISwitch *)isNoFindSwitch {
    if (!_isNoFindSwitch) {
        _isNoFindSwitch = [[UISwitch alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 10, 50, 30)];
        [_isNoFindSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _isNoFindSwitch;
}
- (UIView *)lineV {
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        _lineV.translatesAutoresizingMaskIntoConstraints = NO;
        _lineV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
    }
    return _lineV;
}
- (void)switchAction:(UISwitch *)switchIsNo {
    if ([self.delegate respondsToSelector:@selector(selectCloseSwitch:)]) {
        [self.delegate selectCloseSwitch:switchIsNo];
    }
}
- (void)setArrow:(NSString *)arrow {
    if ([arrow isEqualToString:@"1"]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        [self.contentView addSubview:self.isNoFindSwitch];
    }
}
- (void)setInfoDic:(NSDictionary *)infoDic {
        
    _iconImageView.image = [UIImage imageNamed:[infoDic objectForKey:@"icon"]];
    _titleLabel.text = [infoDic objectForKey:@"title"];
    
    NSString *tagStr = [infoDic objectForKey:@"findId"];
    NSInteger tagNum = [tagStr integerValue];
    if (tagStr.length > 2) {
        if ([[tagStr substringFromIndex:tagStr.length - 3] integerValue] == 888) {
            [_isNoFindSwitch setOn:NO];
        }else{
            [_isNoFindSwitch setOn:YES];
        }
    }else{
        [_isNoFindSwitch setOn:YES];
    }
    _isNoFindSwitch.tag = tagNum;
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
