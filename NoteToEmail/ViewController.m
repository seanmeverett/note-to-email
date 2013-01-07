//
//  ViewController.m
//  NoteToEmail
//
//  Created by Sean Everett on 1/5/13.
//  Copyright (c) 2013 Sean Everett. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showEmail:(id)sender
{
    //set email subject, message, and recipients
    NSString *emailSubject = @"Note To Self";
    NSString *emailMessage = @"This is the email message typed by the user."; //need to add outlet from UITextView
    NSArray *emailRecipients = [NSArray arrayWithObject:@"seanmeverett@gmail.com"]; //need to add outlet from UITextField
    
    //build the email
    MFMailComposeViewController *buildNote = [[MFMailComposeViewController alloc] init];
    buildNote.mailComposeDelegate = self;
    [buildNote setSubject:emailSubject];
    [buildNote setMessageBody:emailMessage isHTML:YES];
    [buildNote setToRecipients:emailRecipients];
    
    //view the email in completed form and edit, send, or cancel
    [self presentViewController:buildNote animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    //close email view
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)showSettings:(id)sender
{
    SettingsViewController *controller = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:NULL];
}
@end
