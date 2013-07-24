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
	
	
	int score;
	int won;
	NSString *background;
	int level;
	NSDictionary *json;
	NSMutableArray *viewArray;
	Player *player;
	
}
- (IBAction)start:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)sendScore:(id)sender;
- (IBAction)seeScores:(id)sender;

@end
