# Space Invaders

The source code for an implementation of a two-player version of Space Invaders. Networking relies on a server running on an EC2 instance for both players to connect to. Uses Pygame for the game source code itself, and DynamoDB for storing persistent game state. The game has a feature where it is able to save its state when a player loses connection, allowing both players to pick up where they left off when the player reconnects. The database also keeps track of a scoreboard.

An FPGA is used as the controller, allowing the player to move left and right by tilting the DE10 board. Shooting is controlled by pressing the button. The number of lives the player currently has is shown as the number of lit LEDs.

![Gameplay](/img/Gameplay.png)
An example of gameplay.

![System architecture](/img/Architecture.png)
The overall architecture of the system.

![Networking example](/img/Network%20example.png/)
An example of a typical progression through the stages of the game, from the perspective of networking.

## Playing the game

To play the game:
- Run server/server.py on an EC2 instance.
- Update SERVER_NAME in client/tcp_client.py with the public IP address of the instance.
    - One of the limitations of the free EC2 instance is that the public IP resets every time the instance is started, making this step necessary.
- Two people can play by running client/game.py on their machines.
