//
//  DetailViewController.m
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)setCall:(id<SINCall>)call {
    _call = call;
    _call.delegate = self;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([self.call direction] == SINCallDirectionIncoming) {
        self.AnswerButton.hidden = NO;
        //self.detailDescriptionLabel.text = [NSString stringWithFormat:@"call from %@", [self.detailItem friendName]];
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"call from Kate Smith"];
    } else {
        self.AnswerButton.hidden = YES;
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"calling %@...", [self.detailItem friendName]];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AnswerAction:(id)sender {
    [self.call answer];
    self.AnswerButton.hidden = YES;
    self.detailDescriptionLabel.text = @"";
    
}

- (IBAction)HangupAction:(id)sender {
    [self.call hangup];
}

- (void)callDidEstablish:(id<SINCall>)call {
    self.detailDescriptionLabel.text = @"";
}

- (void)callDidEnd:(id<SINCall>)call {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
