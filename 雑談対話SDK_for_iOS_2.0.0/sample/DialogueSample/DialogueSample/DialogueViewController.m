//
//  DialogueViewController.m
//  DialogueSample
//  (c) 2014 NTT DOCOMO, INC. All Rights Reserved.
//

#import "DialogueViewController.h"
#import "DialogueRequestParam.h"
#import "DialogueResultData.h"
#import "Dialogue.h"
#import "DialogueError.h"
#import "AuthApiKey.h"

@interface DialogueViewController ()

@end

@implementation DialogueViewController

@synthesize myutt;
@synthesize context;
@synthesize nickname;
@synthesize nickname_y;
@synthesize sex;
@synthesize bloodtype;
@synthesize birthdateY;
@synthesize birthdateM;
@synthesize birthdateD;
@synthesize age;
@synthesize constellations;
@synthesize place;
@synthesize mode;
@synthesize character;
@synthesize reply;

Dialogue * dialog;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSingleTap:)];
    self.singleTap.delegate = self;
    self.singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.singleTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/** [問い合わせ]ボタンのアクションイベント */
- (IBAction)doRequest:(id)sender
{
    [self sendDialogueRequest];
}

/** テキストフィールドの入力終了アクションイベント */
- (IBAction)editEnd:(id)sender {
    // 改行を入力したらソフトウェアキーボードを閉じる
    NSLog(@"editEnd");
    [sender resignFirstResponder];
}

/**
 画面入力を雑談対話要求パラメータに設定する
 
 @return 雑談対話要求パラメータ
 */
-(DialogueRequestParam *)makeDialogueRequestParam
{
    // 雑談対話要求パラメータオブジェクトを生成
    DialogueRequestParam * param =  [[DialogueRequestParam alloc]init];
    // 画面のテキストフィールドから雑談対話要求パラメータに設定する
    if (nil != myutt.text)
    {
        param.utt = myutt.text;
    }
    else{
        param.utt = nil;
    }
    if (context.text.length>0)
    {
        param.context = context.text;
    }
    else{
        param.context = nil;
    }
    if (nickname.text.length>0)
    {
        param.nickname = nickname.text;
    }
    else{
        param.nickname = nil;
    }
    if (nickname_y.text.length>0)
    {
        param.nickname_y = nickname_y.text;
    }
    else{
        param.nickname_y = nil;
    }
    if (sex.text.length>0)
    {
        param.sex = sex.text;
    }
    else{
        param.sex = nil;
    }
    if (bloodtype.text.length>0)
    {
        param.bloodtype = bloodtype.text;
    }
    else{
        param.bloodtype = nil;
    }
    if (birthdateY.text.length>0)
    {
        param.birthdateY = [birthdateY.text intValue];
    }
    else{
        param.birthdateY = -1;
    }
    if (birthdateM.text.length>0)
    {
        param.birthdateM = [birthdateM.text intValue];
    }
    else{
        param.birthdateM = -1;
    }
    if (birthdateD.text.length>0)
    {
        param.birthdateD = [birthdateD.text intValue];
    }
    else{
        param.birthdateD = -1;
    }
    if (age.text.length>0)
    {
        param.age = [age.text intValue];
    }
    else{
        param.age = -1;
    }
    if (constellations.text.length>0)
    {
        param.constellations = constellations.text;
    }
    else{
        param.constellations = nil;
    }
    if (place.text.length>0)
    {
        param.place = place.text;
    }
    else{
        param.place = nil;
    }
    if (mode.text.length>0)
    {
        param.mode = mode.text;
    }
    else{
        param.mode = nil;
    }
    if (character.text.length>0)
    {
        param.character = [character.text intValue];
    }
    else{
        param.character = -1;
    }
    return param;
}

/**
 雑談対話要求送信
 */
