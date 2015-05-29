//
//  OAuthReqViewController.m
//  DialogueSample
//
//  Created by docomo on 2015/01/27.
//
//

#import <Foundation/Foundation.h>
#import "OAuthReqViewController.h"
#import "OAuth.h"
#import "OAuthToken.h"
#import "OAuthError.h"
#import "OAuthTokenManager.h"

// OAuth 認証情報
static NSString * const OAUTH_CLIENT_ID = @"";
static NSString * const OAUTH_CLIENT_SECRET = @"";
static NSString * const OAUTH_SCOPE = @"";
static NSString * const OAUTH_REDIRECT_URI = @"";

@interface OAuthReqViewController ()

@end

@implementation OAuthReqViewController

@synthesize clientid;
@synthesize secret;
@synthesize scope;
@synthesize redirectUri;
@synthesize accessToken;
@synthesize refreshToken;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clientid.text = OAUTH_CLIENT_ID;
    self.secret.text = OAUTH_CLIENT_SECRET;
    self.scope.text = OAUTH_SCOPE;
    self.redirectUri.text = OAUTH_REDIRECT_URI;
    
    OAuthTokenManager *instance = [OAuthTokenManager getInstance];
    OAuthToken *token = [instance getOAuthToken];
    if (token == nil) {
        self.accessToken.text = @"";
        self.refreshToken.text = @"";
        self.refreshBtn.enabled = NO;
    } else {
        self.accessToken.text = token.getAccessToken;
        self.refreshToken.text = token.getRefreshToken;
    }
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSingleTap:)];
    self.singleTap.delegate = self;
    self.singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.singleTap];
    
}

/**
 * 認証ボタンイベント
 */
- (IBAction)doOAuthPush:(id)sender {
    // OAuth認証実行
    [self sendOAuthRequest];
}

/**
 * 再認証ボタンイベント
 */
- (IBAction)doRefreshPush:(id)sender {
    // OAuth再認証実行
    [self sendRefreshRequest];
}


/**
 * OAuth認証実行
 */
-(void)sendOAuthRequest
{
    //OAuthAPIのインスタンス作成
    OAuth* oAuth = [[OAuth alloc] init];
    [oAuth setClientID:self.clientid.text];
    [oAuth setSecret:self.secret.text];
    [oAuth setScope:self.scope.text];
    [oAuth setRedirectUri:self.redirectUri.text];
    
    //例外処理
    //OAuth認証の開始処理
    @try {
        [oAuth startAuth:self
              onComplete:^(OAuthToken *token){
                  [self success:token];
              }
                 onError:^(OAuthError *error){
                     [self failuer:error];
                 }];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception.name);
        NSLog(@"%@",exception.reason);
    }
}

/**
 * OAuth再認証実行
 */
-(void)sendRefreshRequest
{
    //OAuthAPIのインスタンス作成
    OAuth* oAuth = [[OAuth alloc] init];
    [oAuth setClientID:self.clientid.text];
    [oAuth setSecret:self.secret.text];
    [oAuth setScope:self.scope.text];
    [oAuth setRedirectUri:self.redirectUri.text];
    
    //例外処理
    //OAuth認証の開始処理
    @try {
        [oAuth refreshAuth:self.refreshToken.text
                onComplete:^(OAuthToken *token){
                    [self success:token];
                }
                   onError:^(OAuthError *error){
                       [self failuer:error];
                   }];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception.name);
        NSLog(@"%@",exception.reason);
    }
}

/**
 * OAuth認証成功時の処理
 */
- (void)success:(OAuthToken *)token
{
    // アクセストークンとリフレッシュトークンを表示
    self.accessToken.text = token.getAccessToken;
    self.refreshToken.text = token.getRefreshToken;
    self.refreshBtn.enabled = YES;
    
    OAuthTokenManager *instance = [OAuthTokenManager getInstance];
    [instance setOAuthToken:token];
    
    NSString *accessTokenInfo =
    [NSString stringWithFormat:@"accessToken:%@\nexpiresIN:%@\ntokenType:%@\nrefreshToken:%@\nscope:%@",
     token.getAccessToken, token.getExpiresIn, token.getTokenType, token.getRefreshToken, token.getScope];
    
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
             initWithTitle:@"アクセストークン取得成功"
             message:accessTokenInfo
             delegate:nil
             cancelButtonTitle:nil
             otherButtonTitles:@"OK", nil
             ];
    [alert show];
}

/**
 * OAuth認証失敗時の処理
 */
- (void)failuer:(OAuthError *)error
{
    //ポップアップに表示するエラー情報を生成
    NSString *errorInfo = [NSString stringWithFormat:@"errorCode:%ld \nerrorMessage:%@",
                           (long)error.code, error.localizedDescription];
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
             initWithTitle:@"アクセストークン取得失敗"
             message:errorInfo
             delegate:nil
             cancelButtonTitle:nil
             otherButtonTitles:@"OK", nil
             ];
    [alert show];
}

/**
 シングルタップされたらresignFirstResponderでキーボードを閉じる
 
 */
-(void)onSingleTap:(UITapGestureRecognizer *)recognizer{
    [self.clientid resignFirstResponder];
    [self.secret resignFirstResponder];
    [self.scope resignFirstResponder];
    [self.redirectUri resignFirstResponder];
    [self.accessToken resignFirstResponder];
    [self.refreshToken resignFirstResponder];
}

/**
 キーボードを表示していない時は、他のジェスチャに影響を与えないように無効化
 */
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.singleTap) {
        // キーボード表示中のみ有効
        if (self.clientid.isFirstResponder) {
            return YES;
        } else if (self.secret.isFirstResponder) {
            return YES;
        } else if (self.scope.isFirstResponder) {
            return YES;
        } else if (self.redirectUri.isFirstResponder) {
            return YES;
        } else if (self.accessToken.isFirstResponder) {
            return YES;
        } else if (self.refreshToken.isFirstResponder) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}

@end