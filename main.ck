//intiialize text area
ConsoleInput in;
StringTokenizer tok;

//instrument classes initialization
KICK k;
SNARE s;
HH hh;
TOM1 t1;
TOM2 t2;
PERC1 p1;
PERC2 p2;

//Global variable initialization 
500::ms => dur beat;

//start text area
spork ~ messageListen();

fun void help()
{
     <<<"PROBABILITY-BASED SEQUENCER">>>;
     <<<"\n\n instrument IDs: ">>>;
     <<<"k - Kick">>>;
     <<<"s - snare">>>;
     <<<"hh - high-hat">>>;
     <<<"t1 - tom 1">>>;
     <<<"t2 - tom 2">>>;
     <<<"p1 - perc 1">>>;
     <<<"p2 - perc 2">>>;
     <<<"\n\n subdivision IDs: ">>>; 
     <<<"      : num,  ee, and, uh ">>>;
     <<<"beat 1: 1-1, 1-2, 1-3, 1-4">>>;
     <<<"beat 1: 2-1, 2-2, 2-3, 2-4">>>;
     <<<"beat 1: 3-1, 3-2, 3-3, 3-4">>>;
     <<<"beat 1: 4-1, 4-2, 4-3, 4-4">>>;
     <<<"\n\n probability range:">>>;
     <<<"(0 - 100)">>>;
     <<<"\n\n Preset Usage: ">>>;
     <<<"'preset#' where # = 1-5">>>;
     <<<"\n\n clear">>>;
     <<<"clears entire sequence">>>;
     <<<"\n\ntempo: positive #">>>;
     <<<"\n\n">>>;
     <<<"'enter command': INST NAME (space) SUBDIVISION (space) PROBABILITY">>>;
     <<<"'enter command': k #-# # (example input)">>>;
}
//---------------------------------Control Functions----------------------------------
//read user input. Identify then send to 'commandRouter'
fun void messageListen()
{
    //endlessloop
    while (true)
    {
        in.prompt("enter command:") => now;
        while (in.more())
        {//parser
            tok.set(in.getLine());
            tok.next() => string inst;
            tok.next() => string BeatId;
            tok.next() => string probability_input;
            commandRouter(inst, BeatId, probability_input);
        }
    }
}

