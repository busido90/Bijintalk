//
//  ViewController.h
//  002_BijinJSQMessageView
//
//  Created by 永山 大志 on 2015/05/03.
//  Copyright (c) 2015年 永山 大志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSQMessagesViewController/JSQMessages.h>
//#import "ConfigViewController.h"
#import "SettingViewController.h"
#import "Dialogue.h"
#import "AuthApiKey.h"
#import "DialogueError.h"
#import "DialogueRequestParam.h"
#import "DialogueResultData.h"
#import "SdkError.h"
#import "JSQMessagesComposerTextView.h"

@interface ViewController : JSQMessagesViewController{
    DialogueRequestParam * param;
    Dialogue * dialogue;
    DialogueResultData * resultData;
    DialogueError * requestError;
}

@property (nonatomic, assign) UIImage *backgroundImage;
@property (nonatomic, assign) UIImage *icon;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

