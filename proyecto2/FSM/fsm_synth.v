/* Generated by Yosys 0.8 (git sha1 5706e90) */

(* top =  1  *)
(* src = "fsm_synth.v:1" *)
module fsm_synth(clk, reset_L, init, th_almost_full, th_almost_empty, fifos_empty, th_fifos_almost_full_synth, th_fifos_almost_empty_synth, idle_synth);
  (* src = "fsm_synth.v:20" *)
  wire [2:0] _000_;
  (* src = "fsm_synth.v:20" *)
  wire [2:0] _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
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
  (* src = "fsm_synth.v:4" *)
  input clk;
  (* src = "fsm_synth.v:6" *)
  input [8:0] fifos_empty;
  (* src = "fsm_synth.v:8" *)
  output idle_synth;
  (* src = "fsm_synth.v:4" *)
  input init;
  (* src = "fsm_synth.v:12" *)
  wire [2:0] mem_th_fifos_almost_empty_synth;
  (* src = "fsm_synth.v:12" *)
  wire [2:0] mem_th_fifos_almost_full_synth;
  (* src = "fsm_synth.v:4" *)
  input reset_L;
  (* onehot = 32'd1 *)
  wire [3:0] state;
  (* src = "fsm_synth.v:5" *)
  input [2:0] th_almost_empty;
  (* src = "fsm_synth.v:5" *)
  input [2:0] th_almost_full;
  (* src = "fsm_synth.v:7" *)
  output [2:0] th_fifos_almost_empty_synth;
  (* src = "fsm_synth.v:7" *)
  output [2:0] th_fifos_almost_full_synth;
  NOT _053_ (
    .A(init),
    .Y(_005_)
  );
  NOT _054_ (
    .A(th_fifos_almost_empty_synth[0]),
    .Y(_006_)
  );
  NOT _055_ (
    .A(th_almost_empty[1]),
    .Y(_007_)
  );
  NOT _056_ (
    .A(th_almost_empty[2]),
    .Y(_008_)
  );
  NOT _057_ (
    .A(reset_L),
    .Y(_037_)
  );
  NOT _058_ (
    .A(th_fifos_almost_full_synth[0]),
    .Y(_009_)
  );
  NOT _059_ (
    .A(th_fifos_almost_full_synth[1]),
    .Y(_010_)
  );
  NOT _060_ (
    .A(th_fifos_almost_full_synth[2]),
    .Y(_011_)
  );
  NOT _061_ (
    .A(fifos_empty[8]),
    .Y(_012_)
  );
  NOT _062_ (
    .A(state[1]),
    .Y(_013_)
  );
  NOR _063_ (
    .A(state[3]),
    .B(state[2]),
    .Y(_014_)
  );
  NOR _064_ (
    .A(_005_),
    .B(_014_),
    .Y(_015_)
  );
  NOR _065_ (
    .A(state[0]),
    .B(_015_),
    .Y(_016_)
  );
  NOR _066_ (
    .A(_037_),
    .B(_016_),
    .Y(_002_)
  );
  NOR _067_ (
    .A(init),
    .B(_037_),
    .Y(_017_)
  );
  NAND _068_ (
    .A(state[3]),
    .B(_017_),
    .Y(_018_)
  );
  NAND _069_ (
    .A(_005_),
    .B(state[2]),
    .Y(_019_)
  );
  NAND _070_ (
    .A(_013_),
    .B(_019_),
    .Y(_020_)
  );
  NAND _071_ (
    .A(reset_L),
    .B(state[1]),
    .Y(_021_)
  );
  NAND _072_ (
    .A(state[2]),
    .B(_017_),
    .Y(_022_)
  );
  NAND _073_ (
    .A(_021_),
    .B(_022_),
    .Y(_023_)
  );
  NAND _074_ (
    .A(reset_L),
    .B(_020_),
    .Y(_024_)
  );
  NAND _075_ (
    .A(fifos_empty[6]),
    .B(fifos_empty[7]),
    .Y(_025_)
  );
  NOR _076_ (
    .A(_012_),
    .B(_025_),
    .Y(_026_)
  );
  NAND _077_ (
    .A(fifos_empty[0]),
    .B(fifos_empty[1]),
    .Y(_027_)
  );
  NAND _078_ (
    .A(fifos_empty[3]),
    .B(fifos_empty[4]),
    .Y(_028_)
  );
  NAND _079_ (
    .A(fifos_empty[2]),
    .B(fifos_empty[5]),
    .Y(_029_)
  );
  NOR _080_ (
    .A(_027_),
    .B(_029_),
    .Y(_030_)
  );
  NAND _081_ (
    .A(_026_),
    .B(_030_),
    .Y(_031_)
  );
  NOR _082_ (
    .A(_028_),
    .B(_031_),
    .Y(_032_)
  );
  NAND _083_ (
    .A(_023_),
    .B(_032_),
    .Y(_033_)
  );
  NAND _084_ (
    .A(_018_),
    .B(_033_),
    .Y(_003_)
  );
  NOR _085_ (
    .A(_024_),
    .B(_032_),
    .Y(_004_)
  );
  NAND _086_ (
    .A(state[3]),
    .B(th_almost_empty[0]),
    .Y(_034_)
  );
  NOR _087_ (
    .A(state[3]),
    .B(_006_),
    .Y(_035_)
  );
  NOR _088_ (
    .A(_037_),
    .B(_035_),
    .Y(_036_)
  );
  NAND _089_ (
    .A(_034_),
    .B(_036_),
    .Y(_000_[0])
  );
  NOR _090_ (
    .A(state[3]),
    .B(th_fifos_almost_empty_synth[1]),
    .Y(_038_)
  );
  NAND _091_ (
    .A(state[3]),
    .B(_007_),
    .Y(_039_)
  );
  NAND _092_ (
    .A(reset_L),
    .B(_039_),
    .Y(_040_)
  );
  NOR _093_ (
    .A(_038_),
    .B(_040_),
    .Y(_000_[1])
  );
  NOR _094_ (
    .A(state[3]),
    .B(th_fifos_almost_empty_synth[2]),
    .Y(_041_)
  );
  NAND _095_ (
    .A(state[3]),
    .B(_008_),
    .Y(_042_)
  );
  NAND _096_ (
    .A(reset_L),
    .B(_042_),
    .Y(_043_)
  );
  NOR _097_ (
    .A(_041_),
    .B(_043_),
    .Y(_000_[2])
  );
  NAND _098_ (
    .A(state[3]),
    .B(th_almost_full[0]),
    .Y(_044_)
  );
  NOR _099_ (
    .A(state[3]),
    .B(_009_),
    .Y(_045_)
  );
  NOR _100_ (
    .A(_037_),
    .B(_045_),
    .Y(_046_)
  );
  NAND _101_ (
    .A(_044_),
    .B(_046_),
    .Y(_001_[0])
  );
  NAND _102_ (
    .A(state[3]),
    .B(th_almost_full[1]),
    .Y(_047_)
  );
  NOR _103_ (
    .A(state[3]),
    .B(_010_),
    .Y(_048_)
  );
  NOR _104_ (
    .A(_037_),
    .B(_048_),
    .Y(_049_)
  );
  NAND _105_ (
    .A(_047_),
    .B(_049_),
    .Y(_001_[1])
  );
  NAND _106_ (
    .A(state[3]),
    .B(th_almost_full[2]),
    .Y(_050_)
  );
  NOR _107_ (
    .A(state[3]),
    .B(_011_),
    .Y(_051_)
  );
  NOR _108_ (
    .A(_037_),
    .B(_051_),
    .Y(_052_)
  );
  NAND _109_ (
    .A(_050_),
    .B(_052_),
    .Y(_001_[2])
  );
  DFF _110_ (
    .C(clk),
    .D(_037_),
    .Q(state[0])
  );
  DFF _111_ (
    .C(clk),
    .D(_004_),
    .Q(state[1])
  );
  DFF _112_ (
    .C(clk),
    .D(_003_),
    .Q(state[2])
  );
  DFF _113_ (
    .C(clk),
    .D(_002_),
    .Q(state[3])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _114_ (
    .C(clk),
    .D(_001_[0]),
    .Q(th_fifos_almost_full_synth[0])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _115_ (
    .C(clk),
    .D(_001_[1]),
    .Q(th_fifos_almost_full_synth[1])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _116_ (
    .C(clk),
    .D(_001_[2]),
    .Q(th_fifos_almost_full_synth[2])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _117_ (
    .C(clk),
    .D(_000_[0]),
    .Q(th_fifos_almost_empty_synth[0])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _118_ (
    .C(clk),
    .D(_000_[1]),
    .Q(th_fifos_almost_empty_synth[1])
  );
  (* src = "fsm_synth.v:20" *)
  DFF _119_ (
    .C(clk),
    .D(_000_[2]),
    .Q(th_fifos_almost_empty_synth[2])
  );
  assign idle_synth = state[2];
  assign mem_th_fifos_almost_empty_synth = th_almost_empty;
  assign mem_th_fifos_almost_full_synth = th_almost_full;
endmodule
