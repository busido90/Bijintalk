/**
 * Copyright(c) 2014 NTT DOCOMO, INC. All Rights Reserved.
 */

#import <Foundation/Foundation.h>

/** OAuth認証 SDK アクセストークン情報提供クラス*/
@interface OAuthToken : NSObject
/**
 * アクセストークン
 * @discussion - アクセストークン
 * - getAccessTokenでアクセストークンを取得する
 */
@property (nonatomic, getter=getAccessToken) NSString *accessToken;

/**
 * リフレッシュトークン
 * @discussion - リフレッシュトークン
 * - getRefreshTokenでリフレッシュトークンを取得する
 */
@property (nonatomic, getter=getRefreshToken) NSString *refreshToken;

/**
 * トークン有効期限
 * @discussion - トークン有効期限(秒)
 * - getExpiresInでトークン有効期限を取得する
 */
@property (nonatomic, getter=getExpiresIn) NSString *expiresIn;

/**
 * トークンタイプ
 * @discussion - トークンタイプ
 * - getTokenTypeでトークンタイプを取得する
 * - 値は"Bearer"固定となる
 */
@property (nonatomic, getter=getTokenType) NSString *tokenType;

/**
 * スコープ
 * @discussion - スコープ
 * - getScopeでスコープを取得する
 */
@property (nonatomic, getter=getScope) NSString *scope;

@end
