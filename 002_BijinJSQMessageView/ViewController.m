//
//  ViewController.m
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/03.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubble;
@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubble;
@property (strong, nonatomic) JSQMessagesAvatarImage *incomingAvatar;
@property (strong, nonatomic) JSQMessagesAvatarImage *outgoingAvatar;

@end


@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //背景画像設定
    if (self.backgroundImageView.image == nil) {
        UIImage *image = [UIImage imageNamed:@"Model1_default.jpg"];
        self.backgroundImageView = [[UIImageView alloc] initWithImage:image];
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImageView.frame = CGRectMake(0, self.navigationController.navigationBar.bounds.size.height +20, self.view.bounds.size.width, self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height);

    }
    
    
    //collectionViewを透明にする
    self.collectionView.backgroundColor= [UIColor colorWithWhite:0.0 alpha:0.0];
    
    
    
    //相手icon設定
    if (self.icon == nil) {
        self.icon = [UIImage imageNamed:@"Model1_icon.jpeg"];
    }
    
    //上部の画面表示 結局使わず
//    self.collectionView = UICollectionElementKindSectionHeader;
//    self.showLoadEarlierMessagesHeader = YES;
//    self.topContentAdditionalInset=15.0f;
    
    // UIBarButtonItemに表示文字列を渡して、インスタンス化します。
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]
                            initWithTitle:@"設定"
                            style:UIBarButtonItemStylePlain
                            target:self
                            action:@selector(gotoSetting:)];

    // なお右側に追加する時は、以下のようにする。
     self.navigationItem.rightBarButtonItem = btn;

    
    // ① 自分の senderId, senderDisplayName を設定
    self.senderId = @"User";
    self.senderDisplayName = @"classmethod";
    // ② MessageBubble (背景の吹き出し) を設定
    JSQMessagesBubbleImageFactory *bubbleFactory = [JSQMessagesBubbleImageFactory new];
    self.incomingBubble = [bubbleFactory  incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleBlueColor]];
    self.outgoingBubble = [bubbleFactory  outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    // ③ アバター画像を設定
    self.incomingAvatar = [JSQMessagesAvatarImageFactory avatarImageWithImage:_icon diameter:64];
    self.outgoingAvatar = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"default.png"] diameter:64];
    // ④ メッセージデータの配列を初期化
    self.messages = [NSMutableArray array];
    
    self.inputToolbar.contentView.leftBarButtonItem = nil;
    
    
//    [self finishReceivingMessageAnimated:YES];

//    JSQMessage *message = [JSQMessage messageWithSenderId:@"Model"
//                                              displayName:@"underscore"
//                                                     text:@"元気？"];
//    [self.messages addObject:message];
    
    [self viewDidAppear:YES];
    
    [self finishReceivingMessageAnimated:YES];

//    [self.collectionView reloadData];
//    [self scrollToBottomAnimated:animated];

    

//    [self.view addSubview:self.collectionView];
//    [self.view bringSubviewToFront:self.collectionView];
    
//    NSMutableArray *a = self.messages;
//    
//    NSLog(@"%@", a);
    
    //ドコモの初期化処理 
    [AuthApiKey initializeAuth: @"356a7231614374324d6f6f482e79674c546e2e374d46502f4633676d3279724765582e6d4e6f767a4b2e43"];
    param = [[DialogueRequestParam alloc] init];
    dialogue = [[Dialogue alloc] init];

    
    [self.view addSubview:self.backgroundImageView];
    [self.view sendSubviewToBack:self.backgroundImageView];

    
    
    
}

- (void)gotoSetting:(id)sender
{
    SettingViewController *Setting = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];//手順7で付けた名前

    [[self navigationController] pushViewController:Setting animated:YES];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.collectionView.collectionViewLayout.springinessEnabled = YES;
    
}

- (void)viewWillAppear:(BOOL)animated {
    JSQMessage *message = [JSQMessage messageWithSenderId:@"Model"
                                              displayName:@"underscore"
                                                     text:@"元気？"];
    [self.messages addObject:message];
    
    [self finishReceivingMessageAnimated:YES];
}

// ⑤ Sendボタンが押下されたときに呼ばれる
- (void)didPressSendButton:(UIButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSString *)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date
{
    // 効果音を再生する
    [JSQSystemSoundPlayer jsq_playMessageSentSound];
    // 新しいメッセージデータを追加する
    JSQMessage *message = [JSQMessage messageWithSenderId:senderId
                                              displayName:senderDisplayName
                                                     text:text];
    [self.messages addObject:message];
    // メッセージの送信処理を完了する (画面上にメッセージが表示される)
    [self finishSendingMessageAnimated:YES];
    // 擬似的に自動でメッセージを受信
    [self receiveMessage];
}

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messages objectAtIndex:indexPath.item];
}

// ② アイテムごとの MessageBubble (背景) を返す
- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.messages objectAtIndex:indexPath.item];
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.outgoingBubble;
    }
    return self.incomingBubble;
    

}

