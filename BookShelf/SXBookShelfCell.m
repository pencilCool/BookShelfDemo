//
//  SXBookShelfCellTableViewCell.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXBookShelfCell.h"

@implementation SXBookShelfCell
{
    BOOL isConstrainsAdded;
}


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        isConstrainsAdded = NO;
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self configSubView];
        [self configLayout];
       
    }
    return  self;
}
- (void)configSubView
{
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.progressLabel];
}


- (void)configLayout{
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(8);
        make.left.equalTo(self.contentView.mas_left).with.offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(- 8);
        make.height.equalTo(@120);
        make.width.equalTo(@74);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).with.offset(8);
        make.top.equalTo(self.coverImageView.mas_top);
        
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).with.offset(8);
        make.centerY.equalTo(self.contentView);
       
    }];
    
    [self.progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).with.offset(8);
        make.bottom.equalTo(self.coverImageView.mas_bottom);
    }];
}





- (UIImageView *)coverImageView
{
    if (!_coverImageView) {
        _coverImageView = [UIImageView new];
        _coverImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _coverImageView;
}


- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        [_nameLabel sizeToFit];
    }
    return _nameLabel;
}


- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [UILabel new];
        [_authorLabel sizeToFit];
      
    }
    return _authorLabel;
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [UILabel new];
        [_progressLabel sizeToFit];
       // _progressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _progressLabel;
}

- (void)layoutSubviews {
    
//    if (!isConstrainsAdded) {
//        
//        isConstrainsAdded = YES;
//    }
    
    [super layoutSubviews];
}

- (void)updateConstraints{
    
    [super updateConstraints];
 
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