fun dur commandRouter(string instIn, string Id, string probability_input)
{
    instIn => string inst;

    Std.atoi(probability_input) => int probability;

    if (inst == "k")
    {
        k.kickProb(Id, probability);
    }
    else if (inst == "s")
    {
        s.snareProb(Id, probability);
    }
    else if (inst == "hh")
    {
        hh.hhProb(Id, probability);
    }
    else if (inst == "t1")
    {
        t1.tom1Prob(Id, probability);
    }
    else if (inst == "t2")
    {
        t2.tom2Prob(Id, probability);
    }
    else if (inst == "p1")
    {
        p1.perc1Prob(Id, probability);
    }
    else if (inst == "p2")
    {
        p2.perc2Prob(Id, probability);
    }else if (inst == "tempo")
    {
        Std.atoi(Id) => int temp;
        (60000/temp)::ms => dur Newtempo;
        Newtempo => beat;
    }
    else if (inst == "help")
    {
        help();
    }
    else if (inst == "preset1")
    {
        k.kickProb("1-1", 100);
        k.kickProb("2-1", 100);
        k.kickProb("3-1", 100);
        k.kickProb("4-1", 100);
        s.snareProb("2-1", 100);
        s.snareProb("4-1", 100);
    }   
    else if (inst == "preset2")
    {
        k.kickProb("1-1", 50);
        k.kickProb("1-2", 50);
        k.kickProb("3-1", 50);
        k.kickProb("4-4", 50);
        s.snareProb("1-3", 50);
        s.snareProb("4-1", 50);
        t1.tom1Prob("2-3", 50);
        t2.tom2Prob("4-4", 50);
        hh.hhProb("1-4", 50);
        hh.hhProb("4-3", 50);
        hh.hhProb("4-2", 50);
    }
    else if (inst == "preset3")
    {
        k.kickProb("1-1", 50);
        k.kickProb("1-3", 50);
        k.kickProb("3-1", 50);
        k.kickProb("3-3", 50);
        k.kickProb("4-4", 50);
        s.snareProb("2-1", 50);
        s.snareProb("4-1", 50);
        hh.hhProb("1-4", 50);
        hh.hhProb("2-3", 50);
        hh.hhProb("3-4", 50);
        hh.hhProb("4-2", 50);
    }
    else if (inst == "preset4")
    {
        p2.perc2Prob("1-1", 30);
        p2.perc2Prob("1-2", 30);
        p2.perc2Prob("1-3", 30);
        k.kickProb("1-3", 25);
        s.snareProb("1-4", 50);

        p2.perc2Prob("2-1", 30);
        p2.perc2Prob("2-2", 30);
        p2.perc2Prob("2-3", 30);
        t1.tom1Prob("2-1", 30);
        t1.tom1Prob("2-2", 30);
        t2.tom2Prob("2-3", 30);
        k.kickProb("2-3", 25);
        s.snareProb("2-4", 50);

        p2.perc2Prob("3-1", 30);
        t1.tom1Prob("3-1", 30);
        t1.tom1Prob("3-2", 30);
        t2.tom2Prob("3-3", 30);
        p2.perc2Prob("3-2", 30);
        p2.perc2Prob("3-3", 30);
        k.kickProb("3-3", 25);
        s.snareProb("3-4", 50);

        p1.perc1Prob("4-1", 30);
        k.kickProb("4-1", 10);
        p1.perc1Prob("4-2", 30);
        p1.perc1Prob("4-3", 30);
        k.kickProb("4-3", 25);
        s.snareProb("4-4", 50);
    }
    else if (inst == "preset5")
    {
        k.kickProb("1-1", 40);
        k.kickProb("1-3", 40);
        k.kickProb("2-1", 40);
        k.kickProb("2-3", 40);
        k.kickProb("3-1", 40);
        k.kickProb("3-3", 40);
        k.kickProb("4-1", 40);
        k.kickProb("4-3", 40);
        k.kickProb("4-4", 40);
        s.snareProb("2-1", 40);
        s.snareProb("3-1", 40);
        s.snareProb("3-2", 40);
        s.snareProb("4-1", 40);
        s.snareProb("4-1", 40);
        hh.hhProb("1-4", 40);
        hh.hhProb("2-3", 40);
        hh.hhProb("3-4", 40);
        hh.hhProb("4-2", 40);
        t1.tom1Prob("2-4", 40);
        t1.tom1Prob("4-3", 40);
        t2.tom2Prob("1-2", 40);
        t2.tom2Prob("3-3", 40);
        p2.perc2Prob("3-3", 40);
        p2.perc2Prob("3-3", 40);
        p1.perc1Prob("1-3", 40);
        p1.perc1Prob("3-2", 40);
    }
    else if (inst == "4floor")
    {
        k.kickProb("1-1", 100);
        k.kickProb("2-1", 100);
        k.kickProb("3-1", 100);
        k.kickProb("4-1", 100);
    } 
    else if (inst == "2+4snare")
    {
        s.snareProb("1-1", 100);
        s.snareProb("3-1", 100);
    }
    else if (inst == "clear")
    {
        k.kickProb("1-1", 0);k.kickProb("1-2", 0);k.kickProb("1-3", 0);k.kickProb("1-4", 0);
        k.kickProb("2-1", 0);k.kickProb("2-2", 0);k.kickProb("2-3", 0);k.kickProb("2-4", 0);
        k.kickProb("3-1", 0);k.kickProb("3-2", 0);k.kickProb("3-3", 0);k.kickProb("3-4", 0);
        k.kickProb("4-1", 0);k.kickProb("4-2", 0);k.kickProb("4-3", 0);k.kickProb("4-4", 0);

        s.snareProb("1-1", 0);s.snareProb("1-2", 0);s.snareProb("1-3", 0);s.snareProb("1-4", 0);
        s.snareProb("2-1", 0);s.snareProb("2-2", 0);s.snareProb("2-3", 0);s.snareProb("2-4", 0);
        s.snareProb("3-1", 0);s.snareProb("3-2", 0);s.snareProb("3-3", 0);s.snareProb("3-4", 0);
        s.snareProb("4-1", 0);s.snareProb("4-2", 0);s.snareProb("4-3", 0);s.snareProb("4-4", 0);

        hh.hhProb("1-1", 0);hh.hhProb("1-2", 0);hh.hhProb("1-3", 0);hh.hhProb("1-4", 0);
        hh.hhProb("2-1", 0);hh.hhProb("2-2", 0);hh.hhProb("2-3", 0);hh.hhProb("2-4", 0);
        hh.hhProb("3-1", 0);hh.hhProb("3-2", 0);hh.hhProb("3-3", 0);hh.hhProb("3-4", 0);
        hh.hhProb("4-1", 0);hh.hhProb("4-2", 0);hh.hhProb("4-3", 0);hh.hhProb("4-4", 0);
        
        p1.perc1Prob("1-1", 0);p1.perc1Prob("1-2", 0);p1.perc1Prob("1-3", 0);p1.perc1Prob("1-4", 0);
        p1.perc1Prob("2-1", 0);p1.perc1Prob("2-2", 0);p1.perc1Prob("2-3", 0);p1.perc1Prob("2-4", 0);
        p1.perc1Prob("3-1", 0);p1.perc1Prob("3-2", 0);p1.perc1Prob("3-3", 0);p1.perc1Prob("3-4", 0);
        p1.perc1Prob("4-1", 0);p1.perc1Prob("4-2", 0);p1.perc1Prob("4-3", 0);p1.perc1Prob("4-4", 0);
        
        p2.perc2Prob("1-1", 0);p2.perc2Prob("1-2", 0);p2.perc2Prob("1-3", 0);p2.perc2Prob("1-4", 0);
        p2.perc2Prob("2-1", 0);p2.perc2Prob("2-2", 0);p2.perc2Prob("2-3", 0);p2.perc2Prob("2-4", 0);
        p2.perc2Prob("3-1", 0);p2.perc2Prob("3-2", 0);p2.perc2Prob("3-3", 0);p2.perc2Prob("3-4", 0);
        p2.perc2Prob("4-1", 0);p2.perc2Prob("4-2", 0);p2.perc2Prob("4-3", 0);p2.perc2Prob("4-4", 0);
        
        t1.tom1Prob("1-1", 0);t1.tom1Prob("1-2", 0);t1.tom1Prob("1-3", 0);t1.tom1Prob("1-4", 0);
        t1.tom1Prob("2-1", 0);t1.tom1Prob("2-2", 0);t1.tom1Prob("2-3", 0);t1.tom1Prob("2-4", 0);
        t1.tom1Prob("3-1", 0);t1.tom1Prob("3-2", 0);t1.tom1Prob("3-3", 0);t1.tom1Prob("3-4", 0);
        t1.tom1Prob("4-1", 0);t1.tom1Prob("4-2", 0);t1.tom1Prob("4-3", 0);t1.tom1Prob("4-4", 0);
        
        t2.tom2Prob("1-1", 0);t2.tom2Prob("1-2", 0);t2.tom2Prob("1-3", 0);t2.tom2Prob("1-4", 0);
        t2.tom2Prob("2-1", 0);t2.tom2Prob("2-2", 0);t2.tom2Prob("2-3", 0);t2.tom2Prob("2-4", 0);
        t2.tom2Prob("3-1", 0);t2.tom2Prob("3-2", 0);t2.tom2Prob("3-3", 0);t2.tom2Prob("3-4", 0);
        t2.tom2Prob("4-1", 0);t2.tom2Prob("4-2", 0);t2.tom2Prob("4-3", 0);t2.tom2Prob("4-4", 0);
    }
}

