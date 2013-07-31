//
//  ViewController.h
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Entity.h"
#import "lvlViewController.h"

@interface ViewController : UIViewController {
	
//	IBOutlet UIImageView *backView;
	IBOutlet UILabel *scoreLabel;
	IBOutlet UIButton *startO;
	
	NSTimer *timer;
	
	int won;
	NSString *background;
	int level;
	NSDictionary *json;
	NSDictionary *ents;
	Player *player;
	
}

@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, strong) IBOutlet UIImageView *backView;

- (IBAction)start:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)sendScore:(id)sender;
- (IBAction)seeScores:(id)sender;
- (IBAction)jump:(id)sender;
- (IBAction)rightDn:(id)sender;
- (IBAction)leftDn:(id)sender;
- (IBAction)rightUp:(id)sender;
- (IBAction)leftUp:(id)sender;

-(void) timerUpdate;

@end
