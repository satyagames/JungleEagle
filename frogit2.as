/*
 life = the life of the bug
count = bug spawn counter
spawncount = when to spawn a bug
timetarget = how long the player has
wait = how long to display level indicator
waitcount = amount of 'time' waited
sl = slowdown effect
*/
onEnterFrame = frameAction
import trigClass
import flash.geom.*
_trigRef = new trigClass()

function rotatefrog() {
	rotit = rot/10;
	if (rot == 90) {
		if (frogrot<27 && frogrot>9) {
			frogrot -= 1;
		}
		if (frogrot>26 || frogrot<10) {
			frogrot += 1;
			if (frogrot == 37) {
				frogrot = 1;
			}
		}
	}
	if (rot == 0) {
		if (frogrot<19 && frogrot>0) {
			frogrot -= 1;
		}
		if (frogrot>18) {
			frogrot += 1;
			if (frogrot == 37) {
				frogrot = 1;
			}
		}
	}
	if (rot == 180) {
		if (frogrot<18) {
			frogrot += 1;
		}
		if (frogrot>18) {
			frogrot -= 1;
		}
	}
	if (rot == 270) {
		if (frogrot<10) {
			frogrot -= 1;
			if (frogrot<0) {
				frogrot = 35;
			}
		} else if (frogrot>27) {
			frogrot -= 1;
		} else if (frogrot>9 && frogrot<27) {
			frogrot += 1;
		}
	}
	thefrog.gotoAndStop(frogrot);
}
function newlevel() {
	bugappears = new Sound();
	bugappears.attachSound("bugappears");
	getbug = new Sound();
	getbug.attachSound("getbug");
	greedeep1 = new Sound();
	greedeep1.attachSound("greedeep1");
	greedeep2 = new Sound();
	greedeep2.attachSound("greedeep2");
	greedeep3 = new Sound();
	greedeep3.attachSound("greedeep3");
	greedeep4 = new Sound();
	greedeep4.attachSound("greedeep4");
	greedeep5 = new Sound();
	greedeep5.attachSound("greedeep5");
	bwait = 0;
	bdelay = 5;
	bub = 100;
	bugs = 0;
	level++;
	if (level == 6) {
		level = 1;
	}
	attachMovie("Thefrog", "thefrog", 300);
	// reset frogs location
	x = 250;
	y = 250;
	thefrog._x = x;
	thefrog._y = x;
	frogshad._y = y+20;
	frogshad._x = x+20;
	leftv = 0;
	rightv = 0;
	upv = 0;
	downv = 0;
	sl = 0.5;
	// general vars
	bugscollected = 0;
	clocktime = 0;
	bubble = new Array();
	// init bug level data
	if (level == 1) {
		count = 0;
		spawncount = 12;
		life = 70;
		timetarget = 30;
		bugcount = 0;
		bugtarget = 30;
		//bugtarget = 2;
		bugsleft = bugtarget;
		where = new Array(149, 114, 67, 152, 41, 229, 47, 301, 87, 358, 153, 398, 221, 418, 306, 445, 399, 458, 461, 421, 460, 328, 458, 274, 452, 212, 363, 205, 273, 203, 202, 202, 123, 205, 72, 205, 152, 285, 229, 347, 297, 415, 375, 451, 445, 391, 417, 327, 352, 278, 296, 236, 236, 187, 169, 136, 152, 74, 226, 51, 288, 75, 361, 127, 406, 192, 412, 258, 378, 329, 317, 369, 205, 359, 128, 279, 155, 178, 261, 152, 270, 225);
	}
	if (level == 2) {
		count = 0;
		spawncount = 10;
		life = 70;
		timetarget = 55;
		bugcount = 0;
		bugtarget = 40;
		bugsleft = bugtarget;
		where = new Array(173, 137, 405, 100, 422, 327, 152, 426, 139, 327, 393, 418, 199, 99, 331, 240, 90, 214, 89, 409, 382, 104, 420, 416, 281, 283, 327, 340, 137, 344, 277, 40, 420, 186, 348, 108, 24, 212, 141, 200, 124, 288, 73, 403, 266, 480, 284, 194, 271, 351, 227, 200, 208, 382, 161, 206, 431, 291, 353, 91, 126, 68, 65, 155, 97, 327, 404, 332, 84, 285, 330, 121, 97, 115, 393, 138, 62, 141, 253, 152, 401, 160, 443, 224, 400, 280, 293, 273, 58, 293, 81, 372, 128, 444, 426, 404, 424, 345, 424, 286, 419, 228, 68, 235, 76, 295, 451, 249, 427, 172, 398, 109, 357, 58, 266, 50, 151, 55, 295, 243, 105, 251, 170, 419, 211, 209, 407, 111, 449, 257, 357, 336);
	}
	if (level == 3) {
		count = 0;
		spawncount = 7;
		life = 70;
		timetarget = 40;
		bugcount = 0;
		bugtarget = 40;
		bugsleft = bugtarget;
		where = new Array(340, 211, 357, 277, 302, 340, 211, 358, 150, 334, 120, 269, 124, 187, 180, 137, 270, 120, 354, 140, 401, 205, 405, 280, 376, 344, 300, 396, 201, 413, 132, 384, 78, 329, 49, 247, 59, 169, 112, 103, 200, 57, 291, 42, 379, 69, 434, 125, 463, 203, 458, 279, 437, 356, 394, 409, 324, 440, 219, 460, 131, 451, 60, 374, 25, 293, 81, 253, 169, 240, 244, 233);
	}
	if (level == 4) {
		count = 0;
		spawncount = 7;
		life = 70;
		timetarget = 40;
		bugcount = 0;
		bugtarget = 80;
		bugsleft = bugtarget;
		where = new Array(385, 213, 430, 189, 466, 118, 440, 50, 362, 26, 296, 54, 262, 105, 226, 140, 174, 114, 147, 56, 80, 40, 33, 64, 33, 121, 80, 161, 118, 202, 139, 255, 112, 307, 51, 330, 22, 389, 65, 453, 145, 459, 194, 404, 252, 368, 312, 381, 349, 435, 399, 462, 463, 425, 460, 348, 395, 276);
	}
	if (level == 5) {
		count = 0;
		spawncount = 7;
		life = 80;
		timetarget = 45;
		bugcount = 0;
		bugtarget = 70;
		bugsleft = bugtarget;
		where = new Array(258, 84, 259, 438, 337, 98, 348, 457, 410, 91, 420, 451, 346, 88, 341, 450, 268, 99, 259, 457, 182, 97, 184, 461, 112, 92, 109, 470, 49, 91, 42, 458, 50, 258, 121, 321, 194, 219, 259, 326, 318, 218, 375, 322, 436, 206, 456, 330, 365, 205, 307, 324, 236, 201, 174, 310, 121, 190, 52, 309, 61, 110, 169, 364, 209, 113, 262, 363, 339, 110, 368, 357, 408, 105, 472, 359);
	}
	levelinfo = "Collect "+bugtarget+" chickens in "+timetarget+" seconds";
	wait = 70;
	waitcount = 0;
	attachMovie("levelintro", "levelintro", 310);
	levelintro._x = 250;
	levelintro._y = 250;
	action = "levelstartwait";
}
function bubbletrail(){
	if (downv>0 || upv>0 || leftv>0 || rightv>0) {
		// Bubble trail
		bwait++;
		if (bwait>bdelay) {
			bwait = 0;
			_t = attachMovie("bubbletrail", "b"+bub, bub);
	
				_t._x = x;
				_t._y = y;
				_t._rotation=random(360)
			
			bub++;
			if (bub>150) {
				bub = 100;
			}
		}
	}
	}
