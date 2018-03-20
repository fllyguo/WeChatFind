//
//  CircleOfFriendLayout.h
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CircleOfFriendModel.h"

#define kDynamicsNormalPadding 15
#define kDynamicsPortraitWidthAndHeight 45
#define kDynamicsPortraitNamePadding 10
#define kDynamicsNameDetailPadding 8
#define kDynamicsNameHeight 17
#define kDynamicsMoreLessButtonHeight 30
#define kDynamicsSpreadButtonHeight 20
#define kDynamicsGrayBgHeight 51
#define kDynamicsGrayPicHeight 45
#define kDynamicsGrayPicPadding 3
#define kDynamicsThumbTopPadding 10

#define kDynamicsLineSpacing 5

typedef void(^ClickUserBlock)(NSString *userID);
typedef void(^ClickUrlBlock)(NSString *url);
typedef void(^ClickPhoneNumBlock)(NSString *phoneNum);

@interface CircleOfFriendLayout : NSObject

@property (nonatomic, strong)CircleOfFriendModel *model;

@property (nonatomic, strong)YYTextLayout *detailLayout;
@property (nonatomic, assign)CGSize photoContainerSize;
@property (nonatomic, strong)YYTextLayout *dspLayout;
@property (nonatomic, strong)YYTextLayout *thumbLayout;
@property (nonatomic, strong)NSMutableArray *commentLayoutArr;
@property (nonatomic, assign)CGFloat thumbHeight;
@property (nonatomic, assign)CGFloat commentHeight;
@property (nonatomic, assign)CGFloat thumbCommentHeight;
@property (nonatomic, copy)ClickUserBlock clickUserBlock;
@property (nonatomic, copy)ClickUrlBlock clickUrlBlock;
@property (nonatomic, copy)ClickPhoneNumBlock clickPhoneNumBlock;

@property (nonatomic, assign)CGFloat height;

- (instancetype)initWithModel:(CircleOfFriendModel *)model;
- (void)resetLayout;

@end
