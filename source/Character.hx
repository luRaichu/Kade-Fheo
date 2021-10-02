package;

import flixel.FlxG;
import flixel.FlxSprite;
//import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public var bfSheet:String = 'BOYFRIEND';
	public var bfDeadSheet:String = 'BF_DEAD';

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		if (FlxG.save.data.esrb == true)
		{
			bfSheet = 'BOYFRIEND_E';
			bfDeadSheet = 'BF_DEAD_CLEAN';
		}

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-held':

				tex = Paths.getSparrowAtlas('GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByPrefix('sad', 'GF Dancing Beat MAJIK', 24, false);
				animation.addByPrefix('danceLeft', 'GF Dancing Beat MAJIK', 24, false);
				animation.addByPrefix('danceRight', 'GF Dancing Beat MAJIK', 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', 0, -9);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'fheo':
				// FHEO ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fheo_assets');
				frames = tex;
				animation.addByPrefix('idle', 'catIDLEB', 24);
				animation.addByPrefix('singUP', 'catUPhold', 24);
				animation.addByPrefix('singRIGHT', 'catRIGHTB', 24);
				animation.addByPrefix('singDOWN', 'catDOWNB', 24);
				animation.addByPrefix('singLEFT', 'catLEFTB', 24);

				animation.addByPrefix('singUP-alt', 'catTHROW', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'catRIGHTB', 24);
				animation.addByPrefix('singDOWN-alt', 'catDOWNB', 24);
				animation.addByPrefix('singLEFT-alt', 'catLEFTB', 24);

				addOffset('idle', 5, 0);
				addOffset("singUP", 0, -77);
				addOffset("singRIGHT", -8, -27);
				addOffset("singLEFT", 16, 20);
				addOffset("singDOWN", 6, -10);

				addOffset("singRIGHT-alt", -8, -27);
				addOffset("singLEFT-alt", 16, 20);
				addOffset("singDOWN-alt", 6, -10);
				addOffset("singUP-alt", 28, 128);

				playAnim('idle');
				playAnim('singUP-alt');

			case 'fheo-angry':
				// FHEO MAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fheo_anger_assets');
				frames = tex;
				animation.addByPrefix('idle', 'Fheo2IDLE', 24);
				animation.addByPrefix('singUP', 'Fheo2UP', 24);
				animation.addByPrefix('singRIGHT', 'Fheo2RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Fheo2DOWN', 24);
				animation.addByPrefix('singLEFT', 'Fheo2LEFT', 24);

				animation.addByPrefix('singUP-alt', 'Fheo2THROW', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Fheo2RIGHT', 24);
				animation.addByPrefix('singDOWN-alt', 'Fheo2DOWN', 24);
				animation.addByPrefix('singLEFT-alt', 'Fheo2LEFT', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", 3, -64);
				addOffset("singRIGHT", -19, 0);
				addOffset("singLEFT", 59, 6);
				addOffset("singDOWN", -12, -1);

				addOffset("singRIGHT-alt", -19, 0);
				addOffset("singLEFT-alt", 59, 6);
				addOffset("singDOWN-alt", -12, -1);
				addOffset('singUP-alt', 39, 132);

				playAnim('idle');

			case 'fheo-demon':
				// FHEO MAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('fheo_demon_assets');
				frames = tex;

				animation.addByPrefix('idle', 'demons idle', 24);
				animation.addByPrefix('singUP', 'demons up', 24);
				animation.addByPrefix('singRIGHT', 'demons right', 24); 
				animation.addByPrefix('singDOWN', 'demons down', 24);
				animation.addByPrefix('singLEFT', 'demons left', 24);
				animation.addByPrefix('singRIGHT-alt', 'demons screech', 60);
				animation.addByPrefix('singDOWN-alt', 'demons down', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", -13, 0);
				addOffset("singRIGHT", -54, -15);
				addOffset("singLEFT", 21, 9);
				addOffset("singDOWN", -39, -41);
				addOffset("singDOWN-alt", -39, -41);
				addOffset("singRIGHT-alt", 59, 0);

				playAnim('idle');

			case 'fheo-dead':
				// *coffin dance*
				tex = Paths.getSparrowAtlas('dead_fheo');
				frames = tex;

				animation.addByPrefix('idle', 'cat idle', 24);
				animation.addByPrefix('singUP', 'cat up', 24);
				animation.addByPrefix('singRIGHT', 'cat right', 24); 
				animation.addByPrefix('singDOWN', 'cat down', 24);
				animation.addByPrefix('singLEFT', 'cat left', 24);
				animation.addByPrefix('myc', 'myc', 24);

				addOffset('idle', 0, 0);
				addOffset('myc', 0, 0);
				addOffset("singUP", 0, 41);
				addOffset("singRIGHT", -3, 60);
				addOffset("singLEFT", -23, -47);
				addOffset("singDOWN", -7, -9);

				playAnim('idle');

			case 'bf':
				var tex = Paths.getSparrowAtlas(bfSheet);
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				animation.addByPrefix('attack', 'boyfriend mic attack', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				if (FlxG.save.data.esrb = false)
				{
					addOffset('attack', 1017, 270);
				}
				else
				{
					addOffset('attack', 738, 270);
				}
				playAnim('idle');

				flipX = true;
			case 'bf-dead':
				var tex = Paths.getSparrowAtlas(bfDeadSheet);
				frames = tex;

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('idle', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);

				flipX = true;
			case 'bf-robot': 
				var tex = Paths.getSparrowAtlas('QUOTE');
				frames = tex;
				animation.addByPrefix('idle', 'QUOTE idle dance', 24, false);
				animation.addByPrefix('singUP', 'QUOTE NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'QUOTE NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'QUOTE NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'QUOTE NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'QUOTE NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'QUOTE NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'QUOTE NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'QUOTE NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'QUOTE HEY', 24, false);

				animation.addByPrefix('firstDeath', "QUOTE dies", 24, false);
				animation.addByPrefix('deathLoop', "QUOTE Dead Loop", 15, true);
				animation.addByPrefix('deathConfirm', "QUOTE Dead confirm", 24, false);

				animation.addByPrefix('scared', 'QUOTE idle shaking', 24);

				addOffset('idle', -5, 1);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", 21, -61);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -22, 19);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 6);
				addOffset('deathConfirm', 23, 78);
				addOffset('scared', 3, -7);

				playAnim('idle');

				flipX = true;

			case 'bf-scare':

				frames = Paths.getSparrowAtlas(bfSheet);
				
				animation.addByPrefix('idle', 'BF idle shaking', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 60, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 60, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 60, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 60, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 60, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 60, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 60, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 60, false);
				animation.addByPrefix('hey', 'BF HEY', 60, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-held':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
