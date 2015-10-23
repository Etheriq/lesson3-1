//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UILabel *leftCardsCounter;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;

@end

@implementation ViewController

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
	return _deck;
}

- (IBAction)resetDeckButtonTaped:(UIButton *)sender {
    self.deck = nil;
    self.deck = [[PlayingCardDeck alloc] init];
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
}

- (void) viewDidLoad {
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
}

- (IBAction)cardButtonTapped:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setTitle:@""
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
	} else {
		Card *card = [self.deck drawRandomCard];
        
        if (card) {
            self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        } else {
            self.leftCardsCounter.text = @"Desk is empty";
        }
		
	}
}

@end
