//
//  OAuthTokenManager.h
//  DialogueSample
//
//  Created by docomo on 2015/01/27.
//
//

#import <UIKit/UIKit.h>
#import "OAuthToken.h"

@interface OAuthTokenManager : NSObject {
    OAuthToken * _oauthToken;
}

@property OAuthToken * _oauthToken;

/**
 * インスタンスを取得する
 */
+ (id)getInstance;

/**
 * トークン情報を設定する
 */
- (void)setOAuthToken:(OAuthToken *)oauthToken;

/**
 * トークン情報を取得する
 */
- (OAuthToken*)getOAuthToken;

@end