//----------------------------Probability and Main Loop Functions--------------------------
fun int getProbValue()
{
    Math.random2(1,100) => int R;
    return R;
}

fun void main_loop()
{
    while (true)
    {
        //beat 1
        for (0 => int i; i < 1; i++)
        {
            if(getProbValue() < k.kick_1_1){spork ~ k.play();}
            if(getProbValue() < s.snare_1_1){spork ~ s.play();}
            if(getProbValue() < hh.hh_1_1){spork ~ hh.play();}
            if(getProbValue() < t1.tom1_1_1){spork ~ t1.play();}
            if(getProbValue() < t2.tom2_1_1){spork ~ t2.play();}
            if(getProbValue() < p1.perc1_1_1){spork ~ p1.play();}
            if(getProbValue() < p2.perc2_1_1){spork ~ p2.play();}
            // <<<"beat 1:1">>>;
        beat/4 => now;
            //1-ee  
            for (0 => int j; j < 1; j++)
            {
                if(getProbValue() < k.kick_1_2){spork ~ k.play();}
                if(getProbValue() < s.snare_1_2){spork ~ s.play();}
                if(getProbValue() < hh.hh_1_2){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_1_2){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_1_2){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_1_2){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_1_2){spork ~ p2.play();}
                // <<<"beat 1:2">>>;
                beat/4 => now;
            }

            //1-and
            for (0 => int m; m < 1; m++)
            {
                if(getProbValue() < k.kick_1_3){spork ~ k.play();}
                if(getProbValue() < s.snare_1_3){spork ~ s.play();}
                if(getProbValue() < hh.hh_1_3){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_1_3){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_1_3){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_1_3){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_1_3){spork ~ p2.play();}
                // <<<"beat 1:3">>>;
                beat/4 => now;
            }

            //1-uh
            for (0 => int l; l < 1; l++)
            {
                if(getProbValue() < k.kick_1_4){spork ~ k.play();}
                if(getProbValue() < s.snare_1_4){spork ~ s.play();}
                if(getProbValue() < hh.hh_1_4){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_1_4){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_1_4){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_1_4){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_1_4){spork ~ p2.play();}
                // <<<"beat 1:4">>>;
                beat/4 => now;
            }            
        }

        //beat  2
        for (0 => int i; i < 1; i++)
        {
            if(getProbValue() < k.kick_2_1){spork ~ k.play();}
            if(getProbValue() < s.snare_2_1){spork ~ s.play();}
            if(getProbValue() < hh.hh_2_1){spork ~ hh.play();}
            if(getProbValue() < t1.tom1_2_1){spork ~ t1.play();}
            if(getProbValue() < t2.tom2_2_1){spork ~ t2.play();}
            if(getProbValue() < p1.perc1_2_1){spork ~ p1.play();}
            if(getProbValue() < p2.perc2_2_1){spork ~ p2.play();}
        // <<<"beat 2:1">>>;
        beat/4 => now; 

            //2-ee  
            for (0 => int j; j < 1; j++)
            {
                if(getProbValue() < k.kick_2_2){spork ~ k.play();}
                if(getProbValue() < s.snare_2_2){spork ~ s.play();}
                if(getProbValue() < hh.hh_2_2){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_2_2){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_2_2){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_2_2){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_2_2){spork ~ p2.play();}
                // <<<"beat 2:2">>>;
                beat/4 => now;
            }

            //2-and
            for (0 => int m; m < 1; m++)
            {
                if(getProbValue() < k.kick_1_3){spork ~ k.play();}
                if(getProbValue() < s.snare_2_3){spork ~ s.play();}
                if(getProbValue() < hh.hh_2_3){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_2_3){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_2_3){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_2_3){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_2_3){spork ~ p2.play();}
                // <<<"beat 2:3">>>;
                beat/4 => now;
            }

            //2-uh
            for (0 => int l; l < 1; l++)
            {
                if(getProbValue() < k.kick_2_4){spork ~ k.play();}
                if(getProbValue() < s.snare_2_4){spork ~ s.play();}
                if(getProbValue() < hh.hh_2_4){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_2_4){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_2_4){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_2_4){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_2_4){spork ~ p2.play();}
                // <<<"beat 2:4">>>;
                beat/4 => now;
            }   

        }
        //beat 3
        for (0 => int i; i < 1; i++)
        {
            if(getProbValue() < k.kick_3_1){spork ~ k.play();}
            if(getProbValue() < s.snare_3_1){spork ~ s.play();}
            if(getProbValue() < hh.hh_3_1){spork ~ hh.play();}
            if(getProbValue() < t1.tom1_3_1){spork ~ t1.play();}
            if(getProbValue() < t2.tom2_3_1){spork ~ t2.play();}
            if(getProbValue() < p1.perc1_3_1){spork ~ p1.play();}
            if(getProbValue() < p2.perc2_3_1){spork ~ p2.play();}
        // <<<"beat 3:1">>>;
        beat/4 => now;  

            //3-ee  
            for (0 => int j; j < 1; j++)
            {
                if(getProbValue() < k.kick_3_2){spork ~ k.play();}
                if(getProbValue() < s.snare_3_2){spork ~ s.play();}
                if(getProbValue() < hh.hh_3_2){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_3_2){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_3_2){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_3_2){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_3_2){spork ~ p2.play();}
                // <<<"beat 3:2">>>;
                beat/4 => now;
            }

            //3-and
            for (0 => int m; m < 1; m++)
            {
                if(getProbValue() < k.kick_3_3){spork ~ k.play();}
                if(getProbValue() < s.snare_3_3){spork ~ s.play();}
                if(getProbValue() < hh.hh_3_3){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_3_3){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_3_3){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_3_3){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_3_3){spork ~ p2.play();}
                // <<<"beat 3:3">>>;
                beat/4 => now;
            }

            //3-uh
            for (0 => int l; l < 1; l++)
            {
                if(getProbValue() < k.kick_3_4){spork ~ k.play();}
                if(getProbValue() < s.snare_3_4){spork ~ s.play();}
                if(getProbValue() < hh.hh_3_4){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_3_4){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_3_4){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_3_4){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_3_4){spork ~ p2.play();}
                // <<<"beat 3:4">>>;
                beat/4 => now;
            }    

        }
        //beat  4
        for (0 => int i; i < 1; i++)
        {
            if(getProbValue() < k.kick_4_1){spork ~ k.play();}
            if(getProbValue() < s.snare_4_1){spork ~ s.play();}
            if(getProbValue() < hh.hh_4_1){spork ~ hh.play();}
            if(getProbValue() < t1.tom1_4_1){spork ~ t1.play();}
            if(getProbValue() < t2.tom2_4_1){spork ~ t2.play();}
            if(getProbValue() < p1.perc1_4_1){spork ~ p1.play();}
            if(getProbValue() < p2.perc2_4_1){spork ~ p2.play();}
        // <<<"beat 4:1">>>;
        beat/4 => now; 

            //4-ee  
            for (0 => int j; j < 1; j++)
            {
                if(getProbValue() < k.kick_4_2){spork ~ k.play();}
                if(getProbValue() < s.snare_4_2){spork ~ s.play();}
                if(getProbValue() < hh.hh_4_2){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_4_2){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_4_2){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_4_2){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_4_2){spork ~ p2.play();}
                // <<<"beat 4:2">>>;
                beat/4 => now;
            }

            //4-and
            for (0 => int m; m < 1; m++)
            {
                if(getProbValue() < k.kick_4_3){spork ~ k.play();}
                if(getProbValue() < s.snare_4_3){spork ~ s.play();}
                if(getProbValue() < hh.hh_4_3){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_4_3){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_4_3){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_4_3){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_4_3){spork ~ p2.play();}
                // <<<"beat 4:3">>>;
                beat/4 => now;
            }

            //4-uh
            for (0 => int l; l < 1; l++)
            {
                if(getProbValue() < k.kick_4_4){spork ~ k.play();}
                if(getProbValue() < s.snare_4_4){spork ~ s.play();}
                if(getProbValue() < hh.hh_4_4){spork ~ hh.play();}
                if(getProbValue() < t1.tom1_4_4){spork ~ t1.play();}
                if(getProbValue() < t2.tom2_4_4){spork ~ t2.play();}
                if(getProbValue() < p1.perc1_4_4){spork ~ p1.play();}
                if(getProbValue() < p2.perc2_4_4){spork ~ p2.play();}
                // <<<"beat 4:4">>>;
                beat/4 => now;
            }            
        }
    }

}

spork ~ main_loop();
1::week => now;