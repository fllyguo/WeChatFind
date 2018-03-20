//
//  CircleOfFriendModel.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "CircleOfFriendModel.h"

extern CGFloat maxContentLabelHeight;

//朋友圈数组Model
@implementation CircleOfFriendModel
{
    CGFloat _lastContentWidth;
}
- (void)setValue:(id)value forKey:(NSString *)key {
    NSLog(@"CircleOfFriendModel找不到Key-------%@", key);
}
- (void)setOptthumb:(NSMutableArray *)optthumb {
    _optthumb = optthumb;
    self.likeArr = optthumb;
    
    if (optthumb.count != 0 && optthumb != nil) {
        __block BOOL hasUserID = NO;
        [optthumb enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            _isThumb = YES;
            hasUserID = YES;
        }];
        if (!hasUserID) {
            _isThumb = NO;
        }
    }else{
        _isThumb = NO;
    }
}
- (void)setLikeArr:(NSMutableArray<CircleOfFriendLikeItemModel *> *)likeArr {
    NSMutableArray *tempLikes = [NSMutableArray new];
    for (id thumbDict in likeArr) {
        CircleOfFriendLikeItemModel *likeModel = [CircleOfFriendLikeItemModel new];
        [likeModel setValuesForKeysWithDictionary:thumbDict];
        [tempLikes addObject:likeModel];
    }
    likeArr = [tempLikes copy];
    _likeArr = likeArr;
}
- (void)setOptcomment:(NSMutableArray *)optcomment {
    _optcomment = optcomment;
    self.commentArr = optcomment;
}
- (void)setCommentArr:(NSMutableArray<CircleOfFriendCommentItemModel *> *)commentArr {
    NSMutableArray *tempComments = [NSMutableArray new];
    CircleOfFriendCommentItemModel *commentItemModel = [CircleOfFriendCommentItemModel new];
    for (id commentItemDic in commentArr) {
        [commentItemModel setValuesForKeysWithDictionary:commentItemDic];
        [tempComments addObject:commentItemModel];
    }
    commentArr = [tempComments copy];
    _commentArr = commentArr;
}
- (NSString *)dsp {
    if (!_dsp) {
        _dsp = @"";
    }
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_dsp];
    text.font = [UIFont systemFontOfSize:14.0];
    
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(SCREENWIDTH - 15 - 45 - 10 - 15, CGFLOAT_MAX)];
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
    
    if (layout.rowCount <= 6) {
        _shouldShowMoreButton = NO;
    }else{
        _shouldShowMoreButton = YES;
    }
    return  _dsp;
}
- (void)setIsOpening:(BOOL)isOpening {
    if (!_shouldShowMoreButton) {
        _isOpening = NO;
    }else{
        _isOpening = isOpening;
    }
}

@end


//点赞Model
@implementation CircleOfFriendLikeItemModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"CircleOfFriendLikeItemModel找不到key%@", key);
}

@end


//评论Model
@implementation CircleOfFriendCommentItemModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"CircleOfFriendCommentItemModel找不到key%@", key);
}


@end
