//
//  ViewController.m
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize viewArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
//	background = @"splash.png";
	
//	NSError *error = NULL;
//	NSData *levels = [[NSData alloc] initWithContentsOfFile:@"levels.json"];
//	json = [NSJSONSerialization JSONObjectWithData: levels options:kNilOptions error:&error];
	
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)newGame {
	NSLog(@"this");
	backView.image = [UIImage imageNamed:@"background.png"];
	player = [[Player alloc] initWithParams:0 :150 :@"player.png" :self];
	[player draw];
	score = 0;
	won = 0;
	
	//clear Timer
	[startO setTitle:@"Reset" forState:UIControlStateNormal];
}

-(void)loadGame:(int)lvl {
	//clear initial timer
	level = lvl;
	[viewArray removeAllObjects];
	
	for (int i = 0; i<[[json objectForKey:[[NSString alloc] initWithFormat:@"%d",level]][@"ent"] count]; i++) {
		Entity *ent = [[Entity alloc] init];
		[viewArray addObject:ent];
	}
	player.x = [[json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][0] integerValue];
	player.y = [[json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][1] integerValue];
	//[json obj]
	[player resurrect];
	//clear game timer
	
	timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
}

-(void)timerUpdate {
//	[player fall];
}

- (IBAction)start:(id)sender {
	[self newGame];
	
}

- (IBAction)next:(id)sender {
}

- (IBAction)sendScore:(id)sender {
}

- (IBAction)seeScores:(id)sender {
}
@end
