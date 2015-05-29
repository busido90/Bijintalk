//
//  DialogueViewController.h
//  DialogueSample
//  (c) 2014 NTT DOCOMO, INC. All Rights Reserved.
//

#import <UIKit/UIKit.h>

@interface DialogueViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *myutt;
@property (weak, nonatomic) IBOutlet UITextField *context;
@property (weak, nonatomic) IBOutlet UITextField *nickname;
@property (weak, nonatomic) IBOutlet UITextField *nickname_y;
@property (weak, nonatomic) IBOutlet UITextField *sex;
@property (weak, nonatomic) IBOutlet UITextField *bloodtype;
@property (weak, nonatomic) IBOutlet UITextField *birthdateY;
@property (weak, nonatomic) IBOutlet UITextField *birthdateM;
@property (weak, nonatomic) IBOutlet UITextField *birthdateD;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *constellations;
@property (weak, nonatomic) IBOutlet UITextField *place;
@property (weak, nonatomic) IBOutlet UITextField *mode;
@property (weak, nonatomic) IBOutlet UITextField *character;
@property (weak, nonatomic) IBOutlet UITextField *reply;

@property(nonatomic,strong) UITapGestureRecognizer *singleTap;

@end