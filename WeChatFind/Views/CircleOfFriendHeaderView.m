//
//  CircleOfFriendHeaderView.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//


#import "CircleOfFriendHeaderView.h"

@implementation CircleOfFriendHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.backGroundImg];
        [self addSubview:self.nicknameL];
        [self addSubview:self.iconImg];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backGroundImg]|" options:0 metrics:nil views:@{@"backGroundImg":_backGroundImg}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[nickNmae]-10-[iconImg(70)]-10-|" options:0 metrics:nil views:@{@"nickNmae":_nicknameL, @"iconImg":_iconImg}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backGroundImg]-30-|" options:0 metrics:nil views:@{@"backGroundImg":_backGroundImg}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[nickNmae(25)]-35-|" options:0 metrics:nil views:@{@"nickNmae":_nicknameL}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[iconImg(70)]-15-|" options:0 metrics:nil views:@{@"iconImg":_iconImg}]];
    }
    return self;
}
- (UIImageView *)backGroundImg {
    if (!_backGroundImg) {
        _backGroundImg = [[UIImageView alloc] init];
        _backGroundImg.translatesAutoresizingMaskIntoConstraints = NO;
        _backGroundImg.backgroundColor = [UIColor clearColor];
    }
    return _backGroundImg;
}
- (UILabel *)nicknameL {
    if (!_nicknameL) {
        _nicknameL = [[UILabel alloc] init];
        _nicknameL.translatesAutoresizingMaskIntoConstraints = NO;
        _nicknameL.backgroundColor = [UIColor clearColor];
        [_nicknameL setTextColor:[UIColor whiteColor]];
        [_nicknameL setTextAlignment:NSTextAlignmentRight];
        [_nicknameL setFont:NICKNAMEFONT];
        [_nicknameL setFont:[UIFont boldSystemFontOfSize:18.]];
    }
    return _nicknameL;
}
- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.translatesAutoresizingMaskIntoConstraints = NO;
        _iconImg.backgroundColor = [UIColor purpleColor];
        _iconImg.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.95].CGColor;
        _iconImg.layer.borderWidth = 2.5;
    }
    return _iconImg;
}

@end
