public class HH
{
    SndBuf hhbuf => JCRev vrb => dac;
    
    "Audio/hat.wav" => string sample;
    me.dir() + sample => hhbuf.read;


    //default settings
    0.2 => hhbuf.gain;
    //i want to add commands to change gain and mix per beat
    0 => vrb.mix;

    //
    0 => int hh_1_1;
    0 => int hh_1_2;
    0 => int hh_1_3;
    0 => int hh_1_4;
    0 => int hh_2_1;
    0 => int hh_2_2;
    0 => int hh_2_3;
    0 => int hh_2_4;
    0 => int hh_3_1;
    0 => int hh_3_2;
    0 => int hh_3_3;
    0 => int hh_3_4;
    0 => int hh_4_1;
    0 => int hh_4_2;
    0 => int hh_4_3;
    0 => int hh_4_4;


    fun void play()
    {
        Math.random2f(0.05,0.4) => hhbuf.gain;
        0 => hhbuf.pos;
        //<<<"High-Hat">>>;
    }
    

    //probability (beat_specification, 0-100)
    public void hhProb(string BeatId, int probability)
    { 
        if (BeatId == "1-1")
        {
            probability => hh_1_1;
        }
        if (BeatId == "1-2")
        {
            probability => hh_1_2;
        }
        if (BeatId == "1-3")
        {
            probability => hh_1_3;
        }
        if (BeatId == "1-4")
        {
            probability => hh_1_4;
        }
        if (BeatId == "2-1")
        {
            probability => hh_2_1;
        }
        if (BeatId == "2-2")
        {
            probability => hh_2_2;
        }
        if (BeatId == "2-3")
        {
            probability => hh_2_3;
        }
        if (BeatId == "2-4")
        {
            probability => hh_2_4;
        }
         if (BeatId == "3-1")
        {
            probability => hh_3_1;
        }
        if (BeatId == "3-2")
        {
            probability => hh_3_2;
        }
        if (BeatId == "3-3")
        {
            probability => hh_3_3;
        }
        if (BeatId == "3-4")
        {
            probability => hh_3_4;
        }
         if (BeatId == "4-1")
        {
            probability => hh_4_1;
        }
        if (BeatId == "4-2")
        {
            probability => hh_4_2;
        }
        if (BeatId == "4-3")
        {
            probability => hh_4_3;
        }
        if (BeatId == "4-4")
        {
            probability => hh_4_4;
        }
    }

}