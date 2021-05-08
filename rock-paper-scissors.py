# Rock Paper Sciccors Lizard Spock

from random import randint

# Initializing variables
humanPoints = 0
machinePoints = 0
gameRound = 0
maxGameRounds = 3

gameElement = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]

def returnWinnerOfRound(human, machine):
    """This function returns the winner of each round"""
    # This implements Sheldon Cooper's Rock, Paper, Scissors, Lizard, Spock game
    # from the TV Show "The Big Bang Theory"
    #
    # As Sheldon explains, 
    # "Scissors cuts paper, 
    # paper covers rock, 
    # rock crushes lizard, 
    # lizard poisons Spock, 
    # Spock smashes scissors, 
    # scissors decapitates lizard, 
    # lizard eats paper, 
    # paper disproves Spock, 
    # Spock vaporizes rock, 
    # and as it always has, rock crushes scissors."
    
    global humanPoints, machinePoints
    if human == machine:
        message = "Draw game!"
    elif human == 2 and machine == 1:
        humanPoints += 1
        message = "Scissors cuts Paper."
    elif human == 1 and machine == 0:
        humanPoints += 1
        message = "Paper covers rock."
    elif human == 0 and machine == 3:
        humanPoints += 1
        message = "Rock crushes Lizard."
    elif human == 3 and machine == 4:
        humanPoints += 1
        message = "Lizard poisons Spock."
    elif human == 4 and machine == 2:
        humanPoints += 1
        message = "Spock smashes Scissors."
    elif human == 2 and machine == 3:
        humanPoints += 1
        message = "Scissors decapitates Lizard."
    elif human == 3 and machine == 1:
        humanPoints += 1
        message = "Lizard eats Paper."
    elif human == 1 and machine == 4:
        humanPoints += 1
        message = "Paper disproves Spock."
    elif human == 4 and machine == 0:
        humanPoints += 1
        message = "Spock vaporizes Rock."
    elif human == 0 and machine == 2:
        humanPoints += 1
        message = "Rock crushes Scissors."
    else:
        machinePoints += 1
        message = "You lose!"
    return message

def returnWinnerOfGame(human, machine):
    """This function returns the winner of the game"""
    if human > machine:
        return "You won the game!"
    elif human == machine:
        return "Draw game!"
    else:
        return "You've lost the game!"

def runGame():
    """This function runs the game"""
    for i in range(maxGameRounds):    
        print("Round", i + 1,"! Fight!")
        print("Your choice:")
        print("Remember: Rock = 0, Paper = 1, Scissors = 2, Lizard = 3, Spock = 4")
        humanDraw = 5

        # Error handling in case the user enters an invalid number
        while humanDraw > 4:
            humanDraw = int(input())
            if humanDraw <= 4:
                break
            else:
                print("Please make sure to enter a number less than 5!")

        print("Your draw:", gameElement[humanDraw])
        
        # Random draw
        machineDraw = randint(0,4)
        print("Machine's draw:", gameElement[machineDraw])
        print(returnWinnerOfRound(humanDraw, machineDraw),"\n")
    print(returnWinnerOfGame(humanPoints, machinePoints))

runGame()