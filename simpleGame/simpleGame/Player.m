//
//  Player.m
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;
@synthesize playerView;
@synthesize dead;
@synthesize winLvl;
@synthesize score;
@synthesize level;
@synthesize state;
@synthesize jumpa;
@synthesize jumpt;
@synthesize ground;
@synthesize vc;

-(id)initWithParams:(int)xi :(int)yi :(UIViewController*)viewController{
	x = xi;
	y = yi;
	NSString *deviceType = [UIDevice currentDevice].model;
	if ([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"]) {
		width = 100;
		height = 100;
		ground = 290;
	}
	else if ([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"]) {
		width = 50;
		height = 50;
		ground = 145;
	}
	else {
		NSLog(@"%@", deviceType);
	}
	playerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chicken.png"]];
	dead = NO;
	winLvl = NO;
	state = 0;
	jumpa = 0;
	jumpt = 0;
	vc = viewController;
	
	return self;
}



-(UIView*)draw {
	[playerView setFrame:CGRectMake(0, 150, 100, 100)];
	[vc.view addSubview:playerView];
	return playerView;
}

-(UIView*)redraw {
//	NSLog(@"[%d,%d]",width, height);
	[playerView setFrame:CGRectMake(x, y, height, width)];
//	playerView.frame = CGRectMake(x, y, 50, 50);
	return playerView;
}

-(void)killIt:(NSString*)cause {
	[playerView removeFromSuperview];
}

-(void)resurrect {
	[vc.view addSubview:playerView];
}

-(BOOL)grounded:(NSMutableArray *)viewArray; {
	int undoY = y;
	y = y + 5;
	BOOL outputting = NO;
	for (int i = 0; i < [viewArray count]; i++)
	{
		if ( [self collision:viewArray[i]:viewArray ])
		{
			jumpt = 0;
			outputting = true;
		}
	}
	if (y >= ground)
	{
		jumpt = 0;
		outputting = true;
	}
	y = undoY;
	return outputting;
}

-(BOOL)collision:(Entity*)ent :(NSMutableArray*)viewArray {
	CGRect pFrame = [playerView frame];
    pFrame.origin.x = x;
    pFrame.origin.y = y;
	CGRect eFrame = [((UIImageView*)ent.entView) frame];
	BOOL outputting = CGRectIntersectsRect(pFrame, eFrame);
	//NSLog(@"%d", outputting);

	if (outputting && [ent.type isEqual: @"deco"]) {
		outputting = NO;
		NSLog(@"deco");
	}
	else if (outputting && [ent.type isEqual: @"seed"]) {
		self.score++;
		[ent.entView removeFromSuperview];
		[viewArray removeObject:ent];
		NSLog(@"seed");
	}
	else if (outputting && [ent.type isEqual: @"seed_gold"]) {
		score += 5;
		winLvl = YES;
		NSLog(@"gold");
	}
	else if (outputting && [ent.type isEqual: @"bot"]) {
		score -= 5;
		dead = YES;
		NSLog(@"bot");
	}
		
	return outputting;
}

-(void)fall :(NSMutableArray*)viewArray;
{
	int undoY = y;
	if (y<ground) {
		y = y + 2;
	}
	else if (y>ground) {
		y = 145;
	}
	y = y - jumpa;
	if (jumpa >= 1) {
		jumpa = jumpa - 1;
	}
	int undoIt = 0;
	for (int i = 0; i < [viewArray count]; i++) {
		if ([self collision:viewArray[i] :viewArray]) {
			undoIt++;
		}
	}
	if (undoIt > 0 || dead)
	{
		y = undoY;
	}
	[self grounded:viewArray];
}

-(void)move:(int)d :(NSMutableArray*)viewArray
{
	int undoX = x;
	int undoY = y;
	if (d == 0)
	{
		x +=2;
	}
	if (d == 1)
	{
		x -=2;
	}
	int undoIt = 0;
	for (int i = 0; i< [viewArray count]; i++) {
		if ([self collision:viewArray[i] :viewArray]) {
			undoIt++;
		}
	}
	if (undoIt >0 || dead){
        
		x = undoX;
		y = undoY;
	}
}

-(void)jump:(NSMutableArray*)viewArray {
	[self grounded:viewArray];
	if (jumpt < 2) {
		jumpa = 15;
		jumpt++;
	}
}

@end
