package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
//import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
//import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
//import flixel.addons.effects.chainable.FlxEffectSprite;
//import flixel.addons.effects.chainable.FlxWaveEffect;
//import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import WiggleEffect.WiggleEffectType;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];
	var wigglegaming:WiggleEffect = new WiggleEffect();
	var tweengaming:FlxTween;

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'food':
				FlxG.sound.playMusic(Paths.music('Hungry'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'loiter':
				FlxG.sound.playMusic(Paths.music('Hungry'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'problematic':
				FlxG.sound.playMusic(Paths.music('Problematic'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFFFFFFF);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		bgFade.screenCenter();
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'food' | 'loiter':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-blue');
				box.animation.addByPrefix('normalOpen', 'Feo Textbox spawn instance', 24, false);
				box.animation.addByIndices('normal', 'Feo Textbox spawn instance', [11], "", 24);

			case 'problematic':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-hell');
				box.animation.addByPrefix('normalOpen', 'HELL Textbox spawn instance', 15, false);
				box.animation.addByIndices('normal', 'HELL Textbox spawn instance', [11], "", 15);
				wigglegaming.effectType = WiggleEffectType.HEAT_WAVE_HORIZONTAL;
		    	wigglegaming.waveAmplitude = 0.01;
		    	wigglegaming.waveFrequency = 30;
		    	wigglegaming.waveSpeed = 0.0001;
				box.shader = wigglegaming.shader;
				tweengaming = FlxTween.circularMotion(box, box.x, box.y, 10, 10, true, 3, true, {type: LOOPING});
			case 'fallen' | 'suffocating' | 'wish':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-blue');
				box.animation.addByPrefix('normalOpen', 'Feo Textbox spawn instance', 24, false);
				box.animation.addByIndices('normal', 'Feo Textbox spawn instance', [11], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		// left portrait loading code thing

		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				portraitLeft = new FlxSprite(0, 120);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/fheoPortrait2.0');
				portraitLeft.animation.addByPrefix('enter', 'catPortait', 60, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.9));
				portraitLeft.antialiasing = true;
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

			case 'loiter':
				portraitLeft = new FlxSprite(0, 150);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/catAngeryPortrait');
				portraitLeft.animation.addByPrefix('enter', 'catMAD', 60, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.9));
				portraitLeft.antialiasing = true;
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

			case 'problematic':
				portraitLeft = new FlxSprite(0, 160);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/catAkumaPortrait');
				portraitLeft.animation.addByPrefix('enter', 'catDemonPortrait', 60, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.8));
				portraitLeft.antialiasing = true;
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;
			case 'fallen' | 'suffocating' | 'wish':
				portraitLeft = new FlxSprite(10, 160);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/deadPortrait');
				portraitLeft.animation.addByPrefix('enter', 'deadPortrait', 60, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.8));
				portraitLeft.antialiasing = true;
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;


		}

		// right portrait loading code thing

		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				portraitRight = new FlxSprite(720, 170);
				portraitRight.frames = Paths.getSparrowAtlas('weeb/boyfriendPortrait2.0');
				portraitRight.animation.addByPrefix('enter', 'BF piss moment', 60, false);
				portraitRight.antialiasing = true;
				portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;

			case 'problematic':
				portraitRight = new FlxSprite(720, 190);
				portraitRight.frames = Paths.getSparrowAtlas('weeb/boyfriendScaredPortrait');
				portraitRight.animation.addByPrefix('enter', 'bfPortraitScared', 60, false);
				portraitRight.antialiasing = true;
				portraitRight.setGraphicSize(Std.int(portraitRight.width * 1));
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;
		}

		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		/*handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);*/


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{

		wigglegaming.update(333.333333333333);

		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'food')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'fallen')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'suffocating')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'wish')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'food')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'loiter')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (PlayState.SONG.song.toLowerCase() == 'problematic')
		{
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				//box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			//FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