-(void)sendDialogueRequest
{
    // APIKEYの設定
    [AuthApiKey initializeAuth: @"356a7231614374324d6f6f482e79674c546e2e374d46502f4633676d3279724765582e6d4e6f767a4b2e43"];
    // 雑談対話要求処理クラスを生成
    dialog = [[Dialogue alloc]init];
    // 画面入力を雑談対話要求パラメータに設定する
    DialogueRequestParam * param = [self makeDialogueRequestParam];
    // 雑談対話要求送信
    DialogueError * requestError = [dialog request:param
                                        onComplete:^(DialogueResultData *resultData)
                                    {
                                        // 応答受信完了時処理ハンドラ
                                        [self receiveDialogueRequest:resultData];
                                        
                                    } onError:^(SdkError *error) {
                                        [self onError:error];
                                    }];
    if(requestError){
        [self onError:requestError];
    }
    else
    {
        NSLog(@"dialog request send OK.");
    }
}

/**
 エラーダイアログ表示
 
 @param error エラー情報
 */
-(void)onError:(NSError *)error
{
    // 送信エラーの場合アラートダイアログを表示する
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
             initWithTitle:error.domain
             message:[NSString stringWithFormat:@"ErrorCode:%ld\nMessage:%@",
                      (long)error.code,
                      error.localizedDescription]
             delegate:nil
             cancelButtonTitle:nil
             otherButtonTitles:@"OK", nil
             ];
    [alert show];
    reply.text = @"";
}


/**
 レスポンス受信
 
 @param 雑談対話レスポンスデータ
 */
-(void)receiveDialogueRequest:(DialogueResultData *)resultData
{
    // 回答を画面のテキストフィールドに表示する
    reply.text = resultData.utt;
    // 対話継続のため受信したコンテキストを画面のテキストフィールドに引き継ぐ
    context.text = resultData.context;
    // サーバー発のしりとりを継続するため受信したモードを画面のテキストフィールドに引き継ぐ
    mode.text = resultData.mode;
    NSLog(@"result.utt:%@",resultData.utt);
    NSLog(@"result.yomi:%@",resultData.yomi);
    NSLog(@"result.mode:%@",resultData.mode);
    NSLog(@"result.da:%ld",(long)resultData.da);
    NSLog(@"result.context:%@",resultData.context);
}

/**
 シングルタップされたらresignFirstResponderでキーボードを閉じる
 
 */
-(void)onSingleTap:(UITapGestureRecognizer *)recognizer{
    [self.myutt resignFirstResponder];
    [self.context resignFirstResponder];
    [self.nickname resignFirstResponder];
    [self.nickname_y resignFirstResponder];
    [self.sex resignFirstResponder];
    [self.bloodtype resignFirstResponder];
    [self.birthdateY resignFirstResponder];
    [self.birthdateM resignFirstResponder];
    [self.birthdateD resignFirstResponder];
    [self.age resignFirstResponder];
    [self.constellations resignFirstResponder];
    [self.place resignFirstResponder];
    [self.mode resignFirstResponder];
    [self.character resignFirstResponder];
    [self.reply resignFirstResponder];
}

/**
 キーボードを表示していない時は、他のジェスチャに影響を与えないように無効化
 */
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.singleTap) {
        // キーボード表示中のみ有効
        if (self.myutt.isFirstResponder) {
            return YES;
        } else if (self.context.isFirstResponder) {
            return YES;
        } else if (self.nickname.isFirstResponder) {
            return YES;
        } else if (self.nickname_y.isFirstResponder) {
            return YES;
        } else if (self.sex.isFirstResponder) {
            return YES;
        } else if (self.bloodtype.isFirstResponder) {
            return YES;
        } else if (self.birthdateY.isFirstResponder) {
            return YES;
        } else if (self.birthdateM.isFirstResponder) {
            return YES;
        } else if (self.birthdateD.isFirstResponder) {
            return YES;
        } else if (self.age.isFirstResponder) {
            return YES;
        } else if (self.constellations.isFirstResponder) {
            return YES;
        } else if (self.place.isFirstResponder) {
            return YES;
        } else if (self.mode.isFirstResponder) {
            return YES;
        } else if (self.character.isFirstResponder) {
            return YES;
        } else if (self.reply.isFirstResponder) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}
@end
