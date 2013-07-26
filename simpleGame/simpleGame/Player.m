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
@synthesize hp;
@synthesize level;
@synthesize state;
@synthesize jumpa;
@synthesize jumpt;
@synthesize vc;

-(id)initWithParams:(int)xi :(int)yi :(NSString *)srci :(UIViewController*)viewController{
	x = xi;
	y = yi;
	width = 100;
	height = 100;
	playerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chicken.png"]];
	dead = NO;
	hp = 100;
	state = 0;
	jumpa = 0;
	jumpt = 0;
	vc = viewController;
	
	return self;
}



-(UIView*)draw {
	playerView.frame = CGRectMake(0, 150, 50, 50);
	[vc.view addSubview:playerView];
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
	BOOL out = NO;
	for (int i = 0; i < [viewArray count]; i++)
	{
		if ( [self collision:viewArray[i] ])
		{
			jumpt = 0;
			out = true;
		}
	}
	if (y >= 145)
	{
		jumpt = 0;
		out = true;
	}
	y = undoY;
	return out;
}

-(BOOL)collision:(UIImageView*)entView {
	return CGRectIntersectsRect(playerView.bounds, entView.bounds);
}

-(void)fall :(NSMutableArray*)viewArray;
{
	int undoY = y;
	if (y<145) {
		y = y + 2;
	}
	else if (y>145) {
		y = 145;
	}
	y = y - jumpa;
	if (jumpa >= 1) {
		jumpa = jumpa - 1;
	}
	int undoIt = 0;
	for (int i = 0; i < [viewArray count]; i++) {
		//if (collision(viewArray[i])) {
		//	undoIt += 1;
		//}
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
		x = x+2;
	}
	if (d == 1)
	{
		x = x-2;
	}
	int undoIt = 0;
	for (int i = 0; i< [viewArray count]; i++) {
		if ([self collision:viewArray[i]]) {
			undoIt +=1;
		}
	}
	if (undoIt >0 || self.dead){
		
	}

}


@end
