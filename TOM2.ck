public class TOM2
{
    SndBuf tom2buf => JCRev vrb => dac;
    
    "Audio/tom2.wav" => string sample;
    me.dir() + sample => tom2buf.read;


    //default settings
    0.2 => tom2buf.gain;
    //i want to add commands to change gain and mix per beat
    0 => vrb.mix;

    //
    0 => int tom2_1_1;
    0 => int tom2_1_2;
    0 => int tom2_1_3;
    0 => int tom2_1_4;
    0 => int tom2_2_1;
    0 => int tom2_2_2;
    0 => int tom2_2_3;
    0 => int tom2_2_4;
    0 => int tom2_3_1;
    0 => int tom2_3_2;
    0 => int tom2_3_3;
    0 => int tom2_3_4;
    0 => int tom2_4_1;
    0 => int tom2_4_2;
    0 => int tom2_4_3;
    0 => int tom2_4_4;


    fun void play()
    {
        Math.random2f(0.05,0.35) => tom2buf.gain;
        0 => tom2buf.pos;
        //<<<"High-Hat">>>;
    }
    

    //probability (beat_specification, 0-100)
    public void tom2Prob(string BeatId, int probability)
    { 
        if (BeatId == "1-1")
        {
            probability => tom2_1_1;
        }
        if (BeatId == "1-2")
        {
            probability => tom2_1_2;
        }
        if (BeatId == "1-3")
        {
            probability => tom2_1_3;
        }
        if (BeatId == "1-4")
        {
            probability => tom2_1_4;
        }
        if (BeatId == "2-1")
        {
            probability => tom2_2_1;
        }
        if (BeatId == "2-2")
        {
            probability => tom2_2_2;
        }
        if (BeatId == "2-3")
        {
            probability => tom2_2_3;
        }
        if (BeatId == "2-4")
        {
            probability => tom2_2_4;
        }
         if (BeatId == "3-1")
        {
            probability => tom2_3_1;
        }
        if (BeatId == "3-2")
        {
            probability => tom2_3_2;
        }
        if (BeatId == "3-3")
        {
            probability => tom2_3_3;
        }
        if (BeatId == "3-4")
        {
            probability => tom2_3_4;
        }
         if (BeatId == "4-1")
        {
            probability => tom2_4_1;
        }
        if (BeatId == "4-2")
        {
            probability => tom2_4_2;
        }
        if (BeatId == "4-3")
        {
            probability => tom2_4_3;
        }
        if (BeatId == "4-4")
        {
            probability => tom2_4_4;
        }
    }

}