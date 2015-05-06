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
    
    
    // ① 自分の senderId, senderDisplayName を設定
    self.senderId = @"user1";
    self.senderDisplayName = @"classmethod";
    // ② MessageBubble (背景の吹き出し) を設定
    JSQMessagesBubbleImageFactory *bubbleFactory = [JSQMessagesBubbleImageFactory new];
    self.incomingBubble = [bubbleFactory  incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleBlueColor]];
    self.outgoingBubble = [bubbleFactory  outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    // ③ アバター画像を設定
    self.incomingAvatar = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"User2.jpeg"] diameter:64];
    self.outgoingAvatar = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"User1.jpeg"] diameter:64];
    // ④ メッセージデータの配列を初期化
    self.messages = [NSMutableArray array];
    
    self.inputToolbar.contentView.leftBarButtonItem = nil;
    
    JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                              displayName:@"underscore"
                                                     text:@"Good Morning!"];
    
    [self.messages addObject:message];
    
//    NSMutableArray *a = self.messages;
//    
//    NSLog(@"%@", a);

    
        
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
    // 1秒後にメッセージを受信する
    [NSTimer scheduledTimerWithTimeInterval:1
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

    NSArray *reply = [self.messages valueForKey:@"text"];
//    NSLog(@"%@", [reply lastObject]);
    NSString *say = [reply lastObject];
    
    NSString *origin = @"http://自分で所有しているドメイン?";
    NSString *url = [NSString stringWithFormat:@"%@username=%@&password=%@",origin,name,pass];
                     
                     
                     @try {
                         // NSURLからNSURLRequest
                         NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
                         // サーバーとの通信を行う(URLRequest)
                         NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                         // データを取ってくる
                         NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
                         
                         NSLog(@"%@",array);
                         
                     } @catch(NSException *exception) {
                         NSLog(@"[ERROR]\nurl[%@]\nexception[%@]", encodeName, exception);
                         
                         //AlertViewの設定
                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"インターネット接続エラー" message:@"時間をおいてお試しください" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                         
                         [alert show];
                         
                     } @finally {
                         NSLog(@"終了");
                     }
                     NSLog(@"check");
    
    
    if ([say isEqual: @"fine"]) {
        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                                  displayName:@"underscore"
                                                         text:@"Good!"];
        [self.messages addObject:message];
    } else if ([say isEqual: @"Can you marry me?"]) {
        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                                  displayName:@"underscore"
                                                         text:@"Sure!"];
        [self.messages addObject:message];
    } else if ([say isEqual: @"Really?"]) {
        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                                  displayName:@"underscore"
                                                         text:@"Really! I love you!!!"];
        [self.messages addObject:message];
    } else if ([say isEqual: @"おはよう "]) {
        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                                  displayName:@"underscore"
                                                         text:@"おはよう!!!"];
        [self.messages addObject:message];
    } else {
        JSQMessage *message = [JSQMessage messageWithSenderId:@"user2"
                                                  displayName:@"underscore"
                                                         text:@"How are you?"];
        [self.messages addObject:message];
    }


    
    // メッセージの受信処理を完了する (画面上にメッセージが表示される)
    [self finishReceivingMessageAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
