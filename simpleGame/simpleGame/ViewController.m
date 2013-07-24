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

- (void)viewDidLoad
{
    [super viewDidLoad];
	background = @"bg";
	
	NSError *error = nil;
	NSData *levels = [[NSData alloc] initWithContentsOfFile:@"File"];
	json = [NSJSONSerialization
						  JSONObjectWithData: levels
						  options:kNilOptions error:&error];
	
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint touchpoint = [touch locationInView:[self view]];
	if (CGRectContainsPoint(imageViewA.frame, touchpoint)) {
		statusLabel.text = @"A is Touched!!!";
	}
	else if (CGRectContainsPoint(imageViewB.frame, touchpoint)) {
		statusLabel.text = @"B is Touched!!!";
	}
	else
	{
		statusLabel.text = @"";
	}
}*/

-(void)newGame {
	background = @"bg";
	player = [[Player alloc] init];
	[viewArray removeAllObjects];
	[viewArray addObject:player.draw];
	score = 0;
	won = 0;
	
	//clear Timer
	startO.titleLabel.text = @"Reset";
}

-(void)loadGame:(int)lvl {
	//clear Timer
	level = lvl;
	[viewArray removeAllObjects];
	
	for (int i = 0; i<[[json objectForKey:[[NSString alloc] initWithFormat:@"%d",level]][@"ent"] count]; i++) {
		Entity *ent = [[Entity alloc] init];
		[viewArray addObject:ent];
	}
	player.x = [json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][0];
	player.y = [json objectForKey:[[NSString alloc] initWithFormat:@"%d", level]][@"player"][1];
	player.resurrect;
	
}

- (IBAction)start:(id)sender {
	self.newGame;
	
}

- (IBAction)next:(id)sender {
}

- (IBAction)sendScore:(id)sender {
}

- (IBAction)seeScores:(id)sender {
}
@end
