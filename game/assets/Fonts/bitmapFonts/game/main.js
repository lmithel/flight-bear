// Initialize Phaser, and creates a 400x490px game
var game = new Phaser.Game(400, 490, Phaser.AUTO, 'gameDiv');
var hello;
var owl;
var pipecount = 0;
var finalscore = 0; 

var startState = {


    preload: function() { 

        game.stage.backgroundColor = '#D3F861';
        game.load.spritesheet('owl', 'assets/owl.png', 80, 80, 22);

        game.load.bitmapFont('carrier_command', 'assets/fonts/bitmapFonts/carrier_command.png', 'assets/fonts/bitmapFonts/carrier_command.xml');
    },

    create: function() { 
        // Set the physics system

        owl = game.add.sprite(100, 245, 'owl');

        owl.animations.add('fly');
        owl.animations.play('fly',22, true);
        game.add.bitmapText(5, 10, 'carrier_command','Use Arrow Keys to Move',15);
        game.add.bitmapText(40, 200, 'carrier_command','Press UP Arrow',20);
        game.add.bitmapText(45, 230, 'carrier_command','to Start Game',20);
    },

    update: function() {

        if (game.input.keyboard.isDown(Phaser.Keyboard.UP))
        {
            game.state.start('main');
        }
    },
};
// Creates a new 'main' state that will contain the game
var mainState = {

    // Function called first to load all the assets
    preload: function() { 
        // Change the background color of the game
        game.stage.backgroundColor = '#D3F861';

        // Load the bird sprite
        game.load.spritesheet('owl', 'assets/owl.png', 80, 80, 22);

        // Load the pipe sprite
        game.load.image('pipe', 'assets/subculture-coffee-icon-black.png');  
        game.load.image('pipegrey', 'assets/subculture-coffee-icon-grey.png');

        game.load.image('hellopic', 'assets/hello.png');

        game.load.bitmapFont('carrier_command', 'carrier_command.png', 'carrier_command.xml');
    },
//var owl;
    // Fuction called after 'preload' to setup the game 
    create: function() { 
        // Set the physics system

        game.physics.startSystem(Phaser.Physics.ARCADE);

        // Display the bird on the screen
        //this.bird = this.game.add.sprite(100, 245, 'bird');
        owl = game.add.sprite(100, 245, 'owl');

        owl.animations.add('fly');
        owl.animations.play('fly',22, true);

        game.physics.arcade.enable(owl);
        owl.body.collideWorldBounds = true;

        // Create a group of 20 pipes
        this.pipes = game.add.group();
        this.pipes.enableBody = true;
        this.pipes.createMultiple(20, 'pipe');  

        // Timer that calls 'addRowOfPipes' ever 1.5 seconds
        this.timer = this.game.time.events.loop(2000, this.addRowOfPipes, this);  
               
        //emitter = game.add.emitter(0, 0, 100);

        //emitter.makeParticles('pipe');
        //emitter.gravity = 200;

        // Add a score label on the top left of the screen
        this.score = 0;
        this.labelScore = this.game.add.text(190, 30, "0", { font: "30px Arial", fill: "#ffffff" }); 

    },


    // This function is called 60 times per second
    update: function() {

        if (game.input.keyboard.isDown(Phaser.Keyboard.LEFT))
        {
            owl.x -= 4;
            owl.animations.play('fly',22, true);
        } 

        if (game.input.keyboard.isDown(Phaser.Keyboard.RIGHT))
        {
            owl.x += 4;
            owl.animations.play('fly',22, true);
        }

        if (game.input.keyboard.isDown(Phaser.Keyboard.DOWN))
        {
            owl.y += 4;
            owl.animations.play('fly',22, true);
        } 

        if (game.input.keyboard.isDown(Phaser.Keyboard.UP))
        {
            owl.y -= 4;
            owl.animations.play('fly',22, true);
        } 

        game.physics.arcade.overlap(owl, this.pipes, this.good, null, this); 
        //game.physics.arcade.overlap(owl, this.pipes, particleBurst, this); 


        if (pipecount > 5){
            pipecount = 0;
            owl.animations.stop();
            this.pipes.destroy();
            owl.y=-10;
            finalscore = this.score;
            this.endGame();
        };
    },

    pipeDestroy: function(pipe) {

    //game.add.tween(pipe).to( { alpha: 0 }, 2000, Phaser.Easing.Linear.None, true);
    pipe.destroy();
    },

    good: function() {
  
        this.score += 1;
        this.labelScore.text = this.score; 
        var pipe = this.pipes.getFirstAlive(0);
        pipe.checkWorldBounds = true;
        pipe.outOfBoundsKill = true;

        //particleBurst(pipe);

        hello = game.add.bitmapText(80, 80, 'carrier_command','Employment!',20);
        pipe.loadTexture('pipegrey',0);
        game.add.tween(hello).to({y: -100}, -1, Phaser.Easing.Linear.None, true);
        game.time.events.add(Phaser.Timer.SECOND * 2, pipe.destroy, pipe);  
        //game.add.tween(pipe).to({y: -100}, -1, Phaser.Easing.Linear.None, true);
        //pipeDestroy(pipe);
    },

    pipeDestroy: function(pipe){
        pipe.destroy();
    },
    // Restart the game
    endGame: function() {
        // Start the 'main' state, which restarts the game
        game.state.start('end');
    },

    restartGame: function() {
        // Start the 'main' state, which restarts the game
        game.state.start('start');
    },

    // Add a pipe on the screen
    addOnePipe: function(x, y) {
        // Get the first dead pipe of our group
        var pipe = this.pipes.getFirstDead();

        // Set the new position of the pipe
        pipe.reset(x, y);

        // Add velocity to the pipe to make it move left
        pipe.body.velocity.x = -200; 
               
        // Kill the pipe when it's no longer visible 
        pipe.checkWorldBounds = true;
        pipe.outOfBoundsKill = true;
    },

    // Add a row of 6 pipes with a hole somewhere in the middle
    addRowOfPipes: function() {
        var hole = Math.floor(Math.random()*5)+1;
        this.addOnePipe(400, hole*60+10);  
        pipecount++; 
    
    },
};



var endState = {


    preload: function() { 

        game.stage.backgroundColor = '#D3F861';

        game.load.bitmapFont('carrier_command', 'assets/fonts/bitmapFonts/carrier_command.png', 'assets/fonts/bitmapFonts/carrier_command.xml');
    },

    create: function() { 
        // Set the physics system
        game.add.bitmapText(5, 20, 'carrier_command','Congratulations!',15);
        game.add.bitmapText(40, 70, 'carrier_command','\n You Scored:' + finalscore,20);
        //game.add.bitmapText(300, 60, 'carrier_command','\n' + finalscore,20);
        game.add.bitmapText(5, 230, 'carrier_command','Explore our site to',15);
        game.add.bitmapText(5, 250, 'carrier_command','find out more about',15);
        game.add.bitmapText(5, 270, 'carrier_command','supported employment!',15);
        game.add.bitmapText(45, 320, 'carrier_command','Or Press UP Arrow',15);
        game.add.bitmapText(45, 340, 'carrier_command','to Play Again',15);
    },

    update: function() {

        if (game.input.keyboard.isDown(Phaser.Keyboard.UP))
        {
            this.restartGame();
        }
    },

    restartGame: function() {
        // Start the 'main' state, which restarts the game
        game.state.start('main');
    },
};

// Add and start the 'main' state to start the game
game.state.add('start', startState);
game.state.add('main', mainState);  
game.state.add('end', endState);
game.state.start('start'); 
