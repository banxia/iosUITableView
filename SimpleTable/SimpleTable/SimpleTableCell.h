//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by jin jianxiong on 9/5/13.
//  Copyright (c) 2013 jin jianxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *nameLabel;

@property(nonatomic,weak) IBOutlet UILabel *prepTimeLabel;

@property(nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@property(nonatomic, weak) IBOutlet UILabel *timeLabel;

@end
