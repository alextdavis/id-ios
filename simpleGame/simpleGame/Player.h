//
//  Player.h
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject{
	int x;
	int y;
	int width;
	int height;
	UIImageView *playerView;
	BOOL dead;
	int hp;
	int level;
	int state;
	int jumpa;
	int jumpt;
	UIViewController *vc;
}

-(UIView*)draw;

@end
