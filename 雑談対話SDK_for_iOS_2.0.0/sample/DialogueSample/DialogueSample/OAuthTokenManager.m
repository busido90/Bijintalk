//
//  OAuthTokenManager.m
//  DialogueSample
//
//  Created by docomo on 2015/01/27.
//
//

#import <Foundation/Foundation.h>
#import "OAuthTokenManager.h"

@implementation OAuthTokenManager

static id instance = nil;
@synthesize _oauthToken;

/**
 * インスタンスを取得する
 */
+ (id)getInstance
{
    if (instance == nil) {
        instance = [[self alloc]init];
    }
    return instance;
}


/**
 * 初期化処理
 */
- (id)init
{
    self._oauthToken = nil;
    return self;
}


/**
 * トークン情報を設定する
 */
- (void)setOAuthToken:(OAuthToken *)oauthToken
{
    self._oauthToken = oauthToken;
}

/**
 * トークン情報を取得する
 */
- (OAuthToken*)getOAuthToken
{
    return self._oauthToken;
}

@end