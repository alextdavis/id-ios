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

@interface ViewController : UIViewController {
	
	IBOutlet UIImageView *backView;
	IBOutlet UILabel *scoreLabel;
	IBOutlet UIButton *startO;
	
	NSTimer *timer;
	
	int score;
	int won;
	NSString *background;
	int level;
	NSDictionary *json;
	Player *player;
	
}

@property (nonatomic, strong) NSMutableArray *viewArray;

- (IBAction)start:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)sendScore:(id)sender;
- (IBAction)seeScores:(id)sender;

-(void) timerUpdate;

@end
