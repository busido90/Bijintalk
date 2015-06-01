/**
 * Copyright(c) 2014 NTT DOCOMO, INC. All Rights Reserved.
 */

#import <Foundation/Foundation.h>
#import "OAuthToken.h"
#import "OAuthError.h"

typedef void (^onComplete)(OAuthToken *token);
typedef void (^onError)(OAuthError *error);

/** OAuth認証 SDK API提供クラス*/
@interface OAuth : NSObject

/**
 * クライアントID情報の設定
 * @param clientID クライアントID
 * @discussion - 認証情報としてクライアントIDを設定する
 * - 未設定で認証要求 startAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 * - 未設定で再認証要求 refreshAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 */
- (void)setClientID:(NSString *)clientID;

/**
 * クライアントシークレット情報の設定
 * @param secret シークレット
 * @discussion - 認証情報としてクライアントシークレットを設定する
 * - 未設定で認証要求 startAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 * - 未設定で再認証要求 refreshAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 */
-(void)setSecret:(NSString *)secret;

/**
 * スコープ情報の設定
 * @param scope スコープ
 * @discussion - 認証情報としてスコープを設定する
 * - 未設定で認証要求 startAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 * - 未設定で再認証要求 refreshAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 * - スコープを複数設定する場合は&quot; &quot;(半角スペース)で区切って指定すること
 */
-(void)setScope:(NSString *)scope;

/**
 * リダイレクトURI情報の設定
 * @param redirectUri リダイレクトURI
 * @discussion - 認証情報としてリダイレクトURIを設定する
 * - 未設定で認証要求 startAuth:onComplete:onError: を行った場合、認証要求失敗コールバックにてエラーを返却する
 */
-(void)setRedirectUri:(NSString *)redirectUri;

/**
 * 認証を要求する
 * @param controller ViewControllerインスタンス
 * @param onComplete 認証要求成功コールバック
 * @param onError 認証要求失敗コールバック
 * @discussion - 認証を要求する
 * - 指定したパラメータを利用してOAuth認証を行う
 * - SDK内部でViewControllerをモーダルで生成し、認証処理を実施する
 * - 認証要求成功コールバックの定義：typedef void (^onComplete)(OAuthToken *token);
 * - 認証要求失敗コールバックの定義：typedef void (^onError)(OAuthError *error);
 * - 要求完了結果がトークン取得成功の場合は認証要求成功コールバックで通知する
 * - 要求完了結果がトークン取得失敗の場合は認証要求失敗コールバックで通知する
 * - 各引数がnilの場合はNSInvalidArgumentExceptionが発生する
 */
- (void)startAuth:(UIViewController *)controller
       onComplete:(onComplete)onComplete
          onError:(onError)onError;

/**
 * 再認証を要求する
 * @param refreshToken 発行されたリフレッシュトークン
 * @param onComplete 認証要求成功コールバック
 * @param onError 認証要求失敗コールバック
 * @discussion - トークン有効期限が切れた場合、再認証を要求する
 * - リフレッシュトークンは認証要求で取得したトークン情報から取得すること
 * - 認証要求成功コールバックの定義：typedef void (^onComplete)(OAuthToken *token);
 * - 認証要求失敗コールバックの定義：typedef void (^onError)(OAuthError *error);
 * - 要求完了結果がトークン取得成功の場合は認証要求成功コールバックで通知する
 * - 要求完了結果がトークン取得失敗の場合は認証要求失敗コールバックで通知する
 * - スコープが空文字の場合は、認証時のスコープと同様のスコープで再認証を実施する
 * - 各引数がnilの場合はNSInvalidArgumentExceptionが発生する
 */
- (void)refreshAuth:(NSString *)refreshToken
         onComplete:(onComplete)onComplete
            onError:(onError)onError;


@end
