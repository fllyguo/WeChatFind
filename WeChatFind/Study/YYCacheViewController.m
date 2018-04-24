//
//  YYCacheViewController.m
//  WeChatFind
//
//  Created by flyrees on 2018/3/23.
//  Copyright © 2018年 flyrees. All rights reserved.
//

#import "YYCacheViewController.h"

@interface YYCacheViewController ()

@end

@implementation YYCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self cacheExplame];
}
- (void)cacheExplame {
    NSString *userName = @"Jack";
    NSString *key = @"user_name";
    YYCache *userInfoCache = [YYCache cacheWithName:@"userInfo"];
    [userInfoCache setObject:userName forKey:key withBlock:^{
        NSLog(@"succeed");
    }];
    [userInfoCache containsObjectForKey:key withBlock:^(NSString * _Nonnull key, BOOL contains) {
        if (contains) {
            NSLog(@"exists");
        }
    }];
    [userInfoCache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        NSLog(@"user Name:%@", object);
    }];
    [userInfoCache removeObjectForKey:key withBlock:^(NSString * _Nonnull key) {
        NSLog(@"remove user Name:%@", key);
    }];
    [userInfoCache removeAllObjectsWithBlock:^{
        NSLog(@"removeing all cache succeed");
    }];
    [userInfoCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
        NSLog(@"remove all cache objects:%d totalCount %d", removedCount, totalCount);
    } endBlock:^(BOOL error) {
        if (!error) {
            NSLog(@"remove all cache objects: succeed");
        }else{
            NSLog(@"remove all cache objects: failed");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
