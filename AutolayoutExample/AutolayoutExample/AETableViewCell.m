//
//  AETableViewCell.m
//  AutolayoutExample
//
//  Created by Ben Norris on 10/2/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import "AETableViewCell.h"

static const CGFloat margin = 10.0;

@implementation AETableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.photoButton = [UIButton new];
    self.photoButton.frame = CGRectMake(margin, 6, 48, 48);
    [self.photoButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.photoButton setTintColor:[UIColor whiteColor]];
    [self.photoButton setBackgroundColor:[UIColor blueColor]];
    self.photoButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.photoButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.photoButton];
    
    self.nameField = [UITextField new];
    self.nameField.frame = CGRectMake(margin + 48 + margin, 6, 125, 48);
    self.nameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.nameField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.nameField];
    
    self.scoreField = [UITextField new];
    self.scoreField.frame = CGRectMake(margin + 48 + margin + 125 + margin, 6, 55, 48);
    self.scoreField.borderStyle = UITextBorderStyleRoundedRect;
    [self.scoreField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.scoreField];
    
    self.scoreStepper = [UIStepper new];
    self.scoreStepper.frame = CGRectMake(margin + 48 + margin + 125 + margin + 55 + margin, 15, 0, 0);
    [self.scoreStepper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.scoreStepper];
    
    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(_photoButton, _nameField, _scoreField, _scoreStepper);
    
    NSArray *constraints = [NSLayoutConstraint
                            constraintsWithVisualFormat:@"h:|-[_phoroButton]-[_nameField(>=95)]-[_scoreField(>=45)]-(>=8)-[_scoreStepper]-|"
                                                options:NSLayoutFormatAlignAllCenterY
                                                metrics:nil
                                                  views:viewDictionary];
    [self.contentView addConstraints:constraints];
    
    NSLayoutConstraint *oneConstraint = [NSLayoutConstraint constraintWithItem:self.scoreField
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1.0
                                                                      constant:0.0];
    [self.contentView addConstraint:oneConstraint];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"v:|-[_photoButton]-|"
                                                          options:0
                                                          metrics:nil
                                                            views:viewDictionary];
    [self.contentView addConstraints:constraints];
    
    oneConstraint = [NSLayoutConstraint constraintWithItem:self.photoButton
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.photoButton
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.0
                                               constant:0.0];
    
    [self.contentView addConstraint:oneConstraint];
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.photoButton.layer.cornerRadius = self.photoButton.frame.size.width / 2;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
