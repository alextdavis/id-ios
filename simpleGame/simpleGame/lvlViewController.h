//
//  lvlViewController.h
//  simpleGame
//
//  Created by iD Student on 7/31/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface lvlViewController : UIViewController {
	NSUserDefaults *appSettings;
	
	NSArray *titleArray;
	NSArray *pointArray;
	NSArray *errorArray;
	NSArray *urlArray;
}
- (IBAction)done:(id)sender;


@end
