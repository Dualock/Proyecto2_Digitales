/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "arbitro1_synth.v:1" *)
module arbitro1_synth(clk, reset_L, data_in, fifo_empty0, fifo_empty1, fifo_empty2, fifo_empty3, fifo_af0, fifo_af1, fifo_af2, fifo_af3, valid0, valid1, valid2, valid3, data_out_synth, pop0_synth, pop1_synth, pop2_synth, pop3_synth, push0_synth, push1_synth, push2_synth, push3_synth, cont0_synth, cont1_synth, cont2_synth, cont3_synth);
  (* src = "arbitro1_synth.v:20" *)
  wire [4:0] _000_;
  (* src = "arbitro1_synth.v:20" *)
  wire [4:0] _001_;
  (* src = "arbitro1_synth.v:20" *)
  wire [4:0] _002_;
  (* src = "arbitro1_synth.v:20" *)
  wire [4:0] _003_;
  (* src = "arbitro1_synth.v:20" *)
  wire [2:0] _004_;
  (* src = "arbitro1_synth.v:20" *)
  wire [2:0] _005_;
  (* src = "arbitro1_synth.v:20" *)
  wire [2:0] _006_;
  (* src = "arbitro1_synth.v:20" *)
  wire _007_;
  (* src = "arbitro1_synth.v:20" *)
  wire _008_;
  (* src = "arbitro1_synth.v:20" *)
  wire _009_;
  (* src = "arbitro1_synth.v:20" *)
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  (* src = "arbitro1_synth.v:4" *)
  input clk;
  (* src = "arbitro1_synth.v:12" *)
  output [4:0] cont0_synth;
  (* src = "arbitro1_synth.v:12" *)
  output [4:0] cont1_synth;
  (* src = "arbitro1_synth.v:12" *)
  output [4:0] cont2_synth;
  (* src = "arbitro1_synth.v:12" *)
  output [4:0] cont3_synth;
  (* src = "arbitro1_synth.v:18" *)
  wire [2:0] contp0;
  (* src = "arbitro1_synth.v:18" *)
  wire [2:0] contp1;
  (* src = "arbitro1_synth.v:18" *)
  wire [2:0] contp2;
  (* src = "arbitro1_synth.v:5" *)
  input [11:0] data_in;
  (* src = "arbitro1_synth.v:9" *)
  output [11:0] data_out_synth;
  (* src = "arbitro1_synth.v:7" *)
  input fifo_af0;
  (* src = "arbitro1_synth.v:7" *)
  input fifo_af1;
  (* src = "arbitro1_synth.v:7" *)
  input fifo_af2;
  (* src = "arbitro1_synth.v:7" *)
  input fifo_af3;
  (* src = "arbitro1_synth.v:6" *)
  input fifo_empty0;
  (* src = "arbitro1_synth.v:6" *)
  input fifo_empty1;
  (* src = "arbitro1_synth.v:6" *)
  input fifo_empty2;
  (* src = "arbitro1_synth.v:6" *)
  input fifo_empty3;
  (* src = "arbitro1_synth.v:10" *)
  output pop0_synth;
  (* src = "arbitro1_synth.v:10" *)
  output pop1_synth;
  (* src = "arbitro1_synth.v:10" *)
  output pop2_synth;
  (* src = "arbitro1_synth.v:10" *)
  output pop3_synth;
  (* src = "arbitro1_synth.v:11" *)
  output push0_synth;
  (* src = "arbitro1_synth.v:11" *)
  output push1_synth;
  (* src = "arbitro1_synth.v:11" *)
  output push2_synth;
  (* src = "arbitro1_synth.v:11" *)
  output push3_synth;
  (* src = "arbitro1_synth.v:4" *)
  input reset_L;
  (* src = "arbitro1_synth.v:8" *)
  input valid0;
  (* src = "arbitro1_synth.v:8" *)
  input valid1;
  (* src = "arbitro1_synth.v:8" *)
  input valid2;
  (* src = "arbitro1_synth.v:8" *)
  input valid3;
  NOT _239_ (
    .A(data_in[9]),
    .Y(_223_)
  );
  NOT _240_ (
    .A(reset_L),
    .Y(_224_)
  );
  NOR _241_ (
    .A(_224_),
    .B(_223_),
    .Y(_225_)
  );
  NOT _242_ (
    .A(_225_),
    .Y(_226_)
  );
  NOR _243_ (
    .A(fifo_af1),
    .B(fifo_af0),
    .Y(_227_)
  );
  NOR _244_ (
    .A(fifo_af3),
    .B(fifo_af2),
    .Y(_228_)
  );
  NAND _245_ (
    .A(_228_),
    .B(_227_),
    .Y(_229_)
  );
  NOT _246_ (
    .A(valid1),
    .Y(_230_)
  );
  NOR _247_ (
    .A(valid3),
    .B(valid2),
    .Y(_231_)
  );
  NAND _248_ (
    .A(_231_),
    .B(_230_),
    .Y(_232_)
  );
  NOR _249_ (
    .A(_232_),
    .B(valid0),
    .Y(_233_)
  );
  NOR _250_ (
    .A(_233_),
    .B(_229_),
    .Y(_234_)
  );
  NAND _251_ (
    .A(_234_),
    .B(data_in[8]),
    .Y(_235_)
  );
  NOR _252_ (
    .A(_235_),
    .B(_226_),
    .Y(push3_synth)
  );
  NOT _253_ (
    .A(data_in[8]),
    .Y(_236_)
  );
  NAND _254_ (
    .A(_234_),
    .B(_236_),
    .Y(_237_)
  );
  NOR _255_ (
    .A(_237_),
    .B(_226_),
    .Y(push2_synth)
  );
  NOR _256_ (
    .A(_224_),
    .B(data_in[9]),
    .Y(_238_)
  );
  NOT _257_ (
    .A(_238_),
    .Y(_011_)
  );
  NOR _258_ (
    .A(_011_),
    .B(_235_),
    .Y(push1_synth)
  );
  NOR _259_ (
    .A(_011_),
    .B(_237_),
    .Y(push0_synth)
  );
  NOR _260_ (
    .A(contp0[1]),
    .B(contp0[0]),
    .Y(_012_)
  );
  NAND _261_ (
    .A(_012_),
    .B(contp0[2]),
    .Y(_013_)
  );
  NOR _262_ (
    .A(_229_),
    .B(_224_),
    .Y(_014_)
  );
  NOT _263_ (
    .A(fifo_empty3),
    .Y(_015_)
  );
  NOT _264_ (
    .A(fifo_empty2),
    .Y(_016_)
  );
  NOR _265_ (
    .A(_016_),
    .B(_015_),
    .Y(_017_)
  );
  NOT _266_ (
    .A(fifo_empty1),
    .Y(_018_)
  );
  NOT _267_ (
    .A(fifo_empty0),
    .Y(_019_)
  );
  NOR _268_ (
    .A(_019_),
    .B(_018_),
    .Y(_020_)
  );
  NAND _269_ (
    .A(_020_),
    .B(_017_),
    .Y(_021_)
  );
  NAND _270_ (
    .A(_021_),
    .B(_014_),
    .Y(_022_)
  );
  NOR _271_ (
    .A(_022_),
    .B(_013_),
    .Y(_023_)
  );
  NOT _272_ (
    .A(_023_),
    .Y(_024_)
  );
  NOT _273_ (
    .A(contp2[1]),
    .Y(_025_)
  );
  NOR _274_ (
    .A(_025_),
    .B(contp2[0]),
    .Y(_026_)
  );
  NOT _275_ (
    .A(_026_),
    .Y(_027_)
  );
  NOR _276_ (
    .A(_027_),
    .B(contp2[2]),
    .Y(_028_)
  );
  NAND _277_ (
    .A(contp1[1]),
    .B(contp1[0]),
    .Y(_029_)
  );
  NOR _278_ (
    .A(_029_),
    .B(contp1[2]),
    .Y(_030_)
  );
  NAND _279_ (
    .A(_030_),
    .B(_028_),
    .Y(_031_)
  );
  NOT _280_ (
    .A(_031_),
    .Y(_032_)
  );
  NAND _281_ (
    .A(_032_),
    .B(_015_),
    .Y(_033_)
  );
  NOR _282_ (
    .A(_033_),
    .B(_024_),
    .Y(_010_)
  );
  NOT _283_ (
    .A(_030_),
    .Y(_034_)
  );
  NOR _284_ (
    .A(_034_),
    .B(_013_),
    .Y(_035_)
  );
  NOT _285_ (
    .A(_035_),
    .Y(_036_)
  );
  NOR _286_ (
    .A(_036_),
    .B(_028_),
    .Y(_037_)
  );
  NOR _287_ (
    .A(_022_),
    .B(fifo_empty2),
    .Y(_038_)
  );
  NAND _288_ (
    .A(_038_),
    .B(_037_),
    .Y(_039_)
  );
  NOT _289_ (
    .A(_039_),
    .Y(_009_)
  );
  NAND _290_ (
    .A(_034_),
    .B(_018_),
    .Y(_040_)
  );
  NOR _291_ (
    .A(_040_),
    .B(_024_),
    .Y(_008_)
  );
  NOT _292_ (
    .A(_013_),
    .Y(_041_)
  );
  NOR _293_ (
    .A(_022_),
    .B(_041_),
    .Y(_042_)
  );
  NAND _294_ (
    .A(_042_),
    .B(_019_),
    .Y(_043_)
  );
  NOT _295_ (
    .A(_043_),
    .Y(_007_)
  );
  NOR _296_ (
    .A(_009_),
    .B(contp2[0]),
    .Y(_044_)
  );
  NOT _297_ (
    .A(_014_),
    .Y(_045_)
  );
  NOR _298_ (
    .A(_045_),
    .B(contp2[0]),
    .Y(_046_)
  );
  NOR _299_ (
    .A(_021_),
    .B(_224_),
    .Y(_047_)
  );
  NOT _300_ (
    .A(_047_),
    .Y(_048_)
  );
  NOR _301_ (
    .A(_035_),
    .B(_045_),
    .Y(_049_)
  );
  NOT _302_ (
    .A(_049_),
    .Y(_050_)
  );
  NAND _303_ (
    .A(_050_),
    .B(_048_),
    .Y(_051_)
  );
  NOR _304_ (
    .A(_051_),
    .B(_046_),
    .Y(_052_)
  );
  NOR _305_ (
    .A(_052_),
    .B(_044_),
    .Y(_006_[0])
  );
  NAND _306_ (
    .A(_051_),
    .B(contp2[1]),
    .Y(_053_)
  );
  NOT _307_ (
    .A(contp2[0]),
    .Y(_054_)
  );
  NOR _308_ (
    .A(contp2[1]),
    .B(_054_),
    .Y(_055_)
  );
  NAND _309_ (
    .A(_027_),
    .B(_016_),
    .Y(_056_)
  );
  NOR _310_ (
    .A(_056_),
    .B(_055_),
    .Y(_057_)
  );
  NOR _311_ (
    .A(_057_),
    .B(_022_),
    .Y(_058_)
  );
  NAND _312_ (
    .A(_058_),
    .B(_037_),
    .Y(_059_)
  );
  NAND _313_ (
    .A(_059_),
    .B(_053_),
    .Y(_006_[1])
  );
  NOT _314_ (
    .A(contp2[2]),
    .Y(_060_)
  );
  NOT _315_ (
    .A(_021_),
    .Y(_061_)
  );
  NOR _316_ (
    .A(_049_),
    .B(_061_),
    .Y(_062_)
  );
  NOR _317_ (
    .A(_062_),
    .B(_060_),
    .Y(_063_)
  );
  NOR _318_ (
    .A(_025_),
    .B(_054_),
    .Y(_064_)
  );
  NOT _319_ (
    .A(_064_),
    .Y(_065_)
  );
  NOR _320_ (
    .A(_065_),
    .B(contp2[2]),
    .Y(_066_)
  );
  NOR _321_ (
    .A(_064_),
    .B(_060_),
    .Y(_067_)
  );
  NOR _322_ (
    .A(_067_),
    .B(_066_),
    .Y(_068_)
  );
  NOR _323_ (
    .A(_068_),
    .B(_039_),
    .Y(_069_)
  );
  NOR _324_ (
    .A(_069_),
    .B(_063_),
    .Y(_070_)
  );
  NOR _325_ (
    .A(_070_),
    .B(_224_),
    .Y(_006_[2])
  );
  NOT _326_ (
    .A(contp1[0]),
    .Y(_071_)
  );
  NOR _327_ (
    .A(_042_),
    .B(_061_),
    .Y(_072_)
  );
  NOR _328_ (
    .A(_072_),
    .B(_071_),
    .Y(_073_)
  );
  NOR _329_ (
    .A(_040_),
    .B(_071_),
    .Y(_074_)
  );
  NAND _330_ (
    .A(_031_),
    .B(_023_),
    .Y(_075_)
  );
  NOR _331_ (
    .A(_075_),
    .B(_074_),
    .Y(_076_)
  );
  NOR _332_ (
    .A(_076_),
    .B(_073_),
    .Y(_077_)
  );
  NOR _333_ (
    .A(_077_),
    .B(_224_),
    .Y(_005_[0])
  );
  NOT _334_ (
    .A(contp1[1]),
    .Y(_078_)
  );
  NOR _335_ (
    .A(_072_),
    .B(_078_),
    .Y(_079_)
  );
  NOT _336_ (
    .A(_029_),
    .Y(_080_)
  );
  NOR _337_ (
    .A(contp1[1]),
    .B(contp1[0]),
    .Y(_081_)
  );
  NOR _338_ (
    .A(_081_),
    .B(_080_),
    .Y(_082_)
  );
  NOR _339_ (
    .A(_082_),
    .B(_040_),
    .Y(_083_)
  );
  NOR _340_ (
    .A(_083_),
    .B(_075_),
    .Y(_084_)
  );
  NOR _341_ (
    .A(_084_),
    .B(_079_),
    .Y(_085_)
  );
  NOR _342_ (
    .A(_085_),
    .B(_224_),
    .Y(_005_[1])
  );
  NOR _343_ (
    .A(_080_),
    .B(fifo_empty1),
    .Y(_086_)
  );
  NOR _344_ (
    .A(_086_),
    .B(_013_),
    .Y(_087_)
  );
  NOR _345_ (
    .A(_087_),
    .B(_045_),
    .Y(_088_)
  );
  NOR _346_ (
    .A(_088_),
    .B(_061_),
    .Y(_089_)
  );
  NAND _347_ (
    .A(reset_L),
    .B(contp1[2]),
    .Y(_090_)
  );
  NOR _348_ (
    .A(_090_),
    .B(_089_),
    .Y(_005_[2])
  );
  NOR _349_ (
    .A(_007_),
    .B(contp0[0]),
    .Y(_091_)
  );
  NAND _350_ (
    .A(_021_),
    .B(contp0[0]),
    .Y(_092_)
  );
  NAND _351_ (
    .A(_092_),
    .B(reset_L),
    .Y(_093_)
  );
  NOR _352_ (
    .A(_093_),
    .B(_091_),
    .Y(_004_[0])
  );
  NAND _353_ (
    .A(_047_),
    .B(contp0[1]),
    .Y(_094_)
  );
  NOT _354_ (
    .A(_012_),
    .Y(_095_)
  );
  NAND _355_ (
    .A(contp0[1]),
    .B(contp0[0]),
    .Y(_096_)
  );
  NAND _356_ (
    .A(_096_),
    .B(_095_),
    .Y(_097_)
  );
  NOR _357_ (
    .A(_097_),
    .B(fifo_empty0),
    .Y(_098_)
  );
  NAND _358_ (
    .A(_098_),
    .B(_014_),
    .Y(_099_)
  );
  NAND _359_ (
    .A(_099_),
    .B(_094_),
    .Y(_004_[1])
  );
  NOT _360_ (
    .A(contp0[2]),
    .Y(_100_)
  );
  NOR _361_ (
    .A(_048_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _362_ (
    .A(_096_),
    .B(contp0[2]),
    .Y(_102_)
  );
  NOR _363_ (
    .A(_097_),
    .B(_100_),
    .Y(_103_)
  );
  NOR _364_ (
    .A(_103_),
    .B(_102_),
    .Y(_104_)
  );
  NOR _365_ (
    .A(_104_),
    .B(_022_),
    .Y(_105_)
  );
  NOR _366_ (
    .A(_105_),
    .B(_101_),
    .Y(_106_)
  );
  NOT _367_ (
    .A(_075_),
    .Y(_107_)
  );
  NOT _368_ (
    .A(_042_),
    .Y(_108_)
  );
  NOR _369_ (
    .A(_108_),
    .B(_019_),
    .Y(_109_)
  );
  NOR _370_ (
    .A(_109_),
    .B(_107_),
    .Y(_110_)
  );
  NAND _371_ (
    .A(_110_),
    .B(_106_),
    .Y(_004_[2])
  );
  NOT _372_ (
    .A(cont3_synth[0]),
    .Y(_111_)
  );
  NOT _373_ (
    .A(fifo_af0),
    .Y(_112_)
  );
  NOT _374_ (
    .A(fifo_af1),
    .Y(_113_)
  );
  NAND _375_ (
    .A(_113_),
    .B(_112_),
    .Y(_114_)
  );
  NOT _376_ (
    .A(fifo_af2),
    .Y(_115_)
  );
  NOT _377_ (
    .A(fifo_af3),
    .Y(_116_)
  );
  NAND _378_ (
    .A(_116_),
    .B(_115_),
    .Y(_117_)
  );
  NOR _379_ (
    .A(_117_),
    .B(_114_),
    .Y(_118_)
  );
  NOR _380_ (
    .A(valid1),
    .B(valid0),
    .Y(_119_)
  );
  NAND _381_ (
    .A(_119_),
    .B(_231_),
    .Y(_120_)
  );
  NAND _382_ (
    .A(_120_),
    .B(_118_),
    .Y(_121_)
  );
  NOR _383_ (
    .A(_121_),
    .B(_236_),
    .Y(_122_)
  );
  NAND _384_ (
    .A(_122_),
    .B(_225_),
    .Y(_123_)
  );
  NOR _385_ (
    .A(_123_),
    .B(_111_),
    .Y(_124_)
  );
  NAND _386_ (
    .A(_123_),
    .B(_111_),
    .Y(_125_)
  );
  NAND _387_ (
    .A(_125_),
    .B(reset_L),
    .Y(_126_)
  );
  NOR _388_ (
    .A(_126_),
    .B(_124_),
    .Y(_003_[0])
  );
  NOT _389_ (
    .A(cont3_synth[1]),
    .Y(_127_)
  );
  NAND _390_ (
    .A(push3_synth),
    .B(cont3_synth[0]),
    .Y(_128_)
  );
  NOR _391_ (
    .A(_128_),
    .B(_127_),
    .Y(_129_)
  );
  NAND _392_ (
    .A(_128_),
    .B(_127_),
    .Y(_130_)
  );
  NAND _393_ (
    .A(_130_),
    .B(reset_L),
    .Y(_131_)
  );
  NOR _394_ (
    .A(_131_),
    .B(_129_),
    .Y(_003_[1])
  );
  NOT _395_ (
    .A(cont3_synth[2]),
    .Y(_132_)
  );
  NAND _396_ (
    .A(_124_),
    .B(cont3_synth[1]),
    .Y(_133_)
  );
  NOR _397_ (
    .A(_133_),
    .B(_132_),
    .Y(_134_)
  );
  NAND _398_ (
    .A(_133_),
    .B(_132_),
    .Y(_135_)
  );
  NAND _399_ (
    .A(_135_),
    .B(reset_L),
    .Y(_136_)
  );
  NOR _400_ (
    .A(_136_),
    .B(_134_),
    .Y(_003_[2])
  );
  NOT _401_ (
    .A(cont3_synth[3]),
    .Y(_137_)
  );
  NAND _402_ (
    .A(_129_),
    .B(cont3_synth[2]),
    .Y(_138_)
  );
  NOR _403_ (
    .A(_138_),
    .B(_137_),
    .Y(_139_)
  );
  NAND _404_ (
    .A(_138_),
    .B(_137_),
    .Y(_140_)
  );
  NAND _405_ (
    .A(_140_),
    .B(reset_L),
    .Y(_141_)
  );
  NOR _406_ (
    .A(_141_),
    .B(_139_),
    .Y(_003_[3])
  );
  NOT _407_ (
    .A(cont3_synth[4]),
    .Y(_142_)
  );
  NOR _408_ (
    .A(_139_),
    .B(_142_),
    .Y(_143_)
  );
  NAND _409_ (
    .A(_134_),
    .B(cont3_synth[3]),
    .Y(_144_)
  );
  NOR _410_ (
    .A(_144_),
    .B(cont3_synth[4]),
    .Y(_145_)
  );
  NOR _411_ (
    .A(_145_),
    .B(_143_),
    .Y(_146_)
  );
  NOR _412_ (
    .A(_146_),
    .B(_224_),
    .Y(_003_[4])
  );
  NOT _413_ (
    .A(cont2_synth[0]),
    .Y(_147_)
  );
  NOR _414_ (
    .A(_121_),
    .B(data_in[8]),
    .Y(_148_)
  );
  NAND _415_ (
    .A(_148_),
    .B(_225_),
    .Y(_149_)
  );
  NOR _416_ (
    .A(_149_),
    .B(_147_),
    .Y(_150_)
  );
  NAND _417_ (
    .A(_149_),
    .B(_147_),
    .Y(_151_)
  );
  NAND _418_ (
    .A(_151_),
    .B(reset_L),
    .Y(_152_)
  );
  NOR _419_ (
    .A(_152_),
    .B(_150_),
    .Y(_002_[0])
  );
  NOT _420_ (
    .A(cont2_synth[1]),
    .Y(_153_)
  );
  NAND _421_ (
    .A(push2_synth),
    .B(cont2_synth[0]),
    .Y(_154_)
  );
  NOR _422_ (
    .A(_154_),
    .B(_153_),
    .Y(_155_)
  );
  NAND _423_ (
    .A(_154_),
    .B(_153_),
    .Y(_156_)
  );
  NAND _424_ (
    .A(_156_),
    .B(reset_L),
    .Y(_157_)
  );
  NOR _425_ (
    .A(_157_),
    .B(_155_),
    .Y(_002_[1])
  );
  NOT _426_ (
    .A(cont2_synth[2]),
    .Y(_158_)
  );
  NAND _427_ (
    .A(_150_),
    .B(cont2_synth[1]),
    .Y(_159_)
  );
  NOR _428_ (
    .A(_159_),
    .B(_158_),
    .Y(_160_)
  );
  NAND _429_ (
    .A(_159_),
    .B(_158_),
    .Y(_161_)
  );
  NAND _430_ (
    .A(_161_),
    .B(reset_L),
    .Y(_162_)
  );
  NOR _431_ (
    .A(_162_),
    .B(_160_),
    .Y(_002_[2])
  );
  NOT _432_ (
    .A(cont2_synth[3]),
    .Y(_163_)
  );
  NAND _433_ (
    .A(_155_),
    .B(cont2_synth[2]),
    .Y(_164_)
  );
  NOR _434_ (
    .A(_164_),
    .B(_163_),
    .Y(_165_)
  );
  NAND _435_ (
    .A(_164_),
    .B(_163_),
    .Y(_166_)
  );
  NAND _436_ (
    .A(_166_),
    .B(reset_L),
    .Y(_167_)
  );
  NOR _437_ (
    .A(_167_),
    .B(_165_),
    .Y(_002_[3])
  );
  NOT _438_ (
    .A(cont2_synth[4]),
    .Y(_168_)
  );
  NOR _439_ (
    .A(_165_),
    .B(_168_),
    .Y(_169_)
  );
  NAND _440_ (
    .A(_160_),
    .B(cont2_synth[3]),
    .Y(_170_)
  );
  NOR _441_ (
    .A(_170_),
    .B(cont2_synth[4]),
    .Y(_171_)
  );
  NOR _442_ (
    .A(_171_),
    .B(_169_),
    .Y(_172_)
  );
  NOR _443_ (
    .A(_172_),
    .B(_224_),
    .Y(_002_[4])
  );
  NOT _444_ (
    .A(cont1_synth[0]),
    .Y(_173_)
  );
  NAND _445_ (
    .A(_238_),
    .B(_122_),
    .Y(_174_)
  );
  NOR _446_ (
    .A(_174_),
    .B(_173_),
    .Y(_175_)
  );
  NAND _447_ (
    .A(_174_),
    .B(_173_),
    .Y(_176_)
  );
  NAND _448_ (
    .A(_176_),
    .B(reset_L),
    .Y(_177_)
  );
  NOR _449_ (
    .A(_177_),
    .B(_175_),
    .Y(_001_[0])
  );
  NOT _450_ (
    .A(cont1_synth[1]),
    .Y(_178_)
  );
  NAND _451_ (
    .A(push1_synth),
    .B(cont1_synth[0]),
    .Y(_179_)
  );
  NOR _452_ (
    .A(_179_),
    .B(_178_),
    .Y(_180_)
  );
  NAND _453_ (
    .A(_179_),
    .B(_178_),
    .Y(_181_)
  );
  NAND _454_ (
    .A(_181_),
    .B(reset_L),
    .Y(_182_)
  );
  NOR _455_ (
    .A(_182_),
    .B(_180_),
    .Y(_001_[1])
  );
  NOT _456_ (
    .A(cont1_synth[2]),
    .Y(_183_)
  );
  NAND _457_ (
    .A(_175_),
    .B(cont1_synth[1]),
    .Y(_184_)
  );
  NOR _458_ (
    .A(_184_),
    .B(_183_),
    .Y(_185_)
  );
  NAND _459_ (
    .A(_184_),
    .B(_183_),
    .Y(_186_)
  );
  NAND _460_ (
    .A(_186_),
    .B(reset_L),
    .Y(_187_)
  );
  NOR _461_ (
    .A(_187_),
    .B(_185_),
    .Y(_001_[2])
  );
  NOT _462_ (
    .A(cont1_synth[3]),
    .Y(_188_)
  );
  NAND _463_ (
    .A(_180_),
    .B(cont1_synth[2]),
    .Y(_189_)
  );
  NOR _464_ (
    .A(_189_),
    .B(_188_),
    .Y(_190_)
  );
  NAND _465_ (
    .A(_189_),
    .B(_188_),
    .Y(_191_)
  );
  NAND _466_ (
    .A(_191_),
    .B(reset_L),
    .Y(_192_)
  );
  NOR _467_ (
    .A(_192_),
    .B(_190_),
    .Y(_001_[3])
  );
  NOT _468_ (
    .A(cont1_synth[4]),
    .Y(_193_)
  );
  NOR _469_ (
    .A(_190_),
    .B(_193_),
    .Y(_194_)
  );
  NAND _470_ (
    .A(_185_),
    .B(cont1_synth[3]),
    .Y(_195_)
  );
  NOR _471_ (
    .A(_195_),
    .B(cont1_synth[4]),
    .Y(_196_)
  );
  NOR _472_ (
    .A(_196_),
    .B(_194_),
    .Y(_197_)
  );
  NOR _473_ (
    .A(_197_),
    .B(_224_),
    .Y(_001_[4])
  );
  NOT _474_ (
    .A(cont0_synth[0]),
    .Y(_198_)
  );
  NAND _475_ (
    .A(_238_),
    .B(_148_),
    .Y(_199_)
  );
  NOR _476_ (
    .A(_199_),
    .B(_198_),
    .Y(_200_)
  );
  NAND _477_ (
    .A(_199_),
    .B(_198_),
    .Y(_201_)
  );
  NAND _478_ (
    .A(_201_),
    .B(reset_L),
    .Y(_202_)
  );
  NOR _479_ (
    .A(_202_),
    .B(_200_),
    .Y(_000_[0])
  );
  NOT _480_ (
    .A(cont0_synth[1]),
    .Y(_203_)
  );
  NAND _481_ (
    .A(push0_synth),
    .B(cont0_synth[0]),
    .Y(_204_)
  );
  NOR _482_ (
    .A(_204_),
    .B(_203_),
    .Y(_205_)
  );
  NAND _483_ (
    .A(_204_),
    .B(_203_),
    .Y(_206_)
  );
  NAND _484_ (
    .A(_206_),
    .B(reset_L),
    .Y(_207_)
  );
  NOR _485_ (
    .A(_207_),
    .B(_205_),
    .Y(_000_[1])
  );
  NOT _486_ (
    .A(cont0_synth[2]),
    .Y(_208_)
  );
  NAND _487_ (
    .A(_200_),
    .B(cont0_synth[1]),
    .Y(_209_)
  );
  NOR _488_ (
    .A(_209_),
    .B(_208_),
    .Y(_210_)
  );
  NAND _489_ (
    .A(_209_),
    .B(_208_),
    .Y(_211_)
  );
  NAND _490_ (
    .A(_211_),
    .B(reset_L),
    .Y(_212_)
  );
  NOR _491_ (
    .A(_212_),
    .B(_210_),
    .Y(_000_[2])
  );
  NOT _492_ (
    .A(cont0_synth[3]),
    .Y(_213_)
  );
  NAND _493_ (
    .A(_205_),
    .B(cont0_synth[2]),
    .Y(_214_)
  );
  NOR _494_ (
    .A(_214_),
    .B(_213_),
    .Y(_215_)
  );
  NAND _495_ (
    .A(_214_),
    .B(_213_),
    .Y(_216_)
  );
  NAND _496_ (
    .A(_216_),
    .B(reset_L),
    .Y(_217_)
  );
  NOR _497_ (
    .A(_217_),
    .B(_215_),
    .Y(_000_[3])
  );
  NOT _498_ (
    .A(cont0_synth[4]),
    .Y(_218_)
  );
  NOR _499_ (
    .A(_215_),
    .B(_218_),
    .Y(_219_)
  );
  NAND _500_ (
    .A(_210_),
    .B(cont0_synth[3]),
    .Y(_220_)
  );
  NOR _501_ (
    .A(_220_),
    .B(cont0_synth[4]),
    .Y(_221_)
  );
  NOR _502_ (
    .A(_221_),
    .B(_219_),
    .Y(_222_)
  );
  NOR _503_ (
    .A(_222_),
    .B(_224_),
    .Y(_000_[4])
  );
  DFF _504_ (
    .C(clk),
    .D(_007_),
    .Q(pop0_synth)
  );
  DFF _505_ (
    .C(clk),
    .D(_008_),
    .Q(pop1_synth)
  );
  DFF _506_ (
    .C(clk),
    .D(_009_),
    .Q(pop2_synth)
  );
  DFF _507_ (
    .C(clk),
    .D(_010_),
    .Q(pop3_synth)
  );
  DFF _508_ (
    .C(clk),
    .D(_000_[0]),
    .Q(cont0_synth[0])
  );
  DFF _509_ (
    .C(clk),
    .D(_000_[1]),
    .Q(cont0_synth[1])
  );
  DFF _510_ (
    .C(clk),
    .D(_000_[2]),
    .Q(cont0_synth[2])
  );
  DFF _511_ (
    .C(clk),
    .D(_000_[3]),
    .Q(cont0_synth[3])
  );
  DFF _512_ (
    .C(clk),
    .D(_000_[4]),
    .Q(cont0_synth[4])
  );
  DFF _513_ (
    .C(clk),
    .D(_001_[0]),
    .Q(cont1_synth[0])
  );
  DFF _514_ (
    .C(clk),
    .D(_001_[1]),
    .Q(cont1_synth[1])
  );
  DFF _515_ (
    .C(clk),
    .D(_001_[2]),
    .Q(cont1_synth[2])
  );
  DFF _516_ (
    .C(clk),
    .D(_001_[3]),
    .Q(cont1_synth[3])
  );
  DFF _517_ (
    .C(clk),
    .D(_001_[4]),
    .Q(cont1_synth[4])
  );
  DFF _518_ (
    .C(clk),
    .D(_002_[0]),
    .Q(cont2_synth[0])
  );
  DFF _519_ (
    .C(clk),
    .D(_002_[1]),
    .Q(cont2_synth[1])
  );
  DFF _520_ (
    .C(clk),
    .D(_002_[2]),
    .Q(cont2_synth[2])
  );
  DFF _521_ (
    .C(clk),
    .D(_002_[3]),
    .Q(cont2_synth[3])
  );
  DFF _522_ (
    .C(clk),
    .D(_002_[4]),
    .Q(cont2_synth[4])
  );
  DFF _523_ (
    .C(clk),
    .D(_003_[0]),
    .Q(cont3_synth[0])
  );
  DFF _524_ (
    .C(clk),
    .D(_003_[1]),
    .Q(cont3_synth[1])
  );
  DFF _525_ (
    .C(clk),
    .D(_003_[2]),
    .Q(cont3_synth[2])
  );
  DFF _526_ (
    .C(clk),
    .D(_003_[3]),
    .Q(cont3_synth[3])
  );
  DFF _527_ (
    .C(clk),
    .D(_003_[4]),
    .Q(cont3_synth[4])
  );
  DFF _528_ (
    .C(clk),
    .D(_004_[0]),
    .Q(contp0[0])
  );
  DFF _529_ (
    .C(clk),
    .D(_004_[1]),
    .Q(contp0[1])
  );
  DFF _530_ (
    .C(clk),
    .D(_004_[2]),
    .Q(contp0[2])
  );
  DFF _531_ (
    .C(clk),
    .D(_005_[0]),
    .Q(contp1[0])
  );
  DFF _532_ (
    .C(clk),
    .D(_005_[1]),
    .Q(contp1[1])
  );
  DFF _533_ (
    .C(clk),
    .D(_005_[2]),
    .Q(contp1[2])
  );
  DFF _534_ (
    .C(clk),
    .D(_006_[0]),
    .Q(contp2[0])
  );
  DFF _535_ (
    .C(clk),
    .D(_006_[1]),
    .Q(contp2[1])
  );
  DFF _536_ (
    .C(clk),
    .D(_006_[2]),
    .Q(contp2[2])
  );
  assign data_out_synth = 12'b000000000000;
endmodule
