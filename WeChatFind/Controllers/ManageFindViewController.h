//
//  ManageFindViewController.h
//  WeChatFind
//
//  Created by flyrees on 2018/2/26.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol updateFindDelegate  <NSObject>

- (void)updateFindArray:(NSMutableArray *)dataArray;

@end

@interface ManageFindViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *manageArray;
@property (nonatomic, assign)id<updateFindDelegate>delegate;

@end
