//
//  CircleOfFriendHeader.h
//  WeChatFind
//
//  Created by flyrees on 2018/3/19.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#ifndef CircleOfFriendHeader_h
#define CircleOfFriendHeader_h
#import <UIImageView+WebCache.h>
#import <YYKit.h>
#import <BlocksKit+UIKit.h>
#import <SVProgressHUD.h>

#define NICKNAMEFONT [UIFont systemFontOfSize:18.0]
#define CONTENTFONT [UIFont systemFontOfSize:15.0]
#define NICKNAMECOLOR [UIColor colorWithRed:70/255. green:88/255. blue:117/255. alpha:1]
#define SCREENWIDTH  ([[UIScreen mainScreen]bounds].size.width)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define ImgHeader @"http://static.soperson.com"


#endif /* CircleOfFriendHeader_h */
