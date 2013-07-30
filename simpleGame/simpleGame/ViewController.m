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
@synthesize backView;

BOOL isRD = NO;
BOOL isLD = NO;

- (void)viewDidLoad
{
	[super viewDidLoad];
//	background = @"splash.png";
	
//	NSError *error = NULL;
//	NSData *levels = [[NSData alloc] initWithContentsOfFile:@"levels.json"];
//	json = [NSJSONSerialization JSONObjectWithData: levels options:kNilOptions error:&error];
//	NSString *jsonData = [[NSString alloc] initWithContentsOfFile:@"levels.json" encoding:NSUTF8StringEncoding error:nil];

	viewArray = [[NSMutableArray alloc]init];
	
	NSString *deviceType = [UIDevice currentDevice].model;
	if ([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"]) {
		NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"levels@2x" withExtension:@"json"];
		NSData *someData = [[NSData alloc] initWithContentsOfURL:fileURL];
		json = [NSJSONSerialization JSONObjectWithData:someData options:kNilOptions error:nil];
		
		NSURL *fileURL2 = [[NSBundle mainBundle] URLForResource:@"ents@2x" withExtension:@"json"];
		NSData *someData2 = [[NSData alloc] initWithContentsOfURL:fileURL2];
		ents = [NSJSONSerialization JSONObjectWithData:someData2 options:kNilOptions error:nil];
	}
	else if ([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"]) {
		NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"levels@1x" withExtension:@"json"];
		NSData *someData = [[NSData alloc] initWithContentsOfURL:fileURL];
		json = [NSJSONSerialization JSONObjectWithData:someData options:kNilOptions error:nil];
	
		NSURL *fileURL2 = [[NSBundle mainBundle] URLForResource:@"ents@1x" withExtension:@"json"];
		NSData *someData2 = [[NSData alloc] initWithContentsOfURL:fileURL2];
		ents = [NSJSONSerialization JSONObjectWithData:someData2 options:kNilOptions error:nil];
	}
	
//	NSLog(@"Say stuff : %@", [json objectForKey:@"7"]);
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


-(void)newGame {
	backView.image = [UIImage imageNamed:@"background.png"];
	[player killIt:@"reset"];
	player = nil;
	player = [[Player alloc] initWithParams:0 :150 :self];
	[player draw];
	player.score = 0;
	won = 0;
	for (UIView *subview in [backView subviews]) {
		[subview removeFromSuperview];
	}
	//clear Timer
	[startO setTitle:@"Reset" forState:UIControlStateNormal];
}

-(void)loadGame:(int)lvl {
	//clear initial timer
	player.dead = NO;
	player.jumpa = 0;
	level = lvl;
	
	for (Entity *ent in viewArray) {
		[ent.entView removeFromSuperview];
	}
	[viewArray removeAllObjects];
	NSDictionary *levelDict = [json objectForKey:[[NSString alloc] initWithFormat:@"%d",level]];
	NSArray *levelEntArr = levelDict[@"ent"];

	
//	NSLog(@" # %@", levelEntArr[1][1]);
	
	for (int i = 0; i<[levelEntArr count]; i++) {
		Entity *ent = [[Entity alloc] initWithParams:levelEntArr[i][0] :[levelEntArr[i][1] integerValue]:[levelEntArr[i][2] integerValue] :backView :ents];
		[ent draw];
		[viewArray addObject:ent];
//		NSLog(@"stuff:%@", viewArray);
	}
	player.x = [[json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][0] integerValue];
	player.y = [[json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][1] integerValue];
	//[json obj]
	[player resurrect];
	//clear game timer
	[timer invalidate];
	timer = nil;
	timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
}

-(void)timerUpdate {
	[player redraw];
	[player fall:viewArray];
	
	if (isRD) {
		[player move:0 :viewArray];
	}
	if (isLD) {
		[player move:1 :viewArray];
	}
	
	if (player.winLvl) {
		player.winLvl = NO;
		level++;
		[self loadGame:level];
		NSLog(@"%d", level);
	}
	if (player.dead) {
		player.dead = NO;
		[self loadGame:level];
	}
}

- (IBAction)start:(id)sender {
	[viewArray removeAllObjects];
	[timer invalidate];
	timer = nil;
	[self newGame];
	[self loadGame:1];
}

- (IBAction)next:(id)sender {
}

- (IBAction)sendScore:(id)sender {
}

- (IBAction)seeScores:(id)sender {
}

- (IBAction)jump:(id)sender {
	[player jump:viewArray];
}

- (IBAction)rightDn:(id)sender {
	isRD = YES;
}

- (IBAction)leftDn:(id)sender {
	isLD = YES;
}

- (IBAction)rightUp:(id)sender {
	isRD = NO;
}

- (IBAction)leftUp:(id)sender {
	isLD = NO;
}
@end
