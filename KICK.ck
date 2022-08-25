public class KICK
{
    SndBuf kickbuf => JCRev vrb => dac;
    
    "Audio/kick.wav" => string sample;
    me.dir() + sample => kickbuf.read;


    //default settings
    0.2 => kickbuf.gain;
    //i want to add commands to change gain and mix per beat
    0 => vrb.mix;

    //
    0 => int kick_1_1;
    0 => int kick_1_2;
    0 => int kick_1_3;
    0 => int kick_1_4;
    0 => int kick_2_1;
    0 => int kick_2_2;
    0 => int kick_2_3;
    0 => int kick_2_4;
    0 => int kick_3_1;
    0 => int kick_3_2;
    0 => int kick_3_3;
    0 => int kick_3_4;
    0 => int kick_4_1;
    0 => int kick_4_2;
    0 => int kick_4_3;
    0 => int kick_4_4;


    fun void play()
    {
        Math.random2f(0.2,0.5) => kickbuf.gain;
        0 => kickbuf.pos;
        //<<<"High-Hat">>>;
    }
    

    //probability (beat_specification, 0-100)
    public void kickProb(string BeatId, int probability)
    { 
        if (BeatId == "1-1")
        {
            probability => kick_1_1;
        }
        if (BeatId == "1-2")
        {
            probability => kick_1_2;
        }
        if (BeatId == "1-3")
        {
            probability => kick_1_3;
        }
        if (BeatId == "1-4")
        {
            probability => kick_1_4;
        }
        if (BeatId == "2-1")
        {
            probability => kick_2_1;
        }
        if (BeatId == "2-2")
        {
            probability => kick_2_2;
        }
        if (BeatId == "2-3")
        {
            probability => kick_2_3;
        }
        if (BeatId == "2-4")
        {
            probability => kick_2_4;
        }
         if (BeatId == "3-1")
        {
            probability => kick_3_1;
        }
        if (BeatId == "3-2")
        {
            probability => kick_3_2;
        }
        if (BeatId == "3-3")
        {
            probability => kick_3_3;
        }
        if (BeatId == "3-4")
        {
            probability => kick_3_4;
        }
         if (BeatId == "4-1")
        {
            probability => kick_4_1;
        }
        if (BeatId == "4-2")
        {
            probability => kick_4_2;
        }
        if (BeatId == "4-3")
        {
            probability => kick_4_3;
        }
        if (BeatId == "4-4")
        {
            probability => kick_4_4;
        }
    }

}