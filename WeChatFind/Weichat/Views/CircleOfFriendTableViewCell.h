//
//  CircleOfFriendTableViewCell.h
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleOfFriendLayout.h"
#import "SDWeiXinPhotoContainerView.h"
#import "JRMenuView.h"

@class CircleOfFriendTableViewCell;
@protocol CircleOfFriendTableViewCellDelegate;

@interface CircleOfFriendGrayView : UIView
@property (nonatomic, strong)UIButton *grayBut;
@property (nonatomic, strong)UIImageView *thumbImg;
@property (nonatomic, strong)YYLabel *dspLabel;

@property (nonatomic, strong)CircleOfFriendTableViewCell *cell;

@end

@interface CircleOfFriendThumCommentView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIImageView *bgImgView;
@property (nonatomic, strong)YYLabel *thumbLabel;
@property (nonatomic, strong)UIView *dividingLine;
@property (nonatomic, strong)NSMutableArray *likeArray;
@property (nonatomic, strong)NSMutableArray *commentArray;
@property (nonatomic, strong)CircleOfFriendLayout *layout;
@property (nonatomic, strong)UITableView *commentTable;
@property (nonatomic, strong)CircleOfFriendTableViewCell *cell;

- (void)setWithLikeArr:(NSMutableArray *)likeArr CommentArr:(NSMutableArray *)commentArr CircleOfFriendLayout:(CircleOfFriendLayout *)layout;

@end


@interface CircleOfFriendTableViewCell : UITableViewCell<JRMenuDelegate>

@property (nonatomic, strong)CircleOfFriendLayout *layout;
@property (nonatomic, strong)UIImageView *portrait;
@property (nonatomic, strong)YYLabel *nameLabel;
@property (nonatomic, strong)YYLabel *detailLabel;
@property (nonatomic, strong)UIButton *moreLessDetailBtn;
@property (nonatomic, strong)SDWeiXinPhotoContainerView *picContainerView;
@property (nonatomic, strong)CircleOfFriendGrayView *grayView;
@property (nonatomic, strong)UIButton *spreadBtn;
@property (nonatomic, strong)YYLabel *dateLabel;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, strong)UIButton *menuBtn;
@property (nonatomic, strong)CircleOfFriendThumCommentView *thumbCommentView;
@property (nonatomic, strong)UIView *dividingLine;

@property (nonatomic, strong)JRMenuView *jrMenuView;

@property (nonatomic, assign)id<CircleOfFriendTableViewCellDelegate>delegate;

@end

@protocol CircleOfFriendTableViewCellDelegate <NSObject>

/**
 点击了用户头像或名称
 
 @param userId 用户ID
 */
- (void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickUser:(NSString *)userId;

/**
 点击了全文/收回
 
 */
- (void)DidClickMoreLessInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 点击了推广按钮
 
 */
- (void)DidClickSpreadInDynamicsCell:(CircleOfFriendTableViewCell *)cell;
/**
 点击了灰色详情
 
 */
- (void)DidClickGrayViewInDynamicsCell:(CircleOfFriendTableViewCell *)cell;
/**
 点赞
 
 */
- (void)DidClickThunmbInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 取消点赞
 
 */
- (void)DidClickCancelThunmbInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 评论
 
 */
- (void)DidClickCommentInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 私聊
 
 */
- (void)DidClickChatInDynamicsCell:(CircleOfFriendTableViewCell *)cell;
/**
 分享
 
 */
- (void)DidClickShareInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 删除
 
 */
- (void)DidClickDeleteInDynamicsCell:(CircleOfFriendTableViewCell *)cell;

/**
 点击了评论
 @param commentModel 评论模型
 */
- (void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickComment:(CircleOfFriendCommentItemModel *)commentModel;
/**
 点击了网址或电话号码
 @param url 网址链接
 @param phoneNum 电话号
 */
- (void)DynamicsCell:(CircleOfFriendTableViewCell *)cell didClickUrl:(NSString *)url PhoneNum:(NSString *)phoneNum;

@end
