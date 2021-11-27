# Rock Paper Sciccors Lizard Spock
# Boris Bischoff, 2021

from random import randint

# Initializing variables
human_points = 0
machine_points = 0
game_round = 0
max_game_rounds = 3

ROCK = 0
PAPER = 1
SCISSORS = 2
LIZARD = 3
SPOCK = 4

# Defines the 5 game elements with a human-readable string
GAME_ELEMENT = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
# This list contains the winning combinations and their corresponding actions
WINNING_ELEMENT = {
                    ROCK: { SCISSORS: "crushes", LIZARD: "crushes" },
                    PAPER: { ROCK: "covers", SPOCK: "disproves" },
                    SCISSORS: { PAPER: "cuts", LIZARD: "decapitates" },
                    LIZARD: { PAPER: "eats", SPOCK: "poisons" },
                    SPOCK: { ROCK: "vaporizes", SCISSORS: "smashes" }
                }



def return_winner_of_round(human, machine):
    """This function returns the winner of each round"""
    # This implements Sheldon Cooper's Rock, Paper, Scissors, Lizard, Spock game
    # from the TV Show "The Big Bang Theory"
    
    global human_points, machine_points

    # If both the human and the machine chose the same weapon, it's a draw game.
    if GAME_ELEMENT[human] == GAME_ELEMENT[machine]:
        return "Draw game!"
    # If not, check who has won
    else:
        # Iterate through the list of the respective winning element.
        # If the machine chose an element that is in this list, it's a winning combination for the human player.
        for weapon in WINNING_ELEMENT[human]:
            if weapon == machine:
                print(GAME_ELEMENT[human] + " " + WINNING_ELEMENT[human][weapon] + " " + GAME_ELEMENT[machine])
                human_points += 1
                return "You won!"

        # If the machine chose an element that is *not* in this list, it's a losing combination for the human player.
        machine_points += 1
        return "You lose!"


def return_winner_of_game(human, machine):
    """This function returns the winner of the game"""
    if human > machine:
        return "You won the game!"
    elif human == machine:
        return "Draw game!"
    else:
        return "You've lost the game!"

def run_game():
    """This function runs the game"""
    for i in range(max_game_rounds):    
        print("Round", i + 1,"! Fight!")
        print("Your choice:")
        print("Remember: Rock = 0, Paper = 1, Scissors = 2, Lizard = 3, Spock = 4")
        human_draw = 5

        # Error handling in case the user enters an invalid number
        while human_draw > 4:
            human_draw = int(input())
            if human_draw <= 4:
                break
            else:
                print("Please make sure to enter a number less than 5!")

        print("Your draw:", GAME_ELEMENT[human_draw])
        
        # Random draw
        machine_draw = randint(0,4)
        print("Machine's draw:", GAME_ELEMENT[machine_draw])
        print(return_winner_of_round(human_draw, machine_draw),"\n")
    print(return_winner_of_game(human_points, machine_points))

run_game()