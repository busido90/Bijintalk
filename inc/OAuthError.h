/**
 * Copyright(c) 2014 NTT DOCOMO, INC. All Rights Reserved.
 */

#import <Foundation/Foundation.h>

/** OAuth認証 SDK エラー情報提供クラス*/
@interface OAuthError : NSError

/**
 * エラーコード
 * @discussion - 認証に失敗した場合のエラーコード
 * - code でエラーコードを取得する
 * @note 取得できるエラーコード
 * <UL><LI>100701:入力パラメータ不正。必須パラメータの設定漏れ</LI>
 * <LI>100702:認証失敗。認証情報の設定誤り</LI>
 * <LI>100703:SDK内部処理エラー。SDK内部処理失敗</LI>
 * <LI>100704:通信処理が確立不可。サーバ接続失敗</LI>
 * <LI>100706:サーバエラー。サーバの内部処理失敗</LI>
 * <LI>100707:レスポンスデータエラー。サーバ側から異なるフォーマットのデータが返却された場合</LI>
 * <LI>100720:ユーザによる認可拒否。ユーザが認証を拒否した</LI>
 * <LI>100721:キャンセル押下による終了。ユーザがキャンセル押下により認証処理を終了した</LI></UL>
 */

/**
 * エラーメッセージ
 * @discussion - 認証に失敗した場合のエラーメッセージ
 * - userInfoでエラーメッセージを取得する
 * - エラーメッセージがない場合は&quot;&quot;(空文字)を返却する
 */

/**
 * 詳細なエラー原因
 * @discussion - SDK内部で発生した詳細エラー原因
 * - causeでエラー原因を取得する
 * - 格納されない場合はnilを返却する
 */
@property (nonatomic) NSError * cause;

/**
 初期化処理
 @return id
 */
-(id)init;

@end
