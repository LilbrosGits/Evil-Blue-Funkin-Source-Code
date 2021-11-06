local allowCountdown = false
function onCreate()
	-- background shit
	makeLuaSprite('stageback', '', -500, -300);
	setLuaSpriteScrollFactor('', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'evil_blue_temple', -1300, -1800);
	setLuaSpriteScrollFactor('evil_blue_temple', 0.9, 0.9);
	scaleObject('stagefront', 1.4, 1.4);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('', '', -125, -100);
		setLuaSpriteScrollFactor('', 0.9, 0.9);
		scaleObject('', 1.1, 1.1);
		
		makeLuaSprite('', '', 1225, -100);
		setLuaSpriteScrollFactor('', 0.9, 0.9);
		scaleObject('', 1.1, 1.1);
		setPropertyLuaSprite('', 'flipX', true); --mirror sprite horizontally

		makeLuaSprite('', '', -500, -300);
		setLuaSpriteScrollFactor('', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('cut2');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end