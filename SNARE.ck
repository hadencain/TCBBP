public class SNARE
{
    SndBuf snarebuf => JCRev vrb => dac;
    
    "Audio/snare.wav" => string sample;
    me.dir() + sample => snarebuf.read;

    //default settings
    0.2 => snarebuf.gain;
    //i want to add commands to change gain and mix per beat
    0 => vrb.mix;

    //
    0 => int snare_1_1;
    0 => int snare_1_2;
    0 => int snare_1_3;
    0 => int snare_1_4;
    0 => int snare_2_1;
    0 => int snare_2_2;
    0 => int snare_2_3;
    0 => int snare_2_4;
    0 => int snare_3_1;
    0 => int snare_3_2;
    0 => int snare_3_3;
    0 => int snare_3_4;
    0 => int snare_4_1;
    0 => int snare_4_2;
    0 => int snare_4_3;
    0 => int snare_4_4;


    fun void play()
    {
        Math.random2f(0.05,0.4) => snarebuf.gain;
        0 => snarebuf.pos;
        //<<<"High-Hat">>>;
    }
    

    //probability (beat_specification, 0-100)
    public void snareProb(string BeatId, int probability)
    { 
        if (BeatId == "1-1")
        {
            probability => snare_1_1;
        }
        if (BeatId == "1-2")
        {
            probability => snare_1_2;
        }
        if (BeatId == "1-3")
        {
            probability => snare_1_3;
        }
        if (BeatId == "1-4")
        {
            probability => snare_1_4;
        }
        if (BeatId == "2-1")
        {
            probability => snare_2_1;
        }
        if (BeatId == "2-2")
        {
            probability => snare_2_2;
        }
        if (BeatId == "2-3")
        {
            probability => snare_2_3;
        }
        if (BeatId == "2-4")
        {
            probability => snare_2_4;
        }
         if (BeatId == "3-1")
        {
            probability => snare_3_1;
        }
        if (BeatId == "3-2")
        {
            probability => snare_3_2;
        }
        if (BeatId == "3-3")
        {
            probability => snare_3_3;
        }
        if (BeatId == "3-4")
        {
            probability => snare_3_4;
        }
         if (BeatId == "4-1")
        {
            probability => snare_4_1;
        }
        if (BeatId == "4-2")
        {
            probability => snare_4_2;
        }
        if (BeatId == "4-3")
        {
            probability => snare_4_3;
        }
        if (BeatId == "4-4")
        {
            probability => snare_4_4;
        }
    }

}