
local xx = 520;
local yy = 450;
local xx2 = 820;
local yy2 = 450;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	getProperty('dad.y')
end

function onUpdate(elapsed)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(bpm/20)

    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + 1000*math.sin((currentBeat+1*0.25)*math.pi), 3)
    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + 1000*math.sin((currentBeat+2*0.25)*math.pi), 3)
    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + 1000*math.sin((currentBeat+3*0.25)*math.pi), 3)
    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + 1000*math.sin((currentBeat+4*0.25)*math.pi), 3)

    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 1000*math.sin((currentBeat+1*0.25)*math.pi), 3)
    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 1000*math.sin((currentBeat+2*0.25)*math.pi), 3)
    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 1000*math.sin((currentBeat+3*0.25)*math.pi), 3)
    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 1000*math.sin((currentBeat+4*0.25)*math.pi), 3)
end

function onSectionHit()
    triggerEvent('Note Spin')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake(game, 0.015, 0.2)
    characterPlayAnim('gf', 'scared', true)
    characterPlayAnim('boyfriend', 'scared', true)
end