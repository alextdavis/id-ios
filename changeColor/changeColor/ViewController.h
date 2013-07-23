//
//  ViewController.h
//  changeColor
//
//  Created by iD Student on 7/22/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
	
	IBOutlet UIImageView *yourImage;
	IBOutlet UIImageView *aiImage;
	IBOutlet UILabel *result;
	IBOutlet UIView *viewBackground;
	IBOutlet UILabel *aiScore;
	IBOutlet UILabel *yourScore;
}
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;



@end