function clearbugs() {
	n = bugArray.length
	while (n--) {
		_b = bugArray[n]
		removeMovieClip(_b)
		bugArray.slice(n, 1)
	}
	
}


moveit = 20;
lifeamount = 200;
buglayer = 200;
maxbugs = 25;
var gameon:Boolean = false;
level = 0;
action = "start";
function frameAction() {
	if (gameon) {
		// time section
		if (tcb == undefined) {
			tcb = getTimer();
		}
		tca = getTimer();
		bbb = tca-tcb;
		if ((tca-tcb)>1000) {
			a = (Math.floor((clocktime/timetarget)*100));
			if (a>=99) {
				gameon = false
			} else if (a>74) {
				this.clock.timetac.play();
			}
			clocktime++;
			if (clocktime>timetarget) {
				clocktime = timetarget;
				action = "gameover";
			}
			this.clock.clockhand._rotation = (360/timetarget)*clocktime;
			tcb = getTimer();
		}
		createbug();
		if (pressed>0) {
			this.thefrog.frog2.frog.play();
		}
		fw = thefrog._width;
		pressed = 0;
		// key testing area
		if (Key.isDown(Key.RIGHT)) {
			rightv += 1;
			pressed = 1;
			rot = 90;
		} else if (Key.isDown(Key.LEFT)) {
			leftv += 1;
			pressed = 1;
			rot = 270;
		}
		if (Key.isDown(Key.DOWN)) {
			downv += 1;
			pressed = 1;
			rot = 180;
		} else if (Key.isDown(Key.UP)) {
			upv += 1;
			pressed = 1;
			rot = 0;
		}
		if (leftv>0) {
			leftv -= sl;
		}
		if (rightv>0) {
			rightv -= sl;
		}
		if (upv>0) {
			upv -= sl;
		}
		if (downv>0) {
			downv -= sl;
		}
		// display frog
		x += rightv;
		x -= leftv;
		y += downv;
		y -= upv;
		if (x<(thefrog._width/2)) {
			x = thefrog._width/2;
			rightv = leftv*.5;
			leftv = 0;
		} else if (x>500-(thefrog._width/2)) {
			x = 500-thefrog._width/2;
			leftv = rightv*.5;
			rightv = 0;
		}
		if (y<(thefrog._width/2)) {
			y = thefrog._width/2;
			downv = upv*.5;
			upv = 0;
		} else if (y>500-(thefrog._width/2)) {
			y = 500-thefrog._width/2;
			upv = downv*.5;
			downv = 0;
		} else {
			aa = leftv+upv+rightv+downv;
		}
		// test if the frog is within distance of the bugs
		// go through all active bugs and test if the player is close to them
		n = bugArray.length
		tempPoint1 = new Point(x, y)
		
		while (n--) {
			_b = bugArray[n]
				_b.manageBug()
			if (_b.isDead) {
				removeMovieClip(_b)
				bugArray.slice(n,1)
			}else{
			if (!_b.getIsDead()) {
				
			
		
			tempPoint2 = new Point(_b._x, _b._y)
				//trace(tempPoint2)
			dist = _trigRef.findDistance(tempPoint1, tempPoint2)
		
			if (dist < 50) {
				_b.collected()
				bugsleft--
			}
			}
			}
		}
		if (bugsleft < 1) {
			bugsleft = 0
		action =	"level complete"
		gameon = false
		}
		
		rotatefrog();
		thefrog._x = x;
		thefrog._y = y;
		frogshad._y = y+20;
		frogshad._x = x+20;
		bubbletrail();
	} else if (!gameon) {
		switch(action) {
			case "level complete":
				clearbugs();
				wait = 70;
				waitcount = 0;
				_t = attachMovie("levelcomplete", "levelcomplete", 309);
				_t._x = 250;
				_t._y = 250;
				action = "level congrats wait";
			break
			case "level congrats wait":
			waitcount++;
			if (waitcount>wait) {
				levelcomplete.play();
				action = "start";
			}
			break
			case "start":
			timedmax = 0;
			tc = 0;
			tc2 = 0;
			action = "new level"
			break
			case 'new level':
			newlevel();
			break
			case "levelstartwait":
			waitcount++;
			if (waitcount>wait) {
				levelintro.play();
				action = "begin level";
			}
			break
			case 'begin level':
			frogrot = 0;
			rotit = 0;
			gameon = true;
			break
			case "gameover":
			clearbugs();
			wait = 70;
			waitcount = 0;
			_t = attachMovie("gameover", "gameover", 309);
			_t._x = 250;
			_t._y = 250;
			action = "gameover wait";
			break
			case "gameover wait":
			waitcount++;
			if (waitcount>wait) {
				removeMovieClip("thefrog");
				action = "gameover!!";
				gameover.play();
				delete onEnterFrame
				gotoAndPlay("INTRO", 1);
			}
			break
			
		}
		
	}
}
bugArray =  new Array()
function createbug() {
	count++;
	if (count>spawncount) {
		bugx = where[bugs];
		bugy = where[(bugs+1)];
		count = 0;
		var _b:MovieClip = 	attachMovie("bug1", "bug" + buglayer, buglayer);
		bugArray.push(_b)
		bugappears.start();
	
			_b.clip.life = lifeamount;
			//_b.clip.flap = random(40)+15;
			_b._x = bugx;
			_b._y = bugy;
			_b._rotation = random(360);
		
		buglayer++;
		if (buglayer>298) {
			buglayer = 200;
		}
		bugs += 2;
		if (bugs>where.length) {
			bugs = 0;
		}
	}
}


