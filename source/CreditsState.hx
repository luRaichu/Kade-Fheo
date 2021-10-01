package;

import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
#if desktop
import Discord.DiscordClient;
#end

class CreditsState extends FlxState
{
    public var back:FlxSprite;
    public var front:FlxSprite;
    public var fheo:FlxSprite;
    public var staff:FlxText;
    public var blurring = false;
    public var moving = false;
    public var offset = 0;

	override public function create()
	{
		super.create();

        #if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Watching Credits", null);
		#end

        FlxG.sound.music.stop(); // Just to be safe
        FlxG.sound.playMusic(Paths.music('staffRoll'));

        back = new FlxSprite(0, 0);
        back.loadGraphic(Paths.image('fheo/endingPic'));
        back.antialiasing = true;
        add(back);

        front = new FlxSprite(0, 0);
        front.loadGraphic(Paths.image('fheo/blurredEndingPic'));
        front.antialiasing = true;
        front.alpha = 0;
        add(front);

        fheo = new FlxSprite(0, 0);
        fheo.loadGraphic(Paths.image('fheo/realFheoMoment'));
        fheo.antialiasing = true;
        fheo.updateHitbox();

        FlxTween.tween(back, {x: 0, y: 0, "scale.x": 2}, 3.5, {type:BACKWARD, ease:FlxEase.quadOut, onComplete:startRoll});
	}
    function startRoll(tween:FlxTween):Void
    {
        blurring = true;
        moving = true;

        staff = new FlxText(FlxG.width / 2 - 128, FlxG.height, 0,"
            Created by\n
                Dani\n
            \n
            Programmer\n
                luRaichu\n
            \n
            Artist\n
                suppyM\n
            \n
            Charters\n
                SusKitty\n
                Hacky (hackynatur)\n
            \n
            Composers\n
                LiterallyWize\n
                TooDe\n
            \n
            Cutscene Animator\n
                TT7\n
            \n
            \n
            Special Thanks:\n
                Ourselves\n
                Tyrone Rodriguez\n
                Your mom\n
                Ricardo milos\n
                Candice\n
                Gala_xyGaming\n
                AlbashDeter\n

            ...And you!\n
            \n
            \n
            \n
            Inspired by Dani's cat, Fheo
        ", 32);

        staff.borderSize = 3;
        staff.borderColor = FlxColor.BLACK;
        staff.borderStyle = OUTLINE;
        add(staff);

        fheo.x = staff.x + 192;
        add(fheo);
    }
    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        back.scale.y = back.scale.x; // im a dumpy dumb man

        if (FlxG.keys.justPressed.U)
        {
            FlxG.switchState(new StoryMenuState());
        }
        if (blurring == true)
        {
            front.alpha += 0.003;
            back.alpha -= 0.003;
        }
        if (back.alpha == 0)
        {
            blurring = false;
            remove(back);
        }
        if (moving == true)
        {
            staff.y--;
            fheo.y = staff.y + 2804;
            if (staff.y < -3020)
            {
                FlxG.camera.fade(FlxColor.BLACK, 4, false, endRoll);
                FlxG.sound.music.fadeOut(4, 0);
                moving = false;
            }
        }
    }
    function endRoll():Void
    {
        FlxG.save.data.beatGood = true;
        FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
        FlxG.switchState(new MainMenuState());
    }
}