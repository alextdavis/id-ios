//
//  Player.h
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int x;
@property int y;
@property int width;
@property int height;
@property UIImageView *playerView;
@property BOOL dead;
@property int hp;
@property int level;
@property int state;
@property int jumpa;
@property int jumpt;
@property UIViewController *vc;

-(UIView*)draw;
-(void)killIt:(NSString*)cause


@end
