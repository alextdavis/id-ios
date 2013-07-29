//
//  Player.h
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "globalVars.h"


@interface Player : NSObject

@property int x;
@property int y;
@property int width;
@property int height;
@property UIImageView *playerView;
@property BOOL dead;
@property int score;
@property int level;
@property int state;
@property int jumpa;
@property int jumpt;
@property UIViewController *vc;

-(id)initWithParams:(int)xi :(int)yi :(UIViewController*)viewController;

-(UIView*)draw;
-(UIView*)redraw;
-(void)killIt:(NSString*)cause;
-(void)resurrect;
-(BOOL)grounded :(NSMutableArray*)viewArray;
-(void)fall :(NSMutableArray*)viewArray;
-(BOOL)collision :(UIImageView*)entView;
-(void)move :(int)d :(NSMutableArray*)viewArray;
-(void)jump :(NSMutableArray*)viewArray;

@end
