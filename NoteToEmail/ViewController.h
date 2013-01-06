//
//  ViewController.h
//  NoteToEmail
//
//  Created by Sean Everett on 1/5/13.
//  Copyright (c) 2013 Sean Everett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate> //add the delegate
- (IBAction)showEmail:(id)sender;

@end