// ③ アイテムごとのアバター画像を返す
- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.messages objectAtIndex:indexPath.item];
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.outgoingAvatar;
    }
    return self.incomingAvatar;
}

// ④ アイテムの総数を返す
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.messages.count;
}

#pragma mark - Auto Message

// ⑥ 返信メッセージを受信する (自動)
- (void)receiveMessage
{
    // 2秒後にメッセージを受信する
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(didFinishMessageTimer:)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)didFinishMessageTimer:(NSTimer*)timer
{
    // 効果音を再生する
    [JSQSystemSoundPlayer jsq_playMessageSentSound];
    // 新しいメッセージデータを追加する

    NSArray *message = [self.messages valueForKey:@"text"];
//    NSLog(@"%@", [reply lastObject]);
    NSString *say = [message lastObject];
    
    
    //ドコモのAPIに送る
    // ユーザーの発話を設定する
    param.utt = say;
    //雑談対話要求処理クラスにリクエストデータを渡し、受信完了時処理を登録する
    DialogueError * sendError = [dialogue request: param
                                       onComplete: ^( DialogueResultData *resultData1)
    {
        //メソッドに送らずこの中でやる
//        // 受信完了時処理へ
        [self receiveDialogueRequest:resultData1];
//        param.context = resultData1.context;

    } onError:^( SdkError *receiveError) {
        NSLog(@"受信エラーコード=%ld",(long) receiveError.code);
        NSLog(@"受信エラー情報=%@", receiveError.localizedDescription);
        JSQMessage *message = [JSQMessage messageWithSenderId:@"Model"
                                                  displayName:@"underscore"
                                                         text:@"え？"];
        [self.messages addObject:message];
        [self finishReceivingMessageAnimated:YES];
        
    }];
    if (sendError) {
        NSLog(@"送信エラーコード=%ld",(long) sendError.code);
        NSLog(@"送信エラー情報=%@", sendError.localizedDescription);
        JSQMessage *message = [JSQMessage messageWithSenderId:@"Model"
                                                  displayName:@"underscore"
                                                         text:@"え？"];
        [self.messages addObject:message];
        [self finishReceivingMessageAnimated:YES];
    }
    
    //受信完了処理
//    NSLog(@"回答=%@", resultData.utt);
    // 対話を継続するために context にはサーバから受信した文字列を設定する。
//    param.context = resultData.context;
    // サーバー発のしりとりモードを継続するため受信したモードを設定する
//    param.mode = resultData.mode;
    // 任意の文字列を会話に設定する
//    param.utt = @"しりとりしましょう。";
    // ボタンを押したらリクエストを送信する処理へ
    
    
    
//    自分のデータベースとの通信処理(停止中)
//    //シングルクォーテーション置換
//    NSString *say2 = [say stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"];
//
//    
//    //エンコード
//    NSString* encodesay = [say2
//                            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSString *origin = @"http://geechscamp.lovepop.jp/bijintalk/index.php?";
//    NSString *url = [NSString stringWithFormat:@"%@mention=%@",origin,encodesay];
//                     
//
//    // Requestを作成
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//    // サーバーとの通信を行う
//    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    // JSONをパース
//    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
//    
//    //デコード
//    NSString* reply = [[array valueForKeyPath:@"reply"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",reply);
//    
//    JSQMessage *reply2 = [JSQMessage messageWithSenderId:@"user2"
//                                              displayName:@"underscore"
//                                                    text:resultData.utt];
//                                                     text:[array valueForKeyPath:@"reply"]];
//    [self.messages addObject:reply2];
    
    
    
    //自動に応答しない感じ
//    if ([say isEqual: @"fine"]) {
//        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
//                                                  displayName:@"underscore"
//                                                         text:@"Good!"];
//        [self.messages addObject:message];
//    } else if ([say isEqual: @"Can you marry me?"]) {
//        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
//                                                  displayName:@"underscore"
//                                                         text:@"Sure!"];
//        [self.messages addObject:message];
//    } else if ([say isEqual: @"Really?"]) {
//        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
//                                                  displayName:@"underscore"
//                                                         text:@"Really! I love you!!!"];
//        [self.messages addObject:message];
//    } else if ([say isEqual: @"おはよう "]) {
//        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
//                                                  displayName:@"underscore"
//                                                         text:@"おはよう!!!"];
//        [self.messages addObject:message];
//    } else {
//        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
//                                                  displayName:@"underscore"
//                                                         text:@"How are you?"];
//        [self.messages addObject:message];
//    }


    
    // メッセージの受信処理を完了する (画面上にメッセージが表示される)
//    [self finishReceivingMessageAnimated:YES];
}

- (void) receiveDialogueRequest:(DialogueResultData *) resultData2 {
    JSQMessage *reply2 = [JSQMessage messageWithSenderId:@"Model"
                                             displayName:@"underscore"
                                                    text:resultData2.utt];
    [self.messages addObject:reply2];
    
    [self finishReceivingMessageAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
