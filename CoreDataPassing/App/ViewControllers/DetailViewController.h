//
//  DetailViewController.h
//  CoreDataPassing
//
//  Created by azu on 2013/04/17.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
